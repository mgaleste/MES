<?
	//Declaration of objects and other variables
		$userTable				=	"inventory";
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
        $retrieveitem = $recon->retrieveCustomQuery("SELECT inventoryId, itemId, quantity, lotId, processId FROM $userTable m WHERE m.inventoryId='$sid'");

        $itemData = explode("|",$retrieveitem[0]);
        $inventoryId = $itemData[0];
        $itemId = $itemData[1];
        $quantity = $itemData[2];
        $lotId = $itemData[3];
        $processId = $itemData[4];
        

}  else {
        $itemId = "";
        $itemName = "";
        $itemCode =  "";
        $itemTypeId = "";
        $unitId = "";

}
//-----------------------------------------SAVING ----------------------------------------------------//
if (isset($_POST['Save'])){
		$postArray = $_POST;
		$usersArray = array();

	if($task=='create'){

		$usersArray['inventoryId'] 	=	getIDCustom($userTable,'inventoryId');
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

                $required_fields   	=	array('itemId','quantity');
                if(empty($itemId) || empty($quantity)){

                                $errmsg[]	=	$validation_class->validations($required_fields,'required');
                }
                if($task=='create'){	//Validation for Duplications
                        $errmsg[]	=	($core->checkExist("inventory in join item i using(itemId)" , "in.itemId" , $itemId, ' AND in.lotId = 0 AND i.itemTypeId in =1')) ? "Item already exist in Inventory " : "";
                }


		//Save Values to the Database if no Errors Found
		$error_messages				=	implode('', $errmsg);

		if (empty($error_messages)) {
			//Save Posted Array Values to Database
                        $queryResult 		= 	$coreMaintenance->saveDatabase($task,$userTable,$usersArray,$sid);

                        if (empty($queryResult)) {

                                        $caption 	=	(empty($itemName)) ? $type : $itemName;
                                        $activity 	=	"$task Item : $caption";
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
   $paginate_arr['addquery'] 	= " and itemName LIKE '%$psearch%' ";
}

$paginate_arr['paginatequery'] 	= "SELECT inventoryId, itemId, quantity, lotId, processId, statusId FROM $userTable where statusId <> -1 ";

//$paginate_arr['paginatequery'] 	= "join customer_subscription cs using (customerId) join status s using (statusId)";

$paginate_arr['query'] 			= "ORDER BY inventoryId ASC";

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

                        $retrieveitem = $recon->retrieveCustomQuery("select concat(itemName,' | ',itemCode) from item where itemId='$did'");

			$activity 	=	"$taskCBox Item ".$retrieveitem[0];
			$core->logAdminTask($admin,$type,$taskCBox,$activity);
		}


        header("location:index.php?mod=$mod&type=$type");
    }
}

if ($task == 'delete') {
	$title 		=	$core->getIdCaption("itemName",$userTable,"itemId='$sid'");
	$caption 	= 	(empty($title)) ? $type : $title;
	$retrieveitem = $recon->retrieveCustomQuery("select concat(itemName,' | ',itemCode) from item where itemId='$did'");

	$activity 	=	"$task Item ".$retrieveitem[0];
	$fieldArray = array ("statusId"=>"-1");
        $users->updateRecord($fieldArray, $userTable, $userTable."Id='$sid'");
    header("location:index.php?mod=$mod&type=$type");
}


?>

