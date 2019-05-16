<?
	//Declaration of objects and other variables
		$userTable				=	"machine";
                $users 					=	new users();
		$userProd				=	new products();
		$items 					=	(isset($_GET['items'])) ? $_GET['items'] : $userProd->defaultItemList();

		$mform 					=	new formMaintenance();
		$core 					=	new coreFunctions();
		$coreMaintenance		=	new coreMaintenance();
		$validation_class 		=	new validations();

                $recon 					= 	new recordUpdate();


		$admin					=	$_SESSION['gp_username'];
		$groupCode				=	$_SESSION['gp_group'];
		$datetime				=	date("Y-m-d H:i:s");
		$currentdate			=	date("Y-m-d");
		$modulerecord 			=	new record($userTable);
		$sid 					=	(!empty($_GET['sid'])) ? $_GET['sid'] : "";
		$required_fields		=	array();
		$alphanumeric_fields	=	array();
		$numeric_fields 		=	array();
		$errmsg 				=	array();
		$errmsg[] 				=	isset($_GET['errmsg']) ? $_GET['errmsg'] : "";
		$error_messages 		=	"";



//-----------------------------------------UPDATING ----------------------------------------------------//
if (((!empty($sid)) && $task == 'edit') || ((!empty($sid)) && $task == 'view')) {
        $retrievemachine = $recon->retrieveCustomQuery("SELECT machineId, machineName, machineCode, processId FROM $userTable m WHERE m.machineId='$sid'");

        $machineData = explode("|",$retrievemachine[0]);
        $machineId = $machineData[0];
        $machineName = $machineData[1];
        $machineCode = $machineData[2];
        $processId = $machineData[3];
        

}  else {
        $machineId = "";
        $machineName = "";
        $machineCode =  "";
        $processId= "";
        

}
//-----------------------------------------SAVING ----------------------------------------------------//
if (isset($_POST['Save'])){
		$postArray = $_POST;
		$usersArray = array();

	if($task=='create'){

		$usersArray['machineId'] 	=	getIDCustom($userTable,'machineId');
		$usersArray['enteredBy'] 		=	$admin;
		$usersArray['enteredDate'] 		=	$datetime;

	}elseif($task=='edit'){
		$usersArray['updateBy'] 		=	$admin;
		$usersArray['updateDate']		=	$datetime;

	}
		//Posting values and assigning posted values to variables.
                $arrayAvoid = array("task");
		$arrayTableTwo = array('');
		foreach($postArray as $postIndex => $postValue){
			//Check if Posted Name is not Save Button
				if($postIndex!='Save' && !in_array($postIndex,$arrayAvoid) && !in_array($postIndex,$arrayTableTwo)){
					$usersArray[$postIndex]	=  (isset($_POST[$postIndex])	&&	(!empty($_POST[$postIndex])))	?	htmlentities(trim($_POST[$postIndex]))	:	(($postIndex=='groupCode') ? 0 : "");
					$$postIndex  			=	$usersArray[$postIndex];
				}else if(in_array($postIndex,$arrayTableTwo) && !in_array($postIndex,$arrayAvoid)){
					$transactionsArray[$postIndex]	=  (isset($_POST[$postIndex])	&&	(!empty($_POST[$postIndex])))	?	htmlentities(trim($_POST[$postIndex]))	:	(($postIndex=='groupCode') ? 0 : "");
					$$postIndex  			=	$transactionsArray[$postIndex];
				}
		}
		//Validating Posted Values

                $required_fields   	=	array('machineName', 'machineCode', 'processId');
                if(empty($machineName) || empty($machineCode) || empty($processId) ){

                                $errmsg[]	=	$validation_class->validations($required_fields,'required');
                }


		//Save Values to the Database if no Errors Found
		$error_messages				=	implode('', $errmsg);

		if (empty($error_messages)) {
			//Save Posted Array Values to Database
                        $queryResult 		= 	$coreMaintenance->saveDatabase($task,$userTable,$usersArray,$sid);

                        if (empty($queryResult)) {

                                        $caption 	=	(empty($machineName)) ? $type : $machineName;
                                        $activity 	=	"$task Machine : $caption";
                                        $core->logAdminTask($admin,$type,$task,$activity);
                                        header("location:index.php?mod=$mod&type=$type");
                        }

		}
}
//-----------------------------------------LISTING ---------------------------------------------------------------//
//$items 						= (isset($_GET['items'])) ? $_GET['items'] : 10;
$paginate_arr['addquery'] 	= "";

if (isset($_POST['psearch_entry'])) {
		$parse_arr 			= array('pg', 'search');
		$searchloc 			= (string) URL_Parser($_SERVER['QUERY_STRING'], $parse_arr) . "&search=" . $_POST['psearch_entry'];
		header("Location:?" . $searchloc);
}

if (isset($_GET['search'])) {
   $psearch = trim($_GET['search']);
   $paginate_arr['addquery'] 	= " and machineName LIKE '%$psearch%' ";
}

$paginate_arr['paginatequery'] 	= "SELECT machineId, machineName, machineCode, processId FROM $userTable WHERE statusId <> -1 ";

//$paginate_arr['paginatequery'] 	= "join customer_subscription cs using (customerId) join status s using (statusId)";

$paginate_arr['query'] 			= "ORDER BY machineName ASC";

//call the function  where you will pass your array of queries for the class' future use
$modulerecord->manage_record_queries($paginate_arr);
//get pagination results then assign to $article list
$list 					= $modulerecord->get_paginated_array($items);
$result 				= $list['result'];
$num_rows 				= $list['num_rows'];
$PAGINATION_LINKS 		= $list['PAGINATION_LINKS'];
$PAGINATION_INFO 		= $list['PAGINATION_INFO'];
$PAGINATION_TOTALRECS 	= $list['PAGINATION_TOTALRECS'];



//DELETE FROM LIST
if (isset($_POST['hidden_selected'])) {
    if (count($_POST['hidden_selected']) > 0) {
        $str_ids = implode(',', $_POST['delAnn']);

		$delArr 		= 	$_POST['delAnn'];
		foreach($delArr as $did){
			$taskCBox		= 	"delete";
                        $fieldArray = array ("statusId"=>"-1");
                        $users->updateRecord($fieldArray, $userTable, $userTable."Id='$did'");

                        $retrievemachine = $recon->retrieveCustomQuery("select concat(machineName,' | ',machineCode) from machine where machinesId='$did'");

			$activity 	=	"$taskCBox Machine ".$retrievemachine[0];
			$core->logAdminTask($admin,$type,$taskCBox,$activity);
		}


        header("location:index.php?mod=$mod&type=$type");
    }
}

if ($task == 'delete') {
	$title 		=	$core->getIdCaption("machineName",$userTable,"machineId='$sid'");
	$caption 	= 	(empty($title)) ? $type : $title;
	$retrievemachine = $recon->retrieveCustomQuery("select concat(machineName,' | ',machineCode) from machine where machinesId='$did'");

	$activity 	=	"$task Machine ".$retrievemachine[0];
	$fieldArray = array ("statusId"=>"-1");
        $users->updateRecord($fieldArray, $userTable, $userTable."Id='$sid'");
    header("location:index.php?mod=$mod&type=$type");
}


?>

