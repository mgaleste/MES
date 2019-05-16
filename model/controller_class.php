<?php

class controller_class{
	
	var $controller_array;
	var $con_count;
	var $cont_type;
	var $cont_table;
	var $cont_query;
	
	
	function __construct(){
	$this->cont_table	=	'modules';
	$this->cont_con		=	new connection();
	}
	
	function retrieve_paths($module,$controller_type){
		$module_dir = "";
		$mod_controller_arr = array();
		$modlist = array(); 
		$is_found=0;
		$table = $this->cont_table;
		$cont_query="SELECT * FROM $table";
		$this->cont_con->qselectDb($cont_query);
	
		while($this->cont_con->fetchRs()){
			$modlist[] = $this->cont_con->rs['moduleName'];
		}
		
		
			
			if(in_array($module,$modlist)){
				$mod_controller_arr['dir']		= 	'modules/'.$module.'/';
				$mod_controller_arr['viewdir']	=	'modules/'.$module.'/view/';
				$mod_controller_arr['imagedir']	=	'modules/'.$module.'/images/';
				
				if($controller_type=='modular'){
						return $mod_controller_arr;
				}elseif($controller_type=='middlemain' || $controller_type=='left'){
						$main_mod_dir = 'modules/'.$module.'/';
						return $main_mod_dir;
				}
			}else{
				if($controller_type!='left'){
					echo 'Module not found. Please contact webmaster.';
				}
						return false;
			}
		
	}
	
	

}

?>
