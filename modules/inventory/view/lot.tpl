<style type="text/css">
body{
	margin:0;
padding:0;
}
.img
    { background:#ffffff;
    padding:12px;
    border:1px solid #999999; }
.shiva{
 -moz-user-select: none;
    background: #2A49A5;
    border: 1px solid #082783;
    box-shadow: 0 1px #4C6BC7 inset;
    color: white;
    padding: 3px 5px;
    text-decoration: none;
    text-shadow: 0 -1px 0 #082783;
    font: 12px Verdana, sans-serif;}
</style>
<div class="idTabs">
  <ul>
    <li><a href="#clientinfo" tabindex="-1">Lot Information</a></li>
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
								$retrieveItems = $recon->retrieveCustomQuery("SELECT itemId, itemName, itemCode FROM item where itemTypeId in (2,3) order by itemName");
								foreach($retrieveItems as $Items){
									$item = explode("|",$Items);
                                                                        $selected = ($itemId==$item[0])? 'selected' : '';
									echo '<option value="'.$item[0].'" '.$selected.'>'.$item[1].' | '.$item[2].'</option>';
								}
							?>
                                                </select>
                                        </td>
                                        <td style="width:10%"><?=$mform->label('lotCode',"Lot Code","","")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','lotCode',($task=='create')?'Auto Generate':$lotCode,'flat_input','lotCode','50','readOnly','','1');?></td>

                                </tr>
                               

				<tr>
					<td colspan="4"><hr/></td>
				</tr>
                                <?if($machineType){?>
                                <tr>
                                    <td style="width:10%"><?=$mform->label('machineId',"Machine","","req")?></td>
					<td style="width:20%">
                                                <select name="machineId" >
                                                <option value=""> --Select One-- </option>
                                                <?
								$retrieveItems = $recon->retrieveCustomQuery("SELECT machineId, machineName, machineCode FROM machine where processId ='$processId' order by machineId");
								foreach($retrieveItems as $Items){
									$item = explode("|",$Items);
									echo '<option value="'.$item[0].'">'.$item[1].' | '.$item[2].'</option>';
								}
							?>
                                                </select>
                                        </td>
                                </tr>
                                
                                <?}?>
                                <?if($multiOutType){?>
                                <tr>
					<td style="width:10%"><?=$mform->label('quantity',"Quantity Out","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','quantity',$quantity,'flat_input','quantity','50','','','1');?></td>

				</tr>
                                <?}?>
                                <?if($inspectionType){?>
                                <tr>
                                    <td style="width:10%"><?=$mform->label('inspection',"Inspection","","req")?></td>
					<td>
                                                <script language="JavaScript">
                                                                document.write( webcam.get_html(440, 240) );
                                                </script>
                                                
                                        </td>
                                        <td></td>
                                        <td>
                                            <div id="img"></div>
                                        </td>
                                </tr>
                                <tr>
					<td style="width:10%"><?=$mform->label('pass',"Good Quantity","","req")?></td>
					<td style="width:20%"><?=$mform->inputBox($task,'text','quantity',$quantity,'flat_input','quantity','50','','','1');?></td>

				</tr>
                                <tr>
                                    <td></td><td><input type=button value="snap" onClick="take_snapshot()" class="flat_button"></td>
                                </tr>
                                <?}?>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="right">
			<?php
			if($task=='create'){
				echo $mform->inputBox($task,'submit','Save','Save','flat_button','Save','',' ','','23');
				echo '&nbsp;&nbsp;&nbsp;';
				echo $mform->inputBox($task,'button','cancel','Cancel','flat_button','cancel','',' onClick="cancelChanges(\'index.php?mod='.$mod.'&type='.$type.'\');" ','','24');
			}elseif($task=='view'){
				echo $mform->inputBox('create','submit','Save','Start Lot','flat_button','Save','','','','23');
				echo '&nbsp;&nbsp;&nbsp;';
				echo $mform->inputBox($task,'button','cancel','Cancel','flat_button','cancel','',' onClick="cancelChanges(\'index.php?mod='.$mod.'&type='.$type.'\');" ','','24');
			}elseif($task=='edit'){
				echo $mform->inputBox('create','submit','Save','Move Next','flat_button','Save','','','','23');
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
<?if($inspectionType){?>
<script  type="text/javascript">
    webcam.set_api_url( 'modules/inventory/handleimage.php' );
		webcam.set_quality( 90 ); // JPEG quality (1 - 100)
		webcam.set_shutter_sound( true ); // play shutter click sound
		webcam.set_hook( 'onComplete', 'my_completion_handler' );

		function take_snapshot(){
			// take snapshot and upload to server
			document.getElementById('img').innerHTML = '<h1>Uploading...</h1>';

			webcam.snap();
		}

		function my_completion_handler(msg) {
			// extract URL out of PHP output
			if (msg.match(/(http\:\/\/\S+)/)) {
				// show JPEG image in page

				document.getElementById('img').innerHTML ='<h3>Upload Successfuly done</h3>'+msg;

				document.getElementById('img').innerHTML ="<img src="+msg+" class=\"img\">";


				// reset camera for another shot
				webcam.reset();
			}
			else {alert("Error occured we are trying to fix now: " + msg); }
		}
	</script>
<?}?>
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