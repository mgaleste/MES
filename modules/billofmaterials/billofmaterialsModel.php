<?
	//Declaration of objects and other variables
		$userTable				=	"billofmaterials";
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
        $retrievebillofmaterials = $recon->retrieveCustomQuery("SELECT billofmaterialsId, itemId, revision FROM $userTable m WHERE m.billofmaterialsId='$sid'");

        $billofmaterialsData = explode("|",$retrievebillofmaterials[0]);
        $billofmaterialsId = $billofmaterialsData[0];
        $itemId = $billofmaterialsData[1];
        

}  else {
        $billofmaterialsId = "";
        $billofmaterialsName = "";
        $billofmaterialsCode =  "";
        $isManual = "";
        $isMachine = "";
        $isInspected = "";
        $isSubcon = "";

}
//-----------------------------------------SAVING ----------------------------------------------------//
if (isset($_POST['Save'])){
		$postArray = $_POST;
		$usersArray = array();
	

		$usersArray['billofmaterialsId'] 	=	getIDCustom($userTable,'billofmaterialsId');
                $usersArray['revision'] 	=	0;
		$usersArray['enteredBy'] 		=	$admin;
		$usersArray['enteredDate'] 		=	$datetime;

	
		$usersArray['updateBy'] 		=	$admin;
		$usersArray['updateDate']		=	$datetime;

	
		//Posting values and assigning posted values to variables.
                $arrayAvoid = array("task","itemIds","usageQuantity","baseQuantity");
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
                foreach($_POST['itemIds'] as $index => $processId){
                    $processListId .= $processId;
                    $processIdArray[] = $processId;
                }
                foreach($_POST['usageQuantity'] as $index => $usage){
                    $usageQuantityList .= $usage;
                    
                }
                $required_fields   	=	array('itemId');
                if(empty($itemId) || empty($processListId) || empty($usageQuantityList)){

                                $errmsg[]	=	$validation_class->validations($required_fields,'required');
                }


		//Save Values to the Database if no Errors Found
		$error_messages				=	implode('', $errmsg);
                $detailsIndex=0;
		if (empty($error_messages)) {
                        //Save Posted Array Values to Database
                        $queryResult 		= 	$coreMaintenance->saveDatabase("create",$userTable,$usersArray,$sid);
                        foreach($processIdArray as $index => $value){
                            $detailsArray['billofmaterialsdetailsId'] = getIDCustom('billofmaterialsdetails','billofmaterialsdetailsId');
                            $detailsArray['billofmaterialsId'] = $usersArray['billofmaterialsId'];
                            $detailsArray['itemId'] = $value;
                            $detailsArray['usageQuantity'] = $_POST['usageQuantity'][$detailsIndex];
                            $usageUnitIdRetrieve = $recon->retrieveCustomQuery("select unitId from item where itemId='$value'");
                            $detailsArray['usageUnitId'] = $usageUnitIdRetrieve[0];
                            $detailsArray['baseQuantity'] = $_POST['baseQuantity'][$detailsIndex];
                            $baseUnitIdRetrieve = $recon->retrieveCustomQuery("select unitId from item where itemId='{$usersArray['itemId']}'");
                            $detailsArray['baseUnitId'] =  $baseUnitIdRetrieve[0];
                            
                            $coreMaintenance->saveDatabase("create","billofmaterialsdetails",$detailsArray,$sid);
                           $detailsIndex++;
                        }
                        if (empty($queryResult)) {
                                        $revisionNumber = $recon->retrieveCustomQuery("select max(revision) from billofmaterials where itemId='{$usersArray['itemId']}'");
                                        $fieldArray['revision'] = $revisionNumber[0] + 1;
                                        $users->updateRecord($fieldArray, $userTable, $userTable."Id='{$usersArray['billofmaterialsId']}'");
                                        $statusId = $recon->retrieveCustomQuery("select statusId from status where name='Archived'");
                                        $fieldArray2['statusId'] = $statusId[0];
                                        $users->updateRecord($fieldArray2, $userTable, $userTable."Id<>'{$usersArray['billofmaterialsId']}' and itemId='{$usersArray['itemId']}'");
                                        $caption 	=	(empty($billofmaterialsName)) ? $type : $billofmaterialsName;
                                        $activity 	=	"Create billofmaterials : $caption";
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
   $paginate_arr['addquery'] 	= " AND billofmaterialsName LIKE '%$psearch%' ";
}

$paginate_arr['paginatequery'] 	= "SELECT billofmaterialsId, itemId, revision, statusId FROM $userTable WHERE statusID <>-1 ";

//$paginate_arr['paginatequery'] 	= "join customer_subscription cs using (customerId) join status s using (statusId)";

$paginate_arr['query'] 			= "ORDER BY billofmaterialsId ASC";

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

                        $retrievebillofmaterials = $recon->retrieveCustomQuery("select concat(billofmaterialsName,' | ',billofmaterialsCode) from billofmaterials where billofmaterialsId='$did'");

			$activity 	=	"$taskCBox billofmaterials ".$retrievebillofmaterials[0];
			$core->logAdminTask($admin,$type,$taskCBox,$activity);
		}


        header("location:index.php?mod=$mod&type=$type");
    }
}

if ($task == 'delete') {
	$title 		=	$core->getIdCaption("billofmaterialsName",$userTable,"billofmaterialsId='$sid'");
	$caption 	= 	(empty($title)) ? $type : $title;
	$retrievebillofmaterials = $recon->retrieveCustomQuery("select concat(billofmaterialsName,' | ',billofmaterialsCode) from billofmaterials where billofmaterialsId='$did'");

	$activity 	=	"$task Service Provider billofmaterials ".$retrievebillofmaterials[0];
	$fieldArray = array ("statusId"=>"-1");
        $users->updateRecord($fieldArray, $userTable, $userTable."Id='$sid'");
    header("location:index.php?mod=$mod&type=$type");
}


?>

