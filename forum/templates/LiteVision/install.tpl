<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>{L_INSTALLATION}</title>
<link rel="stylesheet" href="templates/LiteVision/LiteVision.css" type="text/css">
<style type="text/css">
<!--
/* Specifiy background images for selected styles
   This can't be done within the external style sheet as NS4 sees image paths relative to
   the page which called the style sheet (i.e. this page in the root phpBB directory)
   whereas all other browsers see image paths relative to the style sheet.!
*/
th	{ color: #000000; font-size: 11px; font-weight : bold; background-color: #8AA5C8; height: 25px; }
td.cat		{ background-color:#CEDCEC; border: #cedcec; border-style: solid; height: 18px; }
td.rowpic	{ background-color: #CEDCEC; }
td.cathead,td.catsides,td.catleft,td.catright,td.catbottom { background-color:#CEDCEC; border: #cedcec; border-style: solid; height: 18px; }

/* Import the fancy styles for IE only (NS4.x doesn't use the @import function) */
@import url("templates/LiteVision/formIE.css"); 
-->
</style>
</head>
<body bgcolor="#E5E5E5" text="#000000" link="#006699" vlink="#5584AA">

<table width="100%" border="0" cellspacing="0" cellpadding="10" align="center"> 
	<tr>
		<td class="bodyline" width="100%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0" background="templates/LiteVision/images/cellpic_bkg.jpg">
<tr> 
<td><img src="templates/LiteVision/images/phpbb2_logo.jpg" border="0" alt="Forum Home" width="230" height="110" /></td>
<td align="center" width="100%"><span class="maintitle">{L_INSTALLATION}</span></td>
</tr>
</table>
</td>
			</tr>
			<tr>
				<td><br /><br /></td>
			</tr>
			<tr>
				<td colspan="2"><table width="90%" border="0" align="center" cellspacing="0" cellpadding="0">
					<tr>
						
<td>{L_INSTRUCTION_TEXT}</td>
					</tr>
				</table></td>
			</tr>
			<tr>
				<td><br /><br /></td>
			</tr>
			<tr>
				<td width="100%"><form action="{S_FORM_ACTION}" name="install_form" method="post"><table width="100%" cellpadding="2" cellspacing="1" border="0" class="forumline">
					<!-- BEGIN switch_stage_one_install -->
					<tr>
						
<th colspan="2" height="28">{L_INITIAL_CONFIGURATION}</th>
					</tr>
					<tr>
						
<td class="row1" align="right" width="30%">{L_LANGUAGE}: </td>
						<td class="row2">{S_LANG_SELECT}</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_DBMS}: </td>
						<td class="row2">{S_DBMS_SELECT}</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_UPGRADE}:</td>
						<td class="row2">{S_UPGRADE_SELECT}</td>
					</tr>
					<tr>
						
<th colspan="2" height="28">{L_DATABASE_CONFIGURATION}</th>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_DB_HOST}: </td>
						<td class="row2">
<input type="text" name="dbhost" value="{DB_HOST}" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_DB_NAME}: </td>
						<td class="row2">
<input type="text" name="dbname" value="{DB_NAME}" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_DB_USER}: </td>
						<td class="row2">
<input type="text" name="dbuser" value="{DB_USER}" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_DB_PASSWORD}: </td>
						<td class="row2">
<input type="password" name="dbpasswd" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_DB_PREFIX}: </td>
						<td class="row2">
<input type="text" name="prefix" value="{DB_PREFIX}" class="post" />
</td>
					</tr>
					<tr>
						
<th colspan="2" height="28">{L_ADMIN_CONFIGURATION}</th>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_ADMIN_EMAIL}: </td>
						<td class="row2">
<input type="text" name="board_email" class="post" />
</td>
					</tr> 
					<tr>
						
<td class="row1" align="right">{L_SERVER_NAME}: </td>
						<td class="row2">
<input type="text" name="server_name" value="{SERVER_NAME}" class="post" />
</td>
					</tr> 
					<tr>
						
<td class="row1" align="right">{L_SERVER_PORT}: </td>
						<td class="row2">
<input type="text" name="server_port" value="{SERVER_PORT}" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_SCRIPT_PATH}: </td>
						<td class="row2">
<input type="text" name="script_path" value="{SCRIPT_PATH}" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_ADMIN_USERNAME}: </td>
						<td class="row2">
<input type="text" name="admin_name" value="{ADMIN_USERNAME}" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_ADMIN_PASSWORD}: </td>
						<td class="row2">
<input type="password" name="admin_pass1" class="post" />
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_ADMIN_CONFIRM_PASSWORD}: </td>
						<td class="row2">
<input type="password" name="admin_pass2" class="post" />
</td>
					</tr>
					<!-- END switch_stage_one_install -->
					<!-- BEGIN switch_error_install -->
					<tr>
						
<th height="28">{L_ERROR_TITLE}</th>
					</tr>
					<tr>
						
<td class="row1" align="center">{L_ERROR}</td>
					</tr>
					<!-- END switch_error_install -->
					<!-- BEGIN switch_ftp_file -->
					<tr>
						
<th colspan="2" height="28">{L_FTP_INFO}</th>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_FTP_PATH}</td>
						<td class="row2">
<input type="text" name="ftp_dir" class="post">
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_FTP_USER}</td>
						<td class="row2">
<input type="text" name="ftp_user" class="post">
</td>
					</tr>
					<tr>
						
<td class="row1" align="right">{L_FTP_PASS}</td>
						<td class="row2">
<input type="password" name="ftp_pass" class="post">
</td>
					</tr>
					<!-- END switch_ftp_file -->
					<!-- BEGIN switch_ftp_option -->
					<tr>
						
<th colspan="2" height="28">{L_CHOOSE_FTP}</th>
					</tr>
					<tr>
						
<td class="row1" align="right" width="50%">{L_ATTEMPT_FTP}</td>
						<td class="row2"><input type="radio" name="send_file" value="2"></td>
					</tr>
					<tr>
						
<td class="row1" align="right" width="50%">{L_SEND_FILE}</td>
						<td class="row2"><input type="radio" name="send_file" value="1"></td>
					</tr>
					<!-- END switch_ftp_option -->
					<!-- BEGIN switch_common_install -->
					<tr> 
					  
<td class="catbottom" align="center" colspan="2" height="28">{S_HIDDEN_FIELDS} 
<input class="mainoption" type="submit" value="{L_SUBMIT}" /></td>
					</tr>
					<!-- END switch_common_install -->
					<!-- BEGIN switch_upgrade_install -->
					<tr>
						
<td class="catbottom" align="center" colspan="2" height="28">{L_UPGRADE_INST}</td>
					</tr>
					<tr>
						
<td class="catbottom" align="center" colspan="2" height="28"> 
<input type="submit" name="upgrade_now" value="{L_UPGRADE_SUBMIT}" class="liteoption" />
</td>
					</tr>
					<!-- END switch_upgrade_install -->
				</table></form></td>
			</tr>
		</table></td>
	</tr>
</table>

</body>
</html>
