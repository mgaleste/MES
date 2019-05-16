<?
$dbTable				=	"adminlogs";
$status 				= 	"";
$recon 					=	new recordUpdate();
$log 					=	new products();
$log->setModule($mod);
$log->setModuleType($type);
$items 					=	(isset($_GET['items'])) ? $_GET['items'] : $log->defaultItemList();
$log->setItems($items);		
$postingdate  = "";
$mform 					=	new formMaintenance();
$core					=	new coreMaintenance();
$coreFunctions			=	new coreFunctions();
$validation_class 		=	new validations();
$imgfunc 				=	new imageFunctions();
$admin					=	$_SESSION['gp_username'];
$datetime				=	date("Y-m-d H:i:s"); 
$currentdate 			= 	date('m/d/Y');
$currenttime 			= 	date('H:i:s');
$modulerecord 			=	new record($dbTable);
$sid 					=	(!empty($_GET['sid'])) ? $_GET['sid'] : "";
$export_excel                   =   (!empty($_GET['export']))? : 0;
//-----------------------------------------LISTING ---------------------------------------------------------------//
$paginate_arr['addquery'] 	= "";
//SEARCH  
	if (isset($_POST['psearch_entry'])) {
		$parse_arr 					=	array('pg', 'search');
		$searchloc 					=	(string) URL_Parser($_SERVER['QUERY_STRING'], $parse_arr) . "&search=" . $_POST['psearch_entry'];
		header("Location:?" . $searchloc);
	}
	if (isset($_GET['search'])) {
		$psearch 					=	trim($_GET['search']);
                switch($cat){
                case 'lothistory':
                            $searchArray 				=	array("lotCode");
                break;
                case 'lotimage':
                            $searchArray 				=	array("lotCode");
                break;
                case 'tickets':
                            $searchArray 				=	array("problem","description","siteName","lastName","firstName","middleName");
                break;
                }
		$log->setSearchVal($psearch);
		$log->setSearchArray($searchArray);
		$searchresult				=	$log->searchValue();
		$paginate_arr['addquery'] 	= 	$searchresult;
	}
switch($cat){
    case 'lothistory':
        $paginate_arr['paginatequery'] 	= "SELECT * from lothistory m join lot using (lotId) where 1=1 ";
        $paginate_arr['query'] 			= "ORDER BY m.lothistoryId DESC";
   
    break;
    case 'lotimage':
        $paginate_arr['paginatequery'] 	= "SELECT * from lotimages m join lot using (lotId) where 1=1 ";
        $paginate_arr['query'] 			= "ORDER BY m.lotimageId DESC";

    break;
    case 'logs':
    default:
        $paginate_arr['paginatequery'] 	= "SELECT id, username, ip_address, browser, module, task, timestamps, activitydone FROM $dbTable WHERE id>0 ";
        $paginate_arr['query'] 			= "ORDER BY id DESC";
    break;
}

//call the function  where you will pass your array of queries for the class' future use
$modulerecord->manage_record_queries($paginate_arr);
//get pagination results then assign to $article list
$list 					=	$modulerecord->get_paginated_array($items);
$result 				=	$list['result'];
$num_rows 				=	$list['num_rows'];
$PAGINATION_LINKS 		=	$list['PAGINATION_LINKS'];
$PAGINATION_INFO 		=	$list['PAGINATION_INFO'];
$PAGINATION_TOTALRECS 	=	$list['PAGINATION_TOTALRECS'];
  
?>

