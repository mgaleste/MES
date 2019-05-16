<div class="idTabs">
  <ul>
    <li><a href="#clientinfo" tabindex="-1">Bill Of Materials Information</a></li>
  </ul>
<div class="items">
<form method="POST" id="clientinfo_Form">
<table width="100%" class="form " id="clientinfo" cellpadding="10" cellspacing="10" border="0">
<tr><td align="center" class="req"><?=$error_messages;?></td></tr>
<tr valign="top" >
		<td style="width:95%; height:100%;" >
			<table width="100%" border="0" cellpadding="2" cellspacing="2">
				<tr>
					<td style="width:10%"><?=$mform->label('itemId',"Item","","req")?></td>
					<td style="width:20%">
                                                <select name="itemId" >
                                                <option value=""> --Select One-- </option>
                                                <?
								$retrieveItems = $recon->retrieveCustomQuery("SELECT itemId, itemName, itemCode FROM item where itemTypeId in (2,3) and statusId <>-1 order by itemName");
								foreach($retrieveItems as $Items){
									$item = explode("|",$Items);
                                                                        $selected = ($itemId==$item[0])? 'selected' : '';
									echo '<option value="'.$item[0].'" '.$selected.'>'.$item[1].' | '.$item[2].'</option>';
								}
							?>
                                                </select>
                                        </td>
				</tr>
                               <tr>
					<td colspan="4"><hr/></td>
				</tr>
                                <tr>
					<td colspan="4"><b><?=$mform->label('materialsList',"Materials List","","req")?></b></td>
				</tr>
				<tr>
					<td colspan="4">
                                            <table id="materialsListTable">
                                                <tbody>
                                                    <tr>
                                                        <? if($task <> 'view'){ ?>
                                                            <th><a class="nostyle" tabindex="-1" href="#" onclick="deleteRow('materialsListTable');"   style="cursor:pointer" title="Delete Selected Details"> <img border="0" src="view/template1/moduleicons/bin.gif" alt="Delete"/></a></th>
                                                        <? } ?>
                                                        
                                                        <th>Material</th><th>Usage Quantity</th><th>Base Quantity</th></tr>
                                                     <? if($task=='create'){ ?>
                                                    <tr class="clone">
                                                        <td><input type="checkbox" name="chk[]" value="yes"></td>
                                                        <td>
                                                            <select name="itemIds[]" >
                                                            <option value=""> --Select One-- </option>
                                                            <?
                                                                            $retrieveItems = $recon->retrieveCustomQuery("SELECT itemId, itemName, itemCode FROM item where itemTypeId in (1,3,4) and statusId <>-1 order by itemName");
                                                                            foreach($retrieveItems as $Items){
                                                                                    $item = explode("|",$Items);
                                                                                    $selected = ($itemId==$item[0])? 'selected' : '';
                                                                                    echo '<option value="'.$item[0].'" '.$selected.'>'.$item[1].' | '.$item[2].'</option>';
                                                                            }
                                                                    ?>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <?=$mform->inputBox($task,'text','usageQuantity[]',$usageQuantity,'flat_input','usageQuantity','50','','','1');?>
                                                        </td>
                                                        <td>
                                                            <?=$mform->inputBox($task,'text','baseQuantity[]',1,'flat_input','baseQuantity','50','readOnly','','1');?>
                                                        </td>
                                                    </tr>
                                                    <? }else if ($task=='edit'){ 
                                                    $retrieveProcessDetails = $recon->retrieveCustomQuery("SELECT itemId, usageQuantity FROM billofmaterialsdetails where billofmaterialsId='$sid' order by billofmaterialsdetailsId");
                                                     foreach($retrieveProcessDetails as $processDetail){
                                                     $materials = explode("|",$processDetail);
                                                    ?>
                                                    <tr class="clone">
                                                        <td><input type="checkbox" name="chk[]" value="yes"></td>
                                                        <td>
                                                            <select name="itemIds[]" >
                                                            <option value=""> --Select One-- </option>
                                                            <?
                                                                            $retrieveItems = $recon->retrieveCustomQuery("SELECT itemId, itemName, itemCode FROM item where itemTypeId in (1,3,4) order by itemName");
                                                                            foreach($retrieveItems as $Items){
                                                                                    $item = explode("|",$Items);
                                                                                    $selected = ($materials[0]==$item[0])? 'selected' : '';
                                                                                    echo '<option value="'.$item[0].'" '.$selected.'>'.$item[1].' | '.$item[2].'</option>';
                                                                            }
                                                                    ?>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <?=$mform->inputBox($task,'text','usageQuantity[]',$materials[1],'flat_input','usageQuantity','50','','','1');?>
                                                        </td>
                                                        <td>
                                                            <?=$mform->inputBox($task,'text','baseQuantity[]',1,'flat_input','baseQuantity','50','readOnly','','1');?>
                                                        </td>
                                                    </tr>
                                                    <? }
                                                    }else{
                                                     $retrieveProcessDetails = $recon->retrieveCustomQuery("SELECT concat(p.itemName,':',p.itemCode), rd.usageQuantity FROM billofmaterialsdetails rd join item p using (itemId) where rd.billofmaterialsId='$sid' order by rd.billofmaterialsdetailsId");
                                                     foreach($retrieveProcessDetails as $processDetail){
                                                     $materials = explode("|",$processDetail);
                                                    ?>

                                                    <tr>
                                                        <td><?=str_replace(':',' | ',$materials[0])?></td><td align="center"><?=$materials[1]?></td><td align="center">1</td>
                                                    </tr>
                                                    <? }
                                                    } ?>
                                                </tbody>
                                                <? if($task <> 'view'){ ?>
                                                    <tr>
                                                        <td colspan="2">
								<a class="nostyle" style="font-size:8px" href="#" onCLick="addRow('materialsListTable')">[ + Add More ]</a>
							</td>
                                                    </tr>
                                                    <? } ?>
                                            </table>
                                        </td>
				</tr>

			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="right">
			<?php
			if($task!='view'){
				echo $mform->inputBox($task,'submit','Save','Save','flat_button','Save','','" ','','23');
				echo '&nbsp;&nbsp;&nbsp;';
				echo $mform->inputBox($task,'button','cancel','Cancel','flat_button','cancel','',' onClick="cancelChanges(\'index.php?mod='.$mod.'&type='.$type.'\');" ','','24');
			}else{
				echo $mform->inputBox($taskView,'button','edit','Edit','flat_button','edit','',' onClick="redirect(\'index.php?mod='.$mod.'&type='.$type.'&task=edit&sid='.$sid.'\');" ','','23');
				echo '&nbsp;&nbsp;&nbsp;';
				echo $mform->inputBox($task,'button','cancel','Cancel','flat_button','cancel','',' onClick="cancelChanges(\'index.php?mod='.$mod.'&type='.$type.'\');" ','','24');
			}
			
                        echo $mform->inputBox($task,'hidden','task',$_GET['task'],'flat_input','task','60','','','-1');
                        ?>
		</td>
	</tr>
</table>
</form>
</div>
<style>
</style>
<script type="text/javascript">
function addRow(tableID){
var x = document.getElementById(tableID).tBodies[0];
var node=x.rows[1].cloneNode(true);
x.appendChild(node);

}

function deleteRow(tableID) {
        try {
        var table = document.getElementById(tableID);

        var rowCount = table.rows.length;
        
        for(var i=0; i<rowCount; i++) {
            var row = table.rows[i];
            var chkbox = row.cells[0].childNodes[0];
            if(null != chkbox && true == chkbox.checked) {
                if(rowCount <= 1) {
                    alert("Cannot delete all the rows.");
                    break;
                }
                table.deleteRow(i);
                rowCount--;
                i--;
            }

        }
        
        }catch(e) {
           alert(e);
        }
    }
</script>

<script type="text/javascript">
/**VALIDATION FOR NUMERIC FIELDS**/
	function isNumberKey(evt,exemptChar) {
		if(evt.which != 0){
			var charCode = (evt.which) ? evt.which : event.keyCode
			if(charCode == exemptChar) return true;
			if (charCode > 31 && (charCode < 48 || charCode > 57))
			return false;
			return true;
		}
	}
/**CANCEL CHANGES**/
	function cancelChanges(url)
	{
		var task= document.getElementById('task').value;
		if(task != 'view'){
			
			var prompt_text = "Are you sure you want to cancel all changes?";
			$.prompt(prompt_text,
			{buttons:{Yes:1, No:0},
			submit: function(e,v,m,f){
				if(v==1){
					$.prompt.close();
					if(task == 'create'){
						location.href = url;
					}else if(task == 'edit'){
						location.href = url;
					}
				}
			}
			});
		}else{
			location.href = url;
		}
		localStorage.clear();
	}

	/**REDIRECT**/
	function redirect(url)
	{
		location.href = url;
	}
</script>