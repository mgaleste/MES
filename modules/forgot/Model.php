<?
	error_reporting(0);
	$username  				=	""; 
	$emailaddress 			=	""; 
	$errmsg 				=	"";
	$errormessage			=	"Invalid User or Email Address";
	$successmessage			=	"Successfully Reset Password.";	
	$users 					= 	new users();

	if(isset($_POST['Send'])){
		$username			= 	trim(htmlentities($_POST['user_name']));
		$emailaddress 		= 	trim(htmlentities($_POST['emailaddress']));
		
		if(empty($username) || empty($emailaddress)){
			$errmsg 		=	$errormessage. ", No such Username or Email";
		}else{
			if(!isEmail($emailaddress)){ 
					$errmsg 			=	$errormessage;			
			}else{ 			
				if(empty($errmsg)){
					$exist				=	$users->checkUserExist($username, $emailaddress);
                                        
					if($exist===true){
						$status 		= 	$users->forgotPassword($username, $emailaddress);
						$errmsg 		=	($status=='send') ? $successmessage : $errormessage.", Failed to send email";
					}else{
						$errmsg			=	$errormessage;
					}
				}
			}
		}		
	}
?>