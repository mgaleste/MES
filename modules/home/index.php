<?
$modulerecord 		=	new record('albumitems');
$coreFunc	 		=	new coreFunctions();
$currentUserId		=	$_SESSION['gp_username'];
$currentGroupId 	=	$coreFunc->getUsersGroup($currentUserId);
$currentModuleId	=	$coreFunc->getAvailableModule($currentGroupId);

$recon 					= 	new recordUpdate();


//get pagination results then assign to $article list
$list 					= $modulerecord->get_paginated_array(20);
$result 				= $list['result'];
$num_rows 				= $list['num_rows'];
$PAGINATION_LINKS 		= $list['PAGINATION_LINKS'];
$PAGINATION_INFO 		= $list['PAGINATION_INFO'];
$PAGINATION_TOTALRECS 	= $list['PAGINATION_TOTALRECS'];
$left_content 			= "";
  
/** ---------------------------------------------TEMPLATE PLUGIN MODULES---------------------------------------------* */

?>
<table width="100%" cellspacing="0" align="center" cellpadding="0" border="0">
    <tr><td height="5" colspan="3">&nbsp;</td></tr>
    <tr>
        <td width="45%" valign="top">
            <div class="info-tile">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    <tr><td align="left" colspan="12"><h4>LOTS by STATUS</h4></td></tr>
                    <tr>
<?
                        $retrieveLots = $recon->retrieveCustomQuery("SELECT count(*),name FROM `inventory` m join status using (statusid) where m.lotId <>0 and m.statusId <>'-1' group by m.statusid");
                        
                        if(!empty($retrieveLots)){
                        
                        $cnt=0;
                            foreach($retrieveLots as $sites){
                                $site = explode("|",$sites);
                                $style= ($cnt<(count($retrieveSites)-1))? 'style="border-right:solid"' : '';
                                $statusColor = $recon->GetValue('color','status','name="'.$site[1].'" and type="lot"');
                                echo "<td align=\"left\" valign=\"center\" $style >";
                                    echo "<b style=\"color:#{$statusColor};font-size:15pt\">{$site[0]}</b> <span>".stripslashes(ucwords($site[1]))."</span>&nbsp;";
                                echo "</td><td width=\"2%\"></td>";
                                $cnt++;
                            }
                        }else{
                          echo "<td width=\"2%\"><b style=\"font-size:15pt\">No Lot(s)</b></td>";
                        }
?>
                    </tr>
                </table>
            </div>
        </td>
        <td></td>
        <td width="45%" valign="top">
            <div class="info-tile">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    <tr><td align="left"><h4>LOTS per ITEM</h4></td></tr>

<?
                        $retrieveLots = $recon->retrieveCustomQuery("SELECT count(*),itemName,m.statusId FROM `inventory` m join item i using (itemId) where m.lotId <>0 and m.statusId <>'-1' group by m.itemId, m.statusId");

                        if(!empty($retrieveLots)){

                        $cnt=0;
                            foreach($retrieveLots as $sites){
                                $site = explode("|",$sites);
                                
                                $statusColor = $recon->GetValue('color','status','statusId="'.$site[2].'" and type="lot"');
                                $statusName = $recon->GetValue('name','status','statusId="'.$site[2].'" and type="lot"');
                                echo "<tr><td align=\"left\" valign=\"center\">";
                                    echo "<b style=\"color:#{$statusColor};font-size:15pt\">{$site[0]}</b> <span>{$statusName} ".stripslashes(ucwords($site[1]))."</span>&nbsp;";
                                echo "</td></tr>";
                                
                            }
                        }else{
                          echo "<tr><td width=\"2%\"><b style=\"font-size:15pt\">No Lot(s)</b></td></tr>";
                        }
?>

                </table>
            </div>
        </td>
    </tr>
     <tr><td height="5" colspan="3">&nbsp;</td></tr>
    <tr>
        <td width="45%" valign="top">
            <div class="info-tile">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    
                    <tr>
                        <td>
<?
                        $retrieveLots = $recon->retrieveCustomQuery("SELECT count(*),name FROM `inventory` m join status using (statusid) where m.lotId <>0 and m.statusId <>'-1' group by m.statusid");

                        if(!empty($retrieveLots)){
                            foreach($retrieveLots as $sites){

                            $data = explode("|",$sites);
                            $dataPoints['y'] = $data[0];
                            $dataPoints['label'] = $data[1];

                            $dataPoint[] = json_encode($dataPoints, JSON_NUMERIC_CHECK);
                            $dataPointStr = implode(',',$dataPoint);
                            }
                        
?>
                            <div id="chartContainer" style="width:98%;height: 220px;display: inline-block;"></div>

                            <script type="text/javascript">
                            $(function () {
                                var chart = new CanvasJS.Chart("chartContainer", {
                                    theme: "light2",
                                    zoomEnabled: true,
                                    animationEnabled: false,
                                    title: {
                                        text: "LOTS by STATUS"
                                    },
                                    data: [
                                    {
                                        type: "column",
                                        dataPoints: [<?=$dataPointStr?>]
                                    }
                                    ]
                                });
                                chart.render();
                            });
                            </script>
<?
                        }else{
                          echo "<tr><td width=\"2%\"><b style=\"font-size:15pt\">No Lot(s) by STATUS</b></td></tr>";
                        }
?>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td></td>
        <td width="45%" valign="top">
            <div class="info-tile">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    <tr><td align="left" colspan="3"><h4>ITEM by STATUS</h4></td></tr>
                    <tr><td>Item</td><td>Active BOM</td><td>Active Route</td></tr>

<?
                        $retrieveLots = $recon->retrieveCustomQuery("SELECT itemId, itemName, itemCode from item where itemTypeId in (2,3) and statusId <> -1");

                        if(!empty($retrieveLots)){

                        $cnt=0;
                            foreach($retrieveLots as $sites){
                                $site = explode("|",$sites);
                                
                                $billofmaterialsId = $recon->GetValue('billofmaterialsId','billofmaterials','itemId="'.$site[0].'" and statusId=0');
                                $routeId = $recon->GetValue('routeId','route','itemId="'.$site[0].'" and statusId=0');
                                echo "<tr><td align=\"left\" valign=\"center\" $style >";
                                    echo "<span>".stripslashes(ucwords($site[1]))."</span> | <span>".stripslashes(ucwords($site[2]))."</span>";
                                echo "</td>";
                                $bom = ($billofmaterialsId)? '<b style="color:#00ff00">YES</b>':'<b style="color:#ff0000">NO</b>';
                                $route = ($routeId)? '<b style="color:#00ff00">YES</b>':'<b style="color:#ff0000">NO</b>';
                                echo "<td>$bom</td>";
                                echo "<td>$route</td></tr>";
                                
                            }
                        }else{
                          echo "<tr><td width=\"2%\"><b style=\"font-size:15pt\">Items by STATUS</b></td></tr>";
                        }
?>

                </table>
            </div>
        </td>
    </tr>
    <tr><td height="5" colspan="3">&nbsp;</td></tr>
    <tr>
        <td width="45%" valign="top">
            <div class="info-tile">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                     <tr>
                        <td>
<?
                        $retrieveLots = $recon->retrieveCustomQuery("SELECT count(*),processName FROM `inventory` m join process using (processId) where m.lotId <>0 and m.statusId <>'-1' group by processName");
                        if(!empty($retrieveLots)){
                            foreach($retrieveLots as $sites){

                            $data = explode("|",$sites);
                            $dataPoints2['y'] = $data[0];
                            $dataPoints2['label'] = $data[1];

                            $dataPoint2[] = json_encode($dataPoints2, JSON_NUMERIC_CHECK);
                            $dataPointStr = implode(',',$dataPoint2);
                            }

?>
                            <div id="chartContainer2" style="width:98%;height: 220px;display: inline-block;"></div>

                            <script type="text/javascript">
                            $(function () {
                                var chart = new CanvasJS.Chart("chartContainer2", {
                                    theme: "light2",
                                    zoomEnabled: true,
                                    animationEnabled: false,
                                    title: {
                                        text: "LOTS by PROCESS"
                                    },
                                    data: [
                                    {
                                        type: "column",
                                        dataPoints: [<?=$dataPointStr?>]
                                    }
                                    ]
                                });
                                chart.render();
                            });
                            </script>
<?
                        }else{
                          echo "<tr><td width=\"2%\"><b style=\"font-size:15pt\">No Lot(s) by PROCESS</b></td></tr>";
                        }
?>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        <td></td>
        <td width="45%" valign="top">
           <div class="info-tile">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">

                    <tr>
                        <td>
<?
                        $retrieveLots = $recon->retrieveCustomQuery("SELECT sum(quantity),itemName FROM `inventory` m join item using (itemId) where m.statusId <>'-1' group by itemName");
                        if(!empty($retrieveLots)){
                            foreach($retrieveLots as $sites){
                            $data = explode("|",$sites);
                            $dataPoints3['y'] = $data[0];
                            $dataPoints3['label'] = $data[1];

                            $dataPoint3[] = json_encode($dataPoints3, JSON_NUMERIC_CHECK);
                            $dataPointStr = implode(',',$dataPoint3);
                            }

?>
                            <div id="chartContainer3" style="width:98%;height: 220px;display: inline-block;"></div>

                            <script type="text/javascript">
                            $(function () {
                                var chart = new CanvasJS.Chart("chartContainer3", {
                                    theme: "light2",
                                    zoomEnabled: true,
                                    animationEnabled: false,
                                    title: {
                                        text: "INVENTORY LEVEL"
                                    },
                                    data: [
                                    {
                                        type: "column",
                                        dataPoints: [<?=$dataPointStr?>]
                                    }
                                    ]
                                });
                                chart.render();
                            });
                            </script>
<?
                        }else{
                          echo "<tr><td width=\"2%\"><b style=\";font-size:15pt\">No Items in INVENTORY</b></td></tr>";
                        }
?>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
        </tr>
    </table>

