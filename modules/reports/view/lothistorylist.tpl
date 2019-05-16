		 
	 
	 
	<tr>
		<td colspan="2">
			<form method="POST"  onsubmit="return ValidateForm(this, 'delAnn[]');">

			<table width="100%" cellpadding="0" cellspacing="0">					
					<tr>
						<td colspan="10">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr valign="middle">															 
									<td class="verdana10"></td>
                                                                        <td class="verdana10"><a href="index.php?mod=<?=$mod?>&type=<?=$type?>&cat=<?=$cat?>&export=1&search=<?=$psearch?>" class="sub_link"><img src="<?=MODIMAGES;?>assigned.jpg" height="16" border="0" alt=""> Export Report</a></td>
									<td  align="right" class="verdana10"><?= $log->showItems();?></td>
								</tr>
							</table>
						</td>
					</tr> 
					<tr><td colspan="10">&nbsp;</td></tr>
					<tr valign="middle">
						<td width="5%" align="center" class="table_line1_left"></td>
						<td width="10%" class="table_line1_left paddleft">&nbsp;LOT CODE</td>
						<td width="10%" class="table_line1_left paddleft">&nbsp;ITEM</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;PROCESS</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;MACHINE</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;QUANTITY</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;ACTION</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;USER</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;DATE</td>
						<td width="10%" class="table_line1_left_right paddleft">&nbsp;STATUS</td>
					</tr>
					<tr valign="middle"><td class="bar" colspan="5"></td></tr>
			<?php
				$bgcolor = "";
				if($num_rows>0){	
					for($i=0;$i<$num_rows;$i++){
					
						$ids 				= mysql_result($result, $i, "lothistoryId");
						$lotId                          = mysql_result($result, $i, "lotId");
						$statusId		 	= mysql_result($result, $i, "statusId");
						$processId		 	= mysql_result($result, $i, "processId");
                                                $machineId		 	= mysql_result($result, $i, "machineId");
                                                $quantity		 	= mysql_result($result, $i, "quantity");
                                                $remarks		 	= mysql_result($result, $i, "remarks");
                                                $enteredBy		 	= mysql_result($result, $i, "enteredBy");
                                                $enteredDate		 	= mysql_result($result, $i, "enteredDate");

                                                $lotCode                    = $recon->GetValue('lotCode','lot','lotId="'.$lotId.'"');
                                                $itemId                    = $recon->GetValue('itemId','inventory','lotId="'.$lotId.'"');
                                                $item                    = $recon->GetValue("concat(itemCode,'|',itemName)",'item','itemId="'.$itemId.'"');
                                                $process                    = $recon->GetValue("concat(processCode,'|',processName)",'process','processId="'.$processId.'"');
                                                $machine                    = $recon->GetValue("concat(machineCode,'|',machineName)",'machine','machineId="'.$machineId.'"');
                                                $color                    = $recon->GetValue('color','status','statusId="'.$statusId.'"');
                                                $status                    = $recon->GetValue('name','status','statusId="'.$statusId.'"');

						$modtype 			= $type;						  
						
							
							$bgcolor = ($bgcolor != "#FFFFFF")? "#FFFFFF" : "#EFEFEF"; 							
							echo "<tr bgcolor=\"$bgcolor\">";								 												
							echo '	<td align="center" class="table_line2_left">'.$ids.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$lotCode.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$item.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$process.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$machine.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$quantity.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$remarks.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$enteredBy.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$enteredDate.'</td>
									<td class="paddleft table_line2_left_right" valign="top" align="left" style="color:#'.$color.'">&nbsp;'.$status.'</td>';
							echo '</tr>';
					}
				}else{
					echo '<tr valign="middle" width="20px"><td colspan="10" class="table_line2_left table_line2_left_right" align="center"><p class="errmsg">NO RECORDS FOUND</p></td></tr>';
				}
				echo '<tr valign="middle"><td class="bar" colspan="10"></td></tr>
					<tr valign="middle">
						<td class="table_footer_left" align="center" colspan="8">&nbsp;'.$PAGINATION_INFO.'</td>
						<td class="table_footer_left_right" align="center" colspan="2"><span class="link">'.$PAGINATION_LINKS.'</span></td>';		
				?>		
				 
			</table>
			</form>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<?

if($export_excel){
$excel = '<html><body><table width="100%" cellpadding="0" cellspacing="0"><tr valign="middle">
						<td width="5%" align="center" class="table_line1_left"></td>
						<td width="10%" class="table_line1_left paddleft">&nbsp;LOT CODE</td>
						<td width="10%" class="table_line1_left paddleft">&nbsp;ITEM</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;PROCESS</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;MACHINE</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;QUANTITY</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;ACTION</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;USER</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;DATE</td>
						<td width="10%" class="table_line1_left_right paddleft">&nbsp;STATUS</td>
					</tr>
					<tr valign="middle"><td class="bar" colspan="10"></td></tr>';
$result = mysql_query($paginate_arr['paginatequery'].$paginate_arr['addquery'].$paginate_arr['query'] );
$num_rows = @mysql_num_rows($result);
for($i=0;$i<$num_rows;$i++){

            $ids 				= mysql_result($result, $i, "lothistoryId");
            $lotId                          = mysql_result($result, $i, "lotId");
            $statusId		 	= mysql_result($result, $i, "statusId");
            $processId		 	= mysql_result($result, $i, "processId");
            $machineId		 	= mysql_result($result, $i, "machineId");
            $quantity		 	= mysql_result($result, $i, "quantity");
            $remarks		 	= mysql_result($result, $i, "remarks");
            $enteredBy		 	= mysql_result($result, $i, "enteredBy");
            $enteredDate		 	= mysql_result($result, $i, "enteredDate");

            $lotCode                    = $recon->GetValue('lotCode','lot','lotId="'.$lotId.'"');
            $itemId                    = $recon->GetValue('itemId','inventory','lotId="'.$lotId.'"');
            $item                    = $recon->GetValue("concat(itemCode,'|',itemName)",'item','itemId="'.$itemId.'"');
            $process                    = $recon->GetValue("concat(processCode,'|',processName)",'process','processId="'.$processId.'"');
            $machine                    = $recon->GetValue("concat(machineCode,'|',machineName)",'machine','machineId="'.$machineId.'"');
            $color                    = $recon->GetValue('color','status','statusId="'.$statusId.'"');
            $status                    = $recon->GetValue('name','status','statusId="'.$statusId.'"');

            $modtype 			= $type;


                    $bgcolor = ($bgcolor != "#FFFFFF")? "#FFFFFF" : "#EFEFEF";
                    $excel .= "<tr bgcolor=\"$bgcolor\">";
                     $excel .= <td align="center" class="table_line2_left">'.$ids.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$lotCode.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$item.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$process.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$machine.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$quantity.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$remarks.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$enteredBy.'</td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$enteredDate.'</td>
									<td class="paddleft table_line2_left_right" valign="top" align="left" style="color:#'.$color.'">&nbsp;'.$status.'</td>';
							 $excel .=  '</tr>';
    }

$excel .='</table></body></html>';

$fp = fopen('pdf_reports/lothistory_'.$datetime.'.xls', "wb");

chmod('pdf_reports/lothistory_'.$datetime.'.xls',0777);
fwrite($fp, $excel);
fclose($fp);

header('Content-Description: File Transfer');
	header('Content-Type: application/octet-stream');
	header('Content-Disposition: inline; filename='.basename('pdf_reports/lothistory_'.$datetime.'.xls'));
	header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
	header('Pragma: public');
	header('Content-Length: ' . filesize('pdf_reports/lothistory_'.$datetime.'.xls'));
	ob_clean();
	flush();
	readfile('pdf_reports/lothistory_'.$datetime.'.xls');
	exit;

	ob_end_flush();
}
?>