
<form action="{S_PROFILE_ACTION}" {S_FORM_ENCTYPE} method="post">

{ERROR_BOX}

<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="21"  border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top">&nbsp;&nbsp;<span  class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" height="28" valign="bottom" class="stil06">
            <table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><div align="center"><span class="genmed"><strong>{L_REGISTRATION_INFO}</strong></span></div></td>
              </tr>
          </table></td>
          <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
        <tr>
          <td>
		  
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
	<tr> 
		<td bgcolor="#E1ECFB" colspan="2"><span class="gensmall">{L_ITEMS_REQUIRED}</span></td>
	</tr>
	<!-- BEGIN switch_namechange_disallowed -->
	<tr> 
		<td bgcolor="#EAF1FC" width="38%"><span class="gen">{L_USERNAME}: *</span></td>
		<td bgcolor="#EAF1FC"><input type="hidden" name="username" value="{USERNAME}" /><span class="gen"><b>{USERNAME}</b></span></td>
	</tr>
	<!-- END switch_namechange_disallowed -->
	<!-- BEGIN switch_namechange_allowed -->
	<tr> 
		<td bgcolor="#EAF1FC" width="38%"><span class="gen">{L_USERNAME}: *</span></td>
		<td bgcolor="#EAF1FC"><input type="text" class="form2" style="width:200px" name="username" size="25" maxlength="25" value="{USERNAME}" /></td>
	</tr>
	<!-- END switch_namechange_allowed -->
	<tr> 
		<td bgcolor="#EAF1FC"><span class="gen">{L_EMAIL_ADDRESS}: *</span></td>
		<td bgcolor="#EAF1FC"><input type="text" class="form2" style="width:200px" name="email" size="25" maxlength="255" value="{EMAIL}" /></td>
	</tr>
	<!-- BEGIN switch_edit_profile -->
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_CURRENT_PASSWORD}: *</span><br />
		<span class="gensmall">{L_CONFIRM_PASSWORD_EXPLAIN}</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="password" class="form2" style="width: 200px" name="cur_password" size="25" maxlength="32" value="{CUR_PASSWORD}" />
	  </td>
	</tr>
	<!-- END switch_edit_profile -->
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_NEW_PASSWORD}: *</span><br />
		<span class="gensmall">{L_PASSWORD_IF_CHANGED}</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="password" class="form2" style="width: 200px" name="new_password" size="25" maxlength="32" value="{NEW_PASSWORD}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_CONFIRM_PASSWORD}: * </span><br />
		<span class="gensmall">{L_PASSWORD_CONFIRM_IF_CHANGED}</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="password" class="form2" style="width: 200px" name="password_confirm" size="25" maxlength="32" value="{PASSWORD_CONFIRM}" />
	  </td>
	</tr>
	<!-- Visual Confirmation -->
	<!-- BEGIN switch_confirm -->
	<tr>
		<td bgcolor="#E1ECFB" colspan="2" align="center"><span class="gensmall">{L_CONFIRM_CODE_IMPAIRED}</span><br /><br />{CONFIRM_IMG}<br /><br /></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_CONFIRM_CODE}: * </span><br /><span class="gensmall">{L_CONFIRM_CODE_EXPLAIN}</span></td>
	  <td bgcolor="#EAF1FC"><input type="text" class="form2" style="width: 200px" name="confirm_code" size="6" maxlength="6" value="" /></td>
	</tr>
	<!-- END switch_confirm -->
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2" height="28">&nbsp;</td>
	</tr>
	<tr valign="bottom"> 
	  <th class="stil06" colspan="2" height="28"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="bottom"><div align="center"><span class="genmed"><strong>{L_PROFILE_INFO}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2"><span class="gensmall">{L_PROFILE_INFO_NOTICE}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_ICQ_NUMBER}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" name="icq" class="form2"style="width: 100px"  size="10" maxlength="15" value="{ICQ}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_AIM}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" class="form2"style="width: 150px"  name="aim" size="20" maxlength="255" value="{AIM}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_MESSENGER}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" class="form2"style="width: 150px"  name="msn" size="20" maxlength="255" value="{MSN}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_YAHOO}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" class="form2"style="width: 150px"  name="yim" size="20" maxlength="255" value="{YIM}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_WEBSITE}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" class="form2"style="width: 200px"  name="website" size="25" maxlength="255" value="{WEBSITE}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_LOCATION}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" class="form2"style="width: 200px"  name="location" size="25" maxlength="100" value="{LOCATION}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_OCCUPATION}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" class="form2"style="width: 200px"  name="occupation" size="25" maxlength="100" value="{OCCUPATION}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_INTERESTS}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" class="form2"style="width: 200px"  name="interests" size="35" maxlength="150" value="{INTERESTS}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_SIGNATURE}:</span><br /><span class="gensmall">{L_SIGNATURE_EXPLAIN}<br /><br />{HTML_STATUS}<br />{BBCODE_STATUS}<br />{SMILIES_STATUS}</span></td>
	  <td bgcolor="#EAF1FC"> 
		<textarea name="signature"style="width: 300px"  rows="6" cols="30" class="form2">{SIGNATURE}</textarea>
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2" height="28">&nbsp;</td>
	</tr>
	<tr> 
	  <th class="stil06" colspan="2" height="28" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="bottom"><div align="center"><span class="genmed"><strong>{L_PREFERENCES}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_PUBLIC_VIEW_EMAIL}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="viewemail" value="1" {VIEW_EMAIL_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="viewemail" value="0" {VIEW_EMAIL_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_HIDE_USER}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="hideonline" value="1" {HIDE_USER_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="hideonline" value="0" {HIDE_USER_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_NOTIFY_ON_REPLY}:</span><br />
		<span class="gensmall">{L_NOTIFY_ON_REPLY_EXPLAIN}</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="notifyreply" value="1" {NOTIFY_REPLY_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="notifyreply" value="0" {NOTIFY_REPLY_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_NOTIFY_ON_PRIVMSG}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="notifypm" value="1" {NOTIFY_PM_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="notifypm" value="0" {NOTIFY_PM_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_POPUP_ON_PRIVMSG}:</span><br /><span class="gensmall">{L_POPUP_ON_PRIVMSG_EXPLAIN}</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="popup_pm" value="1" {POPUP_PM_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="popup_pm" value="0" {POPUP_PM_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ADD_SIGNATURE}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="attachsig" value="1" {ALWAYS_ADD_SIGNATURE_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="attachsig" value="0" {ALWAYS_ADD_SIGNATURE_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ALLOW_BBCODE}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="allowbbcode" value="1" {ALWAYS_ALLOW_BBCODE_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="allowbbcode" value="0" {ALWAYS_ALLOW_BBCODE_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ALLOW_HTML}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="allowhtml" value="1" {ALWAYS_ALLOW_HTML_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="allowhtml" value="0" {ALWAYS_ALLOW_HTML_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ALLOW_SMILIES}:</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="radio" name="allowsmilies" value="1" {ALWAYS_ALLOW_SMILIES_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="allowsmilies" value="0" {ALWAYS_ALLOW_SMILIES_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_BOARD_LANGUAGE}:</span></td>
	  <td bgcolor="#EAF1FC"><span class="gensmall">{LANGUAGE_SELECT}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_BOARD_STYLE}:</span></td>
	  <td bgcolor="#EAF1FC"><span class="gensmall">{STYLE_SELECT}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_TIMEZONE}:</span></td>
	  <td bgcolor="#EAF1FC"><span class="gensmall">{TIMEZONE_SELECT}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC"><span class="gen">{L_DATE_FORMAT}:</span><br />
		<span class="gensmall">{L_DATE_FORMAT_EXPLAIN}</span></td>
	  <td bgcolor="#EAF1FC"> 
		<input type="text" name="dateformat" value="{DATE_FORMAT}" maxlength="14" class="form2" />
	  </td>
	</tr>
	<!-- BEGIN switch_avatar_block -->
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2" height="28">&nbsp;</td>
	</tr>
	<tr> 
	  <th class="stil06" colspan="2" height="28" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="bottom"><div align="center"><span class="genmed"><strong>{L_AVATAR_PANEL}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
		<td bgcolor="#E1ECFB" colspan="2"><table width="70%" cellspacing="2" cellpadding="0" border="0" align="center">
			<tr> 
				<td width="65%"><span class="gensmall">{L_AVATAR_EXPLAIN}</span></td>
				<td align="center"><span class="gensmall">{L_CURRENT_IMAGE}</span><br />{AVATAR}<br /><input type="checkbox" name="avatardel" />&nbsp;<span class="gensmall">{L_DELETE_AVATAR}</span></td>
			</tr>
		</table></td>
	</tr>
	<!-- BEGIN switch_avatar_local_upload -->
	<tr> 
		<td bgcolor="#EAF1FC"><span class="gen">{L_UPLOAD_AVATAR_FILE}:</span></td>
		<td bgcolor="#EAF1FC"><input type="hidden" name="MAX_FILE_SIZE" value="{AVATAR_SIZE}" />
		<input type="file" name="avatar" class="form2"></td>
	</tr>
	<!-- END switch_avatar_local_upload -->
	<!-- BEGIN switch_avatar_remote_upload -->
	<tr> 
		<td bgcolor="#EAF1FC"><span class="gen">{L_UPLOAD_AVATAR_URL}:</span><br /><span class="gensmall">{L_UPLOAD_AVATAR_URL_EXPLAIN}</span></td>
		<td bgcolor="#EAF1FC"><input type="text" name="avatarurl" size="40" class="form2" style="width:200px" /></td>
	</tr>
	<!-- END switch_avatar_remote_upload -->
	<!-- BEGIN switch_avatar_remote_link -->
	<tr> 
		<td bgcolor="#EAF1FC"><span class="gen">{L_LINK_REMOTE_AVATAR}:</span><br /><span class="gensmall">{L_LINK_REMOTE_AVATAR_EXPLAIN}</span></td>
		<td bgcolor="#EAF1FC"><input type="text" name="avatarremoteurl" size="40" class="form2" style="width:200px" /></td>
	</tr>
	<!-- END switch_avatar_remote_link -->
	<!-- BEGIN switch_avatar_local_gallery -->
	<tr> 
		<td bgcolor="#EAF1FC"><span class="gen">{L_AVATAR_GALLERY}:</span></td>
		<td bgcolor="#EAF1FC"><input type="submit" name="avatargallery" value="{L_SHOW_GALLERY}" class="form2" /></td>
	</tr>
	<!-- END switch_avatar_local_gallery -->
	<!-- END switch_avatar_block -->
	<tr>
		<td bgcolor="#E1ECFB" colspan="2" align="center" height="28">{S_HIDDEN_FIELDS}<input type="submit" name="submit" value="{L_SUBMIT}" class="form2" />&nbsp;&nbsp;<input type="reset" value="{L_RESET}" name="reset" class="form2" /></td>
	</tr>
</table>
		  
		  </td>
        </tr>
      </table>      </td>
  </tr>
</table>

</form>
