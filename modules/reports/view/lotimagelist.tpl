		 
	 
	 
	<tr>
		<td colspan="2">
			<form method="POST"  onsubmit="return ValidateForm(this, 'delAnn[]');">

			<table width="100%" cellpadding="0" cellspacing="0">					
					<tr>
						<td colspan="5">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr valign="middle">															 
									<td class="verdana10"></td>
                                                                        <td class="verdana10"></td>
									<td  align="right" class="verdana10"><?= $log->showItems();?></td>
								</tr>
							</table>
						</td>
					</tr> 
					<tr><td colspan="5">&nbsp;</td></tr>
					<tr valign="middle">
						<td width="5%" align="center" class="table_line1_left"></td>
						<td width="10%" class="table_line1_left paddleft">&nbsp;LOT CODE</td>
						<td width="10%" class="table_line1_left paddleft">&nbsp;IMAGE</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;USER</td>
						<td width="10%" class="table_line1_left_right paddleft">&nbsp;DATE</td>
					</tr>
					<tr valign="middle"><td class="bar" colspan="5"></td></tr>
			<?php
				$bgcolor = "";
				if($num_rows>0){	
					for($i=0;$i<$num_rows;$i++){
					
						$ids 				= mysql_result($result, $i, "lotimageId");
						$lotId                          = mysql_result($result, $i, "lotId");
						$location		 	= mysql_result($result, $i, "location");
                                                $enteredBy		 	= mysql_result($result, $i, "enteredBy");
                                                $enteredDate		 	= mysql_result($result, $i, "enteredDate");

                                                $lotCode                    = $recon->GetValue('lotCode','lot','lotId="'.$lotId.'"');
                                                $modtype 			= $type;						  
						
							
							$bgcolor = ($bgcolor != "#FFFFFF")? "#FFFFFF" : "#EFEFEF"; 							
							echo "<tr bgcolor=\"$bgcolor\">";								 												
							echo '	<td align="center" class="table_line2_left">'.$ids.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$lotCode.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left"><img src="modules/inventory/'.$location.'"></td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$enteredBy.'</td>
                                                                        <td class="paddleft table_line2_left_right" valign="top" align="left" >&nbsp;'.$enteredDate.'</td>';
							echo '</tr>';
					}
				}else{
					echo '<tr valign="middle" width="20px"><td colspan="5" class="table_line2_left table_line2_left_right" align="center"><p class="errmsg">NO RECORDS FOUND</p></td></tr>';
				}
				echo '<tr valign="middle"><td class="bar" colspan="5"></td></tr>
					<tr valign="middle">
						<td class="table_footer_left" align="center" colspan="3">&nbsp;'.$PAGINATION_INFO.'</td>
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
						<td width="10%" class="table_line1_left paddleft">&nbsp;IMAGE</td>
                                                <td width="10%" class="table_line1_left paddleft">&nbsp;USER</td>
						<td width="10%" class="table_line1_left_right paddleft">&nbsp;DATE</td>
					</tr>
					<tr valign="middle"><td class="bar" colspan="5"></td></tr>';
$result = mysql_query($paginate_arr['paginatequery'].$paginate_arr['addquery'].$paginate_arr['query'] );
$num_rows = @mysql_num_rows($result);
for($i=0;$i<$num_rows;$i++){

            $ids 				= mysql_result($result, $i, "lotimageId");
            $lotId                          = mysql_result($result, $i, "lotId");
            $location		 	= mysql_result($result, $i, "location");
            $enteredBy		 	= mysql_result($result, $i, "enteredBy");
            $enteredDate		 	= mysql_result($result, $i, "enteredDate");

            $lotCode                    = $recon->GetValue('lotCode','lot','lotId="'.$lotId.'"');
            $modtype 			= $type;


                    $bgcolor = ($bgcolor != "#FFFFFF")? "#FFFFFF" : "#EFEFEF";
                    $excel .= "<tr bgcolor=\"$bgcolor\">";
                    $excel .= '	<td align="center" class="table_line2_left">'.$ids.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left">'.$lotCode.'</td>
									<td class="paddleft table_line2_left " valign="top" align="left"><img src="modules/inventory/'.$location.'"></td>
                                                                        <td class="paddleft table_line2_left " valign="top" align="left">'.$enteredBy.'</td>
                                                                        <td class="paddleft table_line2_left_right" valign="top" align="left" >&nbsp;'.$enteredDate.'</td>';
							$excel .='</tr>';
    }

$excel .='</table></body></html>';

$fp = fopen('pdf_reports/lotimages_'.$datetime.'.xls', "wb");

chmod('pdf_reports/lotimages_'.$datetime.'.xls',0777);
fwrite($fp, $excel);
fclose($fp);

header('Content-Description: File Transfer');
	header('Content-Type: application/octet-stream');
	header('Content-Disposition: inline; filename='.basename('pdf_reports/lotimages_'.$datetime.'.xls'));
	header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
	header('Pragma: public');
	header('Content-Length: ' . filesize('pdf_reports/lotimages_'.$datetime.'.xls'));
	ob_clean();
	flush();
	readfile('pdf_reports/lotimages_'.$datetime.'.xls');
	exit;

	ob_end_flush();
}
?>