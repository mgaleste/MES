<table width="100%" class="form" cellpadding="10" cellspacing="10" border="0">
<tr>
    <td colspan="2">
        <?
            $menuSelected = array();
            
            $menuSelected['lothistory'] = ($cat=='lothistory')? 'flat_button_selected' : 'flat_button';
            $menuSelected['lotimage'] = ($cat=='lotimage')? 'flat_button_selected' : 'flat_button';
            $menuSelected['logs'] = ($cat=='logs')? 'flat_button_selected' : 'flat_button';

            echo $mform->inputBox('edit','button','lothistory','Lot History',$menuSelected['lothistory'],'lothistory','',' onClick="redirectButton(\'index.php?mod='.$mod.'&type='.$type.'&cat=lothistory\');" ','','24');
            echo '&nbsp;&nbsp;'.$mform->inputBox('edit','button','lotimage','Lot Image',$menuSelected['lotimage'],'lotimage','',' onClick="redirectButton(\'index.php?mod='.$mod.'&type='.$type.'&cat=lotimage\');" ','','24');
            echo '&nbsp;&nbsp;'.$mform->inputBox('edit','button','logs','Admin Logs',$menuSelected['logs'],'adminlogs','',' onClick="redirectButton(\'index.php?mod='.$mod.'&type='.$type.'&cat=logs\');" ','','24');
        ?>
    </td>
</tr>
<script type="text/javascript">
    function redirectButton(url){
        location.href=url;
    }

</script>
<?
if(!empty($cat)){ ?>
<tr>
		<td align="left" class="header"></td>
		<td align="right">	
			<form method="POST">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="4" align="right"><?= $mform->inputBox($task,'text','psearch_entry',$psearch,'search input','psearch_entry','15');?></td>
					<td>&nbsp;<?= $mform->inputBox($task,'submit','doSearch',"Search",'roundbuttons button2','doSearch','5');?></td>
				</tr>
			</table>
			</form>
		</td>
	</tr>		 
<?
}
?>
	 
	
