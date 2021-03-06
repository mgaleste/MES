<?
class coreFunctions extends recordUpdate {
	
	private $currentUserId;
	
	private $table;	
	private $tableCaption;	
	private $tableCond;	
	
	public function checkDuplicateEntry($dbTable,$cond,$dbField="*"){
		$result		=	"";
        $conn		=	$this->getDbConnection();
        mysqli_autocommit($conn, false);

        $sql		=	"SELECT $dbField FROM $dbTable WHERE $cond";
        $stmt		=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            return true;
        }else{
			return false;
		}	
	}
	
	public function logAdminTask($username,$mod,$task,$activity){	
		$datetime				=	date("Y-m-d H:i:s"); 
		$arr					=	array();
		$arr['id']				=	getID("adminlogs");
		$arr['username']		= 	$username;
		$arr['ip_address']		=	$_SERVER['REMOTE_ADDR'];
		$arr['browser']			=	$_SERVER['HTTP_USER_AGENT'];
		$arr['module']			=	$mod;
		$arr['task']			=	$task;
		$arr['timestamps']		=	$datetime;
		$arr['activitydone']	=	$activity;			
		self::insertRecord($arr, "adminlogs");
	}
	
	public function getIdCaption($tableCaption,$table,$tableCond){
		$result	=	"";
        $conn	=	$this->getDbConnection();
        mysqli_autocommit($conn, false);

        $sql	=	"SELECT $tableCaption FROM $table WHERE $tableCond";
        $stmt	=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $result	=	$row[$tableCaption];
        }
        return $result;
	}
	
	public 	function checkIfEnabled($groupCode, $moduleid, $taskid){
			$arrayValues4 	=	array('id','groupCode','moduleid','accessid');
			$recon 			=	new recordUpdate();
			$retArray4 		=	$recon->retrieveEntry("groupmoduleaccess", $arrayValues4, "", "groupCode='$groupCode' AND moduleid='$moduleid' AND accessid LIKE ('%$taskid%')");
								
			foreach ($retArray4 as $retIndex => $retValue) {
					$$retIndex 		=	$retValue;
					$mainArr 		=	explode('|', $$retIndex);
					$grid 			=	$mainArr[0];
					return "checked";							
			} 						
	}
	
	//get album primary picture if upload primary is disabled
	public function getAlbumPrimaryPic($menuid){
			$result	=	"";
			$conn	=	$this->getDbConnection();
			mysqli_autocommit($conn, false);

			$sql	=	"SELECT imagepath FROM albumitems WHERE album='$menuid' AND type='photo' AND primaryphoto='yes' ";
			$stmt	=	mysqli_query($conn, $sql);

			if ($row	=	mysqli_fetch_assoc($stmt)) {
				$result	=	$row['imagepath'];
			}
			return $result;
	}
	
    public function getModuleFunction($type) {
        $conn = $this->getDbConnection();
        mysqli_autocommit($conn, false);

        $sql 	=	"SELECT type, is_category,is_postingdate,is_author,is_image,is_title,is_content,is_tag,is_gallery FROM modules WHERE type='$type' ";
        $stmt 	=	mysqli_query($conn, $sql);

        $returnArray 	=	array();
        $returnArr 		=	array();

        while ($row = mysqli_fetch_assoc($stmt)) {
            foreach ($row as $rowIndex => $rowValue) {
                $returnArray[$rowIndex] = $rowValue;
            }
            $var = implode('|', $returnArray);
            $returnArr[] = $var;
        }
        return $returnArr;
    }
    public function getModuleFunctionVideo($type) {
        $conn = $this->getDbConnection();
        mysqli_autocommit($conn, false);

        $sql 	=	"SELECT type, is_category,is_postingdate,is_author,is_image,is_title,is_content,is_tag,is_gallery FROM modules WHERE type='$type' AND modulename='video' ";
        $stmt 	=	mysqli_query($conn, $sql);

        $returnArray 	=	array();
        $returnArr 		=	array();

        while ($row = mysqli_fetch_assoc($stmt)) {
            foreach ($row as $rowIndex => $rowValue) {
                $returnArray[$rowIndex] = $rowValue;
            }
            $var = implode('|', $returnArray);
            $returnArr[] = $var;
        }
        return $returnArr;
    }
    public function getParentBranch($type) {
        $conn = $this->getDbConnection();
        mysqli_autocommit($conn, false);
		$parent = "";
		$catig = "";
        $sql = "SELECT category,parent FROM category WHERE id='$type' ";
        $stmt = mysqli_query($conn, $sql);

        if ($row = mysqli_fetch_assoc($stmt)) {
            $parent = $row['parent'];
            $catig 	= $row['category'];
        }

        //check if parent is 0
        if ($parent == 0) {
            $cat = $catig;
        } else {
            $sql2 = "SELECT category FROM category c where id='$parent'";
            $stmt2 = mysqli_query($conn, $sql2);

            if ($row2 = mysqli_fetch_assoc($stmt2)) {
                $cat = $row2['category'];
            }
        }
        return $cat;
    }

    public function getPageCategoryId($category) {
        $conn = $this->getDbConnection();
        mysqli_autocommit($conn, false);
	$catig = "";
        $sql 	=	"SELECT id FROM category WHERE category='$category' ";
        $stmt 	=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $catig	=	$row['id'];
        }else{
		$catid = "";
		}
        return $catig;
    }

    public function isPageMultiple($type) {
        $result	=	"";
        $conn	=	$this->getDbConnection();
        mysqli_autocommit($conn, false);

        $sql	=	"SELECT name FROM reference WHERE ref_name='is_multiple' and remarks1='$type'";
        $stmt	=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $result	=	$row['name'];
        }
        return $result;
    }
	
	public function getPageCategory($categoryid) {
        $conn	=	$this->getDbConnection();
        mysqli_autocommit($conn, false);

        $sql	=	"SELECT category FROM category WHERE id='$categoryid' ";
        $stmt	=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $category	=	$row['category'];
        }
        return $category;
    }
	
	public function getAlbum($albumid) {
        $album	=	"";
		$conn	=	$this->getDbConnection();
        mysqli_autocommit($conn, false);

        $sql	=	"SELECT id, album FROM album WHERE id='$albumid' ";
        $stmt	=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $album	=	$row['album'];
        }
        return $album;
    }
	
	public function getMinId($table,$cond="") {
        $conn	=	$this->getDbConnection();
        mysqli_autocommit($conn, false);
		
		if(!empty($cond)){
			$conds	=	" WHERE album='$cond' ";
		}else{
			$conds	=	"";
		}	
				
        $sql	=	"SELECT MIN(id) as id FROM $table $conds";
        $stmt	=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $id		=	$row['id'];
        }
        return $id;
    }
	
	public function getPrimaryPhoto($table,$album) {
		$conn	=	$this->getDbConnection();
        mysqli_autocommit($conn, false);
		 				
        $sql	=	"SELECT id, primaryphoto, imagepath FROM $table WHERE primaryphoto='yes' AND album='$album' ";
        $stmt	=	mysqli_query($conn, $sql);
		$imagepaths	=	"";
        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $imagepaths = $row['imagepath'];
        }		
        return $imagepaths;
	}
	
	
	public function showEmbedVideo($videotype, $videofile, $width=150 , $height=150){
	 	switch ($videotype)
		{		 	
			case "flash":		   
				return   $embedvideo = "<object width=\"$width\" height=\"$height\" data=\"$videofile\" type=\"application/x-shockwave-flash\">
								   <param name=\"src\" value=\"$videofile\" />
								   </object>";		   
			break;
		  
			case "shockwave":
				return	 $embedvideo = "<object classid=\"clsid:166b1bca-3f9c-11cf-8075-444553540000\" width=\"$width\" height=\"$height\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=8,5,1,0\">
									<param name=\"sound\" value=\"true\" />
									<param name=\"progress\" value=\"true\" />
									<param name=\"autostart\" value=\"false\" />
									<param name=\"swstretchstyle\" value=\"none\" />
									<param name=\"swstretchhalign\" value=\"none\" />
									<param name=\"swstretchvalign\" value=\"none\" />
									<param name=\"src\" value=\"$videofile\" />
									<embed type=\"application/x-director\" scale=\"tofit\"  width=\"$width\" height=\"$height\" src=\"$videofile\" swstretchvalign=\"none\" swstretchhalign=\"none\" swstretchstyle=\"none\" swliveconnect=\"false\" autostart=\"false\" progress=\"true\" sound=\"true\"></embed>
									</object>";	
			break;
		  
			case "windowsmedia":
				return	$embedvideo = "<object classid=\"clsid:6bf52a52-394a-11d3-b153-00c04f79faa6\" width=\"$width\" height=\"$height\" codebase=\"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701\">
									<param name=\"url\" value=\"$videofile\" /><embed scale=\"tofit\" type=\"application/x-mplayer2\" width=\"$width\" height=\"$height\" src=\"$videofile\" autostart=\"false\"></embed>
									</object>";
			break;
		  
			case "quicktime":
			 	return $embedvideo = "<object CLASSID=\"clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\" width=\"$width\" height=\"$height\" CODEBASE=\"http://www.apple.com/qtactivex/qtplugin.cab\">
					<param name=\"src\" value=\"$videofile\"> 
					<param name=\"autoplay\" value=\"false\">
					<param name=\"loop\" value=\"false\">
					<param name=\"controller\" value=\"true\">
					<embed src=\"$videofile\"   width=\"$width\" height=\"$height\" scale=\"tofit\" autoplay=\"false\" loop=\"false\" controller=\"true\" pluginspage=\"http://www.apple.com/quicktime/\"></embed>
				</object>";	
			break;
		  
			case "realmedia":			
				return	$embedvideo = "<object classid=\"clsid:cfcdaa03-8be4-11cf-b84b-0020afbbccfa\" width=\"$width\" height=\"$height\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0\">
									<param name=\"src\" value=\"$videofile\" /><embed scale=\"tofit\" type=\"audio/x-pn-realaudio-plugin\" width=\"$width\" height=\"$height\" src=\"$videofile\"  autostart=\"false\"></embed>
									</object>";
			break;	
				
			case "youtube":					 
					//$vidcode_out = preg_match('/[http\:\/]+[w]{3}\.[youtube]+\.[a-z]{3}\/([watch?v=]+)([a-zA-Z0-9_]+)/',$videofile,$matches);
					preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $videofile, $match);
					$t = $match[1];					
					//$t = $matches[2];
				//return	$embedvideo = "<iframe width=\"$width\" height=\"$height\" src=\"http://www.youtube.com/embed/$t?rel=0\" frameborder=\"0\" allowfullscreen></iframe>";				
				//return	$embedvideo = "<iframe width=\"$width\" height=\"$height\" src=\"http://www.youtube.com/watch?v=$t?rel=0\" frameborder=\"0\" allowfullscreen></iframe>";
				 
				//return	$embedvideo = "<iframe width=\"$width\" height=\"$height\" src=\"http://www.youtube.com/embed/$t?feature=player_embedded\" frameborder=\"0\" allowfullscreen></iframe>";
				return	$embedvideo = "<iframe width=\"$width\" height=\"$height\" src=\"http://www.youtube.com/embed/$t?feature=player_embedded\" frameborder=\"0\" allowfullscreen></iframe>";				

																						
			break;		  
		  
			default:
				return	 $embedvideo = "<object width=\"$width\" height=\"$height\" data=\"$videofile\" type=\"application/x-shockwave-flash\">
									   <param name=\"src\" value=\"$videofile\" />
									   </object>";
		}	 
	}
	 
	public function checkExist($table, $field , $checkfield, $condition=""){
		$result 	=	"";
        $conn 		=	$this->getDbConnection();
        mysqli_autocommit($conn, false);
        $sql		=	"SELECT * FROM $table WHERE $field LIKE '$checkfield' $condition";
        $stmt 		=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $result	=	true;
        }else{
		    $result =	false;
		}		
        return $result;	
	}
	
	public function getUsersGroup($currentUserName){
		$groupCode 	= 	"";
		$conn 		=	$this->getDbConnection();
        mysqli_autocommit($conn, false);
        $sql		=	"SELECT groupCode FROM users WHERE username='$currentUserName'";
        $stmt 		=	mysqli_query($conn, $sql);

        if ($row	=	mysqli_fetch_assoc($stmt)) {
            $groupCode	=	$row['groupCode'];
        }
		
		return $groupCode;	
	}
	
	public function getAvailableModule($groupCode){
		$conn 		=	$this->getDbConnection();
        mysqli_autocommit($conn, false);
		$sql		=	"SELECT moduleCode FROM group_modules g where groupCode='$groupCode'";
		$stmt 		=	mysqli_query($conn, $sql);
		 
		while ($row	=	mysqli_fetch_assoc($stmt)) {
            foreach ($row as $rowIndex => $rowValue) {
                $returnArray[$rowIndex] = $rowValue;
            }
            $var = implode(',', $returnArray);
            $returnArr[] = $var;
        }		
		//return array;
		return $returnArr;		
	}
	
	
	

}
?>
