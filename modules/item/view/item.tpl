<style>
#map-wrapper{position:relative;}
#ovelay-dots{position:absolute;}
</style>
<div class="idTabs">
  <ul>
    <li><a href="#clientinfo" tabindex="-1">Service Site Information</a></li>
  </ul>
<div class="items">
<form method="POST" id="clientinfo_Form">
<table width="100%" class="form " id="clientinfo" cellpadding="10" cellspacing="10" border="0">
<tr><td align="center" class="req"><?=$error_messages;?></td></tr>
<tr valign="top" >
		<td style="width:95%; height:100%;" >
			<table width="100%" border="0" cellpadding="2" cellspacing="2">
				<tr>
					<td style="width:10%"><?=$mform->label('itemName',"Item Name","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','itemName',$itemName,'flat_input','itemName','50','','','1');?></td>
                                        <td style="width:10%"><?=$mform->label('itemCode',"Item Code","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','itemCode',$itemCode,'flat_input','itemCode','50','','','1');?></td>

                                </tr>
                               

				<tr>
					<td colspan="4"><hr/></td>
				</tr>
                                <tr>
					<td style="width:10%"><?=$mform->label('itemType',"Item Type","","req")?></td>
					<td style="width:20%">
                                                <select name="itemTypeId" >
                                                <option value=""> --Select One-- </option>
                                                <?
								$retrieveitemType = $recon->retrieveCustomQuery("SELECT itemTypeId, itemTypeName, itemTypeCode FROM itemtype order by itemTypeName");
								foreach($retrieveitemType as $itemTypes){
									$itemType = explode("|",$itemTypes);
                                                                        $selected = ($itemTypeId==$itemType[0])? 'selected' : '';
									echo '<option value="'.$itemType[0].'" '.$selected.'>'.$itemType[1].' | '.$itemType[2].'</option>';
								}
							?>
                                                </select>
                                        </td>
                                        <td style="width:10%"><?=$mform->label('unit',"Unit of Measure","","req")?></td>
					<td style="width:20%">
                                                <select name="unitId" >
                                                <option value=""> --Select One-- </option>
                                                <?
								$retrieveunit = $recon->retrieveCustomQuery("SELECT unitId, unitName, unitCode FROM unit order by unitName");
								foreach($retrieveunit as $units){
									$unit = explode("|",$units);
                                                                        $selected = ($unitId==$unit[0])? 'selected' : '';
									echo '<option value="'.$unit[0].'" '.$selected.'>'.$unit[1].' | '.$unit[2].'</option>';
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
<style>
</style>
<script type="text/javascript">
<!--

function FindPosition(oElement)
{
  if(typeof( oElement.offsetParent ) != "undefined")
  {
    for(var posX = 0, posY = 0; oElement; oElement = oElement.offsetParent)
    {
      posX += oElement.offsetLeft;
      posY += oElement.offsetTop;
    }
      return [ posX, posY ];
    }
    else
    {
      return [ oElement.x, oElement.y ];
    }
}

function GetCoordinates(e)
{
  var PosX = 0;
  var PosY = 0;
  var ImgPos;
  ImgPos = FindPosition(myImg);
  if (!e) var e = window.event;
  if (e.pageX || e.pageY)
  {
    PosX = e.pageX;
    PosY = e.pageY;
  }
  else if (e.clientX || e.clientY)
    {
      PosX = e.clientX + document.body.scrollLeft
        + document.documentElement.scrollLeft;
      PosY = e.clientY + document.body.scrollTop
        + document.documentElement.scrollTop;
    }
  PosX = PosX - ImgPos[0];
  PosY = PosY - ImgPos[1];
  dPosX = PosX +ImgPos[0];
  dPosY = PosY + ImgPos[1];
  document.getElementById("xCoordinate").value = PosX;
  document.getElementById("yCoordinate").value = PosY;
 document.getElementById("X").innerHTML = PosX;
  document.getElementById("Y").innerHTML = PosY;
    var dot = $('<img src="<?=IMAGES;?>dotNew.jpg" />');
    //var dot = $('<div></div>');
    dot.css({
        position: 'absolute',
        height: '5px',
        width: '5px',
        left: dPosX + "px",
        top: dPosY + "px",
        background : '#00000F'
    });
    $("#overlay-dots").html("");
    $("#overlay-dots").append(dot);
    //document.getElementById("coordMapContainer").appendChild(dot);
}

function writeDot(myImg,x,y,status){
    ImgPos = FindPosition(myImg);
    dPosX = x +ImgPos[0];
    dPosY = y + ImgPos[1];
    var dot = $('<img src="<?=IMAGES;?>dotNew.jpg" />');
    //var dot = $('<div></div>');
    dot.css({
        position: 'absolute',
        height: '5px',
        width: '5px',
        left: dPosX + "px",
        top: dPosY + "px",
        background : '#00000F'
    });
    $("#overlay-dots").html("");
    $("#overlay-dots").append(dot);
}
//-->
</script>
<?if($task!='view'){?>
<script type="text/javascript">
<!--
var myImg = document.getElementById("coordMap");
myImg.onmousedown = GetCoordinates;
//-->
</script>
<?}?>
<?if($task=='view' || $task=='edit'){?>
<script type="text/javascript">
<!--
var myImg = document.getElementById("coordMap");
writeDot(myImg,<?=$xCoordinate?>,<?=$yCoordinate?>)
//-->
</script>
<?}?>
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