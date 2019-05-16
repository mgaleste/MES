<div class="idTabs">
  <ul>
    <li><a href="#clientinfo" tabindex="-1">Process Information</a></li>
  </ul>
<div class="items">
<form method="POST" id="clientinfo_Form">
<table width="100%" class="form " id="clientinfo" cellpadding="10" cellspacing="10" border="0">
<tr><td align="center" class="req"><?=$error_messages;?></td></tr>
<tr valign="top" >
		<td style="width:95%; height:100%;" >
			<table width="100%" border="0" cellpadding="2" cellspacing="2">
				<tr>
					<td style="width:10%"><?=$mform->label('processName',"Process Name","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','processName',$processName,'flat_input','processName','50','','','1');?></td>
                                        <td style="width:10%"><?=$mform->label('processCode',"Process Code","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','processCode',$processCode,'flat_input','processCode','50','','','2');?></td>

                               </tr>
                               <tr>
					<td colspan="4"><hr/></td>
				</tr>
				<tr>
                                        <?

                                            $manualCheck = ($task=='edit' && $isManual=='Yes')? 'checked="checked"' : '';
                                            $machineCheck = ($task=='edit' && $isMachine=='Yes')? 'checked="checked"' : '';
                                            $inspectCheck = ($task=='edit' && $isInspected=='Yes')? 'checked="checked"' : '';
                                            $subconCheck = ($task=='edit' && $isSubcon=='Yes')? 'checked="checked"' : '';
                                            $multiCheck = ($task=='edit' && $multiOut=='Yes')? 'checked="checked"' : '';

                                            $isManual = ($task!='view')? 1 : $isManual;
                                            $isMachine = ($task!='view')? 1 : $isMachine;
                                            $isInspected = ($task!='view')? 1 : $isInspected;
                                            $isSubcon = ($task!='view')? 1 : $isSubcon;
                                            $multiOut = ($task!='view')? 1 : $multiOut;

                                            
                                        ?>
					<td style="width:10%"><?=$mform->label('isManual',"Manual","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'checkbox','isManual',$isManual,'flat_input','isManual','50','onClick="disable(\'isMachine\');disable(\'isSubcon\');disable(\'isInspected\')" '.$manualCheck,'','3');?></td>
                                        <td style="width:10%"><?=$mform->label('isMachine',"Machine","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'checkbox','isMachine',$isMachine,'flat_input','isMachine','50','onClick="disable(\'isManual\');disable(\'isSubcon\');disable(\'isInspected\')" '.$machineCheck,'','4');?></td>

                                        
				</tr>
                                <tr>
					<td style="width:10%"><?=$mform->label('isInspected',"Inspected","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'checkbox','isInspected',$isInspected,'flat_input','isInspected','50','onClick="disable(\'isSubcon\');disable(\'isManual\');disable(\'isMachine\')" '.$inspectCheck,'','5');?></td>
                                        <td style="width:10%"><?=$mform->label('isSubcon',"Subcontracted","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'checkbox','isSubcon',$isSubcon,'flat_input','isSubcon','50','onClick="disable(\'isManual\');disable(\'isMachine\');disable(\'isInspected\')" '.$subconCheck,'','6');?></td>


				</tr>
                                <tr>
					<td style="width:10%"><?=$mform->label('multiOut',"Multiple Output","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'checkbox','multiOut',$multiOut,'flat_input','multiOut','50',''.$multiCheck,'','5');?></td>

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

<script type="text/javascript">
function disable(id){
    document.getElementById(id).disabled = (document.getElementById(id).disabled)? '' : 'disabled';  
}

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