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
                $dateLot				=	date("Ymd-His");
		$currentdate			=	date("Y-m-d");
		$modulerecord 			=	new record($userTable);
		$sid 					=	(!empty($_GET['sid'])) ? $_GET['sid'] : "";
		$required_fields		=	array();
		$alphanumeric_fields	=	array();
		$numeric_fields 		=	array();
		$errmsg 				=	array();
		$errmsg[] 				=	isset($_GET['errmsg']) ? $_GET['errmsg'] : "";
		$error_messages 		=	"";

function checkInventory($sid){
    $recon = 	new recordUpdate();
    $coreMaintenance = new coreMaintenance();
    $core 					=	new coreFunctions();
    $retrieveitem = $recon->retrieveCustomQuery("select itemId from billofmaterialsdetails where billofmaterialsId='$sid'");

    $status = 0;

    foreach($retrieveitem as $index => $value){
        $quantity = $recon->GetValue('quantity','inventory','itemId="'.$value.'"');
        $status = ($quantity)? 1 : 0;
    }

        return $status;
}
function reduceInventory($sid){
    $recon = 	new recordUpdate();
    $coreMaintenance = new coreMaintenance();
    $users 					=	new users();
    $core 					=	new coreFunctions();
    $retrieveitem = $recon->retrieveCustomQuery("select itemId, usageQuantity from billofmaterialsdetails where billofmaterialsId='$sid'");

    $status = 0;

    foreach($retrieveitem as $index => $value){
        $values=explode("|",$value);
        $quantity = $recon->GetValue('quantity','inventory','itemId="'.$values[0].'"');
        $status = ($quantity)? 1 : 0;
        $fieldArray['quantity'] = $quantity -$values[1];
        $users->updateRecord($fieldArray, "inventory", 'itemId="'.$value[0].'"');
    }
}
function getFirstProcess($sid){
    $recon = 	new recordUpdate();
    $coreMaintenance = new coreMaintenance();
    $core 					=	new coreFunctions();
    $retrieveitem = $recon->retrieveCustomQuery("select min(routeDetailsId) from routedetails where routeId='$sid'");

    $detailId = $retrieveitem[0];

    $retrieveitem = $recon->retrieveCustomQuery("select processId from routedetails where routeId='$sid' and routeDetailsId='$detailId'");

    return $retrieveitem[0];
}
function getNextProcess($sid,$pid){
    $recon = 	new recordUpdate();
    $coreMaintenance = new coreMaintenance();
    $core 					=	new coreFunctions();
    $retrieveitem = $recon->retrieveCustomQuery("select (routeDetailsId)+1 from routedetails where routeId='$sid' and processId='$pid'");

    $detailId = $retrieveitem[0];

    $retrieveitem = $recon->retrieveCustomQuery("select processId from routedetails where routeId='$sid' and routeDetailsId='$detailId'");
    

    return empty($retrieveitem)? '-1' : $retrieveitem[0];
}
//-----------------------------------------UPDATING ----------------------------------------------------//
if (((!empty($sid)) && $task == 'edit') || ((!empty($sid)) && $task == 'view')) {
        $retrieveitem = $recon->retrieveCustomQuery("SELECT inventoryId, itemId, quantity, lotId, processId FROM $userTable m WHERE m.inventoryId='$sid'");

        $itemData = explode("|",$retrieveitem[0]);
        $inventoryId = $itemData[0];
        $itemId = $itemData[1];
        $quantity = $itemData[2];
        $lotId = $itemData[3];
        $processId = $itemData[4];
        $retrieveitem = $recon->retrieveCustomQuery("select lotCode from lot where lotId='$lotId'");
        $lotCode = $retrieveitem[0];
        $retrieveitem = $recon->retrieveCustomQuery("select isManual, isMachine, isInspected, isSubcon, multiOut from process where processId='$processId'");
        
        $processDetails = explode('|',$retrieveitem[0]);

        $manualType = ($processDetails[0])? 'Yes' : '';
        $machineType = ($processDetails[1])? 'Yes' : '';
        $inspectionType = ($processDetails[2])? 'Yes' : '';
        $subconType = ($processDetails[3])? 'Yes' : '';
        $multiOutType = ($processDetails[4])? 'Multi' : '';

        $_SESSION['lotId'] = $sid;
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
                $lotArray = array();
                $lotHistoryArray = array();

        $lotHistoryArray['lothistoryId'] = getIDCustom('lothistory','lothistoryId');
	if($task=='create'){
                $lotArray['lotId'] = $usersArray['lotId']  =	getIDCustom('lot','lotId');
                $retrieveitem = $recon->retrieveCustomQuery("select itemCode from item where itemId='{$_POST['itemId']}'");
                $lotArray['lotCode'] =  $retrieveitem[0].'-'.$lotArray['lotId'].'-'.$dateLot;
                $retrieveitem = $recon->retrieveCustomQuery("select routeId from route where itemId='{$_POST['itemId']}' and statusId <> 28");
                $lotArray['routeId'] = $retrieveitem[0];
                $retrieveitem = $recon->retrieveCustomQuery("select billofmaterialsId from billofmaterials where itemId='{$_POST['itemId']}' and statusId <> 28");
                $lotArray['billofmaterialsId'] = $retrieveitem[0];
                $lotArray['statusId']  = $usersArray['statusId']       =       $recon->GetValue('statusId','status','name="New" and type="lot"');
                $lotArray['itemId'] = $_POST['itemId'];
                

		$usersArray['inventoryId'] 	=	getIDCustom($userTable,'inventoryId');
		$lotArray['enteredBy']  = $usersArray['enteredBy'] 		=	$admin;
		$lotArray['enteredDate'] = $usersArray['enteredDate'] 		=	$datetime;
                $usersArray['quantity'] =1;

                $lotHistoryArray['lotId'] = $lotArray['lotId'];
                $lotHistoryArray['statusId'] = $lotArray['statusId'];
                $lotHistoryArray['processId'] = 0;
                $lotHistoryArray['machineId'] = 0;
                $lotHistoryArray['quantity'] = $usersArray['quantity'];
                $lotHistoryArray['remarks'] = "Create Lot";
                $lotHistoryArray['enteredBy']  	=	$admin;
		$lotHistoryArray['enteredDate'] =	$datetime;

	}elseif($task=='edit'){
                $retrieveitem = $recon->retrieveCustomQuery("select l.routeId, i.processId from lot l join inventory i using (lotId) where i.lotId='$lotId'");
                $details = explode('|',$retrieveitem[0]);

                $_POST['quantity'];
                echo $usersArray['processId'] = getNextProcess($details[0],$details[1]);
                $usersArray['quantity'] = ($_POST['quantity'])? $_POST['quantity'] : $quantity;
                $lotArray['statusId']  = $usersArray['statusId']       =      (getNextProcess($details[0],$details[1])<>'-1')? $recon->GetValue('statusId','status','name="In Process" and type="lot"') : $recon->GetValue('statusId','status','name="Completed" and type="lot"');
		$lotArray['updateBy']  = $usersArray['updateBy'] 		=	$admin;
		$lotArray['updateDate'] = $usersArray['updateDate']		=	$datetime;

                $lotHistoryArray['lotId'] = $lotId;
                $lotHistoryArray['statusId'] = $lotArray['statusId'];
                $lotHistoryArray['processId'] = $details[1];
                $lotHistoryArray['machineId'] =  ($_POST['machineId'])? $_POST['machineId'] : 0;
                $lotHistoryArray['quantity'] = $usersArray['quantity'];
                $lotHistoryArray['remarks'] = "Move Lot";
                $lotHistoryArray['enteredBy']  	=	$admin;
		$lotHistoryArray['enteredDate'] =	$datetime;
	}else if($task=='view'){
                $retrieveitem = $recon->retrieveCustomQuery("select routeId, billofmaterialsId from lot where lotId='$lotId'");
                $details = explode('|',$retrieveitem[0]);

                $hasMaterials = checkInventory($details[1]);
                if($hasMaterials ){
                    reduceInventory($details[1]);
                }
                $usersArray['processId'] = getFirstProcess($details[0]);
                $lotArray['statusId']  = $usersArray['statusId']       =       $recon->GetValue('statusId','status','name="In Process" and type="lot"');
                $lotArray['updateBy']  = $usersArray['updateBy'] 		=	$admin;
		$lotArray['updateDate'] = $usersArray['updateDate']		=	$datetime;

                $lotHistoryArray['lotId'] = $lotId;
                $lotHistoryArray['statusId'] = $lotArray['statusId'];
                $lotHistoryArray['processId'] = $usersArray['processId'];
                $lotHistoryArray['machineId'] = 0;
                $lotHistoryArray['quantity'] = $quantity;
                $lotHistoryArray['remarks'] = "Start Lot";
                $lotHistoryArray['enteredBy']  	=	$admin;
		$lotHistoryArray['enteredDate'] =	$datetime;
                
        }
		//Posting values and assigning posted values to variables.
                $arrayAvoid = array("task","lotCode","machineId");
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
                

                $required_fields   	=	array('itemId');
                if(empty($itemId)){

                                $errmsg[]	=	$validation_class->validations($required_fields,'required');
                }
                if($task=='create'){	//Validation for Duplications
                        $errmsg[]	=	($core->checkExist("inventory in join item i using(itemId)" , "in.itemId" , $itemId, ' AND in.lotId = 0 AND i.itemTypeId in =1')) ? "Item already exist in Inventory " : "";
                }
                if(!$lotArray['routeId'] && $task=='create'){
                    $errmsg[] = "No Active Route for the Item Selected";
                }
                if(!$lotArray['billofmaterialsId'] && $task=='create'){
                    $errmsg[] = "No Active Bill of Materials for the Item Selected";
                }
                if(!$hasMaterials && $task=='view'){
                    $errmsg[] = "No Materials for Lot to Start";
                }


		//Save Values to the Database if no Errors Found
		$error_messages				=	implode('', $errmsg);

		if (empty($error_messages)) {
			//Save Posted Array Values to Database
                        $task= ($task=='view')? 'edit' : $task;
                        
                        $queryResult 		= 	$coreMaintenance->saveDatabase($task,$userTable,$usersArray,$sid);
                        $queryResult 		= 	$coreMaintenance->saveDatabase($task,'lot',$lotArray,$lotId);
                        $queryResult 		= 	$coreMaintenance->saveDatabase("create",'lothistory',$lotHistoryArray,$lotId);

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

