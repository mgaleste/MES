<div class="idTabs">
  <ul>
    <li><a href="#clientinfo" tabindex="-1">Machine Information</a></li>
  </ul>
<div class="items">
<form method="POST" id="clientinfo_Form">
<table width="100%" class="form " id="clientinfo" cellpadding="10" cellspacing="10" border="0">
<tr><td align="center" class="req"><?=$error_messages;?></td></tr>
<tr valign="top" >
		<td style="width:95%; height:100%;" >
			<table width="100%" border="0" cellpadding="2" cellspacing="2">
				<tr>
					<td style="width:10%"><?=$mform->label('machineName',"Machine Name","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','machineName',$machineName,'flat_input','machineName','50','','','1');?></td>
                                        <td style="width:10%"><?=$mform->label('machineCode',"Machine Code","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','machineCode',$machineCode,'flat_input','machineCode','50','','','1');?></td>

                                </tr>
                               

				<tr>
					<td colspan="4"><hr/></td>
				</tr>
                                <tr>
					<td style="width:10%"><?=$mform->label('process',"Process","","req")?></td>
					<td style="width:20%">
                                                <select name="processId" >
                                                <option value=""> --Select One-- </option>
                                                <?
								$retrieveProcess = $recon->retrieveCustomQuery("SELECT processId, processName, processCode FROM process where isMachine=1 order by processName");
								foreach($retrieveProcess as $Processes){
									$process = explode("|",$Processes);
                                                                        $selected = ($processId==$process[0])? 'selected' : '';
									echo '<option value="'.$process[0].'" '.$selected.'>'.$process[1].' | '.$process[2].'</option>';
								}
							?>
                                                </select>
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