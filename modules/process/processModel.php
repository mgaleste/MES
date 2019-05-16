<?	
	//Declaration of objects and other variables	  
		$userTable				=	"process";
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
        $retrieveProcess = $recon->retrieveCustomQuery("SELECT processId, processName, processCode, isManual, isMachine, isInspected, isSubcon, multiOut FROM $userTable m WHERE m.processId='$sid'");

        $processData = explode("|",$retrieveProcess[0]);
        $processId = $processData[0];
        $processName = $processData[1];
        $processCode = $processData[2];
        $isManual = ($processData[3])? 'Yes' : 'No';
        $isMachine = ($processData[4])? 'Yes' : 'No';
        $isInspected = ($processData[5])? 'Yes' : 'No';
        $isSubcon = ($processData[6])? 'Yes' : 'No';
        $multiOut = ($processData[7])? 'Yes' : 'No';
		
}  else {
        $processId = "";
        $processName = "";
        $processCode =  "";
        $isManual = "";
        $isMachine = "";
        $isInspected = "";
        $isSubcon = "";

}
//-----------------------------------------SAVING ----------------------------------------------------//
if (isset($_POST['Save'])){
		$postArray = $_POST;
		$usersArray = array();
        
	if($task=='create'){
		
		$usersArray['processId'] 	=	getIDCustom($userTable,'processId');
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
                        
                $required_fields   	=	array('processName', 'processCode');
                if(empty($processName) || empty($processCode)){

                                $errmsg[]	=	$validation_class->validations($required_fields,'required');
                }
                        
		
		//Save Values to the Database if no Errors Found
		$error_messages				=	implode('', $errmsg);
               
		if (empty($error_messages)) {
			//Save Posted Array Values to Database
                        $queryResult 		= 	$coreMaintenance->saveDatabase($task,$userTable,$usersArray,$sid);

                        if (empty($queryResult)) {
                                        
                                        $caption 	=	(empty($processName)) ? $type : $processName;
                                        $activity 	=	"$task Process : $caption";
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
   $paginate_arr['addquery'] 	= " and processName LIKE '%$psearch%' ";
}

$paginate_arr['paginatequery'] 	= "SELECT processId, processName, processCode, isManual, isMachine, isInspected, isSubcon, multiOut, statusId FROM $userTable WHERE statusId <> -1 ";

//$paginate_arr['paginatequery'] 	= "join customer_subscription cs using (customerId) join status s using (statusId)";

$paginate_arr['query'] 			= "ORDER BY processName ASC";

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

                        $retrieveProcess = $recon->retrieveCustomQuery("select concat(processName,' | ',processCode) from process where processId='$did'");
			
			$activity 	=	"$taskCBox Process ".$retrieveProcess[0];
			$core->logAdminTask($admin,$type,$taskCBox,$activity);
		}
		
        
        header("location:index.php?mod=$mod&type=$type");
    }
}

if ($task == 'delete') {
	$title 		=	$core->getIdCaption("processName",$userTable,"processId='$sid'");
	$caption 	= 	(empty($title)) ? $type : $title;
	$retrieveProcess = $recon->retrieveCustomQuery("select concat(processName,' | ',processCode) from process where processId='$did'");

	$activity 	=	"$task Process ".$retrieveProcess[0];
	$fieldArray = array ("statusId"=>"-1");
        $users->updateRecord($fieldArray, $userTable, $userTable."Id='$sid'");
    header("location:index.php?mod=$mod&type=$type");
}


?>

