<?	$subfolder = SITEPATH; ?>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>
<script type="text/javascript" src="{plug}jscripts/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script			
			script_url : '{plug}jscripts/tiny_mce/tiny_mce_gzip.php',
			// General options
		<? $types = array('products','contact_us'); 
		if(!in_array($type,$types)){?>				
			theme : "advanced",
		<?}else{?>
			theme : "simple",
		<?}?>
				plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

			// Theme options
			theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull, fontselect,fontsizeselect",
			theme_advanced_buttons2 : "pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent|,undo,redo,|,link,unlink,anchor,image,cleanup,code,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,removeformat,|,media,|,fullscreen,styleprops",			
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,
			width:600,			
			height:200,			
			file_browser_callback : "ajaxfilemanager",  //ajaxfilemanager
			paste_use_dialog : false,
			apply_source_formatting : true,
			force_br_newlines : true,
			force_p_newlines : false,	
			remove_script_host : true,			
			font_size_style_values : "8pt,10pt,12pt,14pt,18pt,24pt,36pt",			
			relative_urls : false,

			// Skin options
			skin : "o2k7",
			skin_variant : "silver" ,

			// Example content CSS (should be your site CSS)
			content_css : "{plug}jscripts/tiny_mce/css/content.css"
		});
	});	 
</script> 

<script type="text/javascript">
function ajaxfilemanager(field_name, url, type, win) {		 
			var ajaxfilemanagerurl = "<?=$subfolder?>apanel/{plug}jscripts/tiny_mce/{plug}ajaxfilemanager/ajaxfilemanager.php";
	 			
			switch (type) {
				case "image":
					break;
				case "media":
					break;
				case "flash": 
					break;
				case "file":
					break;
				default:
					return false;
			}
			
            tinyMCE.activeEditor.windowManager.open({
				url: "<?=$subfolder?>apanel/{plug}jscripts/tiny_mce/{plug}ajaxfilemanager/ajaxfilemanager.php",			   
				width: 680,
                height: 800,
                inline : "yes",
                close_previous : "no"
            },{
                window : win,
                input : field_name
            });
            
		}
		function getXMLHTTP() { //fuction to return the xml http object
						var xmlhttp=false;	
						try{
							xmlhttp=new XMLHttpRequest();
						}
						catch(e)	{		
							try{			
								xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
							}
							catch(e){
								try{
								xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
								}
								catch(e1){
									xmlhttp=false;
								}
							}
						}
						 	
						return xmlhttp;
				    }
		function display_menu(display_area) {		
						//alert('subsub'+subSubSecId);
						var strURL="displaymenu.php";
						var req = getXMLHTTP();
						
						if (req) {			
							req.onreadystatechange = function() {
								if (req.readyState == 4) {
									// only if "OK"
									if (req.status == 200) {						
										document.getElementById(display_area).innerHTML=req.responseText;						
									} else {
										alert("There was a problem while using XMLHTTP:\n" + req.statusText);
									}
								}				
							}			
							req.open("GET", strURL, true);
							req.send(null);
						}		
					}
					
					</script>
