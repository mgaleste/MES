<?
	//Declaration of objects and other variables
		$userTable				=	"route";
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
        $retrieveroute = $recon->retrieveCustomQuery("SELECT routeId, routeName, routeCode, itemId, revision FROM $userTable m WHERE m.routeId='$sid'");

        $routeData = explode("|",$retrieveroute[0]);
        $routeId = $routeData[0];
        $routeName = $routeData[1];
        $routeCode = $routeData[2];
        $itemId = $routeData[3];
        $revision = $routeData[4];
        

}  else {
        $routeId = "";
        $routeName = "";
        $routeCode =  "";
        $isManual = "";
        $isMachine = "";
        $isInspected = "";
        $isSubcon = "";

}
//-----------------------------------------SAVING ----------------------------------------------------//
if (isset($_POST['Save'])){
		$postArray = $_POST;
		$usersArray = array();
	

		$usersArray['routeId'] 	=	getIDCustom($userTable,'routeId');
                $usersArray['revision'] 	=	0;
		$usersArray['enteredBy'] 		=	$admin;
		$usersArray['enteredDate'] 		=	$datetime;

	
		$usersArray['updateBy'] 		=	$admin;
		$usersArray['updateDate']		=	$datetime;

	
		//Posting values and assigning posted values to variables.
                $arrayAvoid = array("task","processId");
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
                foreach($_POST['processId'] as $index => $processId){
                    $processListId .= $processId;
                    $processIdArray[] = $processId;
                }

                $required_fields   	=	array('routeName', 'routeCode');
                if(empty($routeName) || empty($routeCode) || empty($processListId)){

                                $errmsg[]	=	$validation_class->validations($required_fields,'required');
                }


		//Save Values to the Database if no Errors Found
		$error_messages				=	implode('', $errmsg);

		if (empty($error_messages)) {
                        //Save Posted Array Values to Database
                        $queryResult 		= 	$coreMaintenance->saveDatabase("create",$userTable,$usersArray,$sid);
                        foreach($processIdArray as $index => $value){
                            $detailsArray['routeDetailsId'] = getIDCustom('routedetails','routeDetailsId');
                            $detailsArray['routeId'] = $usersArray['routeId'];
                            $detailsArray['processId'] = $value;
                            $coreMaintenance->saveDatabase("create","routedetails",$detailsArray,$sid);

                        }
                        if (empty($queryResult)) {
                                        $revisionNumber = $recon->retrieveCustomQuery("select max(revision) from route where itemId='{$usersArray['itemId']}'");
                                        $fieldArray['revision'] = $revisionNumber[0] + 1;
                                        $users->updateRecord($fieldArray, $userTable, $userTable."Id='{$usersArray['routeId']}'");
                                        $statusId = $recon->retrieveCustomQuery("select statusId from status where name='Archived'");
                                        $fieldArray2['statusId'] = $statusId[0];
                                        $users->updateRecord($fieldArray2, $userTable, $userTable."Id<>'{$usersArray['routeId']}' and itemId = '{$usersArray['itemId']}'");
                                        $caption 	=	(empty($routeName)) ? $type : $routeName;
                                        $activity 	=	"Create route : $caption";
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
   $paginate_arr['addquery'] 	= " AND routeName LIKE '%$psearch%' ";
}

$paginate_arr['paginatequery'] 	= "SELECT routeId, routeName, routeCode, itemId, revision, statusId FROM $userTable WHERE statusID <>-1  ";

//$paginate_arr['paginatequery'] 	= "join customer_subscription cs using (customerId) join status s using (statusId)";

$paginate_arr['query'] 			= "ORDER BY routeName ASC";

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

                        $retrieveroute = $recon->retrieveCustomQuery("select concat(routeName,' | ',routeCode) from route where routeId='$did'");

			$activity 	=	"$taskCBox route ".$retrieveroute[0];
			$core->logAdminTask($admin,$type,$taskCBox,$activity);
		}


        header("location:index.php?mod=$mod&type=$type");
    }
}

if ($task == 'delete') {
	$title 		=	$core->getIdCaption("routeName",$userTable,"routeId='$sid'");
	$caption 	= 	(empty($title)) ? $type : $title;
	$retrieveroute = $recon->retrieveCustomQuery("select concat(routeName,' | ',routeCode) from route where routeId='$did'");

	$activity 	=	"$task Service Provider route ".$retrieveroute[0];
	$fieldArray = array ("statusId"=>"-1");
        $users->updateRecord($fieldArray, $userTable, $userTable."Id='$sid'");
    header("location:index.php?mod=$mod&type=$type");
}


?>

