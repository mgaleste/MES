<?php
ob_start();

include_once '../../model/dbconfig.php';
include_once '../../model/connection.php';
include_once '../../model/functions.php';
include_once '../../model/class/connectUpdate.inc';
include_once '../../model/class/recordUpdate.inc';

session_start();


$recon 	= 	new recordUpdate();

$name = date('YmdHis');
$newname="lotImages/".$name.".jpg";
$file = file_put_contents( $newname, file_get_contents('php://input') );
if (!$file) {
	print "Error occured here";
	exit();
}
else
{
    $fieldArray['lotimageId'] = getIDCustom('lotimages','lotimageId');
    $fieldArray['lotId'] = $_SESSION['lotId'];
    $fieldArray['location'] = $newname;
    $fieldArray['enteredBy']=$_SESSION['gp_username'];
    $fieldArray['enteredDate']=date("Y-m-d H:i:s");
    $recon->insertRecord($fieldArray, "lotimages");
    
	
}

$url = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['REQUEST_URI']) . '/' . $newname;
print "$url\n";

?>
