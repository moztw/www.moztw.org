<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="100%" height="26" valign="bottom" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="18%" valign="bottom"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
                    <tr>
                      <td width="5%" valign="bottom"><table height="21"  border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                          </tr>
                      </table></td>
                      <td width="95%"><table width="98%" cellspacing="2" cellpadding="2" border="0" align="center">
                          <tr>
                            <td><div align="right"><span class="gensmall"><strong>{SITENAME}</strong></span></div></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table><br>

<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_USER_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_USER_EXPLAIN}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table><br>

{ERROR_BOX}

<form action="{S_PROFILE_ACTION}" {S_FORM_ENCTYPE} method="post">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="left"><span class="gensmall"><strong>{L_THEMES_TITLE}</strong></span></div></td>
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
<table width="100%" cellspacing="1" cellpadding="0" border="0" align="center">
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2"><span class="gensmall">{L_ITEMS_REQUIRED}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC" width="50%"><span class="gen">{L_USERNAME}: *</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="username" size="35" maxlength="40" value="{USERNAME}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_EMAIL_ADDRESS}: *</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="email" size="35" maxlength="255" value="{EMAIL}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_NEW_PASSWORD}: *</span><br />
		<span class="gensmall">{L_PASSWORD_IF_CHANGED}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="password" name="password" size="35" maxlength="32" value="" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_CONFIRM_PASSWORD}: * </span><br />
		<span class="gensmall">{L_PASSWORD_CONFIRM_IF_CHANGED}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="password" name="password_confirm" size="35" maxlength="32" value="" />	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2">&nbsp;</td>
	</tr>
	<tr> 
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_PROFILE_INFO}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2"><span class="gensmall">{L_PROFILE_INFO_NOTICE}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_ICQ_NUMBER}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="icq" size="10" maxlength="15" value="{ICQ}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_AIM}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="aim" size="20" maxlength="255" value="{AIM}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_MESSENGER}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="msn" size="20" maxlength="255" value="{MSN}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_YAHOO}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="yim" size="20" maxlength="255" value="{YIM}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_WEBSITE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="website" size="35" maxlength="255" value="{WEBSITE}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_LOCATION}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="location" size="35" maxlength="100" value="{LOCATION}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_OCCUPATION}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="occupation" size="35" maxlength="100" value="{OCCUPATION}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_INTERESTS}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="interests" size="35" maxlength="150" value="{INTERESTS}" />	  </td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_SIGNATURE}</span><br />
		<span class="gensmall">{L_SIGNATURE_EXPLAIN}<br />
		<br />
		{HTML_STATUS}<br />
		{BBCODE_STATUS}<br />
		{SMILIES_STATUS}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<textarea class="form2" name="signature" rows="6" cols="45">{SIGNATURE}</textarea>	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2"><span class="cattitle">&nbsp;</span></td>
	</tr>
	<tr> 
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_PREFERENCES}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_PUBLIC_VIEW_EMAIL}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="viewemail" value="1" {VIEW_EMAIL_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="viewemail" value="0" {VIEW_EMAIL_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_HIDE_USER}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="hideonline" value="1" {HIDE_USER_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="hideonline" value="0" {HIDE_USER_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_NOTIFY_ON_REPLY}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="notifyreply" value="1" {NOTIFY_REPLY_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="notifyreply" value="0" {NOTIFY_REPLY_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_NOTIFY_ON_PRIVMSG}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="notifypm" value="1" {NOTIFY_PM_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="notifypm" value="0" {NOTIFY_PM_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_POPUP_ON_PRIVMSG}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="popup_pm" value="1" {POPUP_PM_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="popup_pm" value="0" {POPUP_PM_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ADD_SIGNATURE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="attachsig" value="1" {ALWAYS_ADD_SIGNATURE_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="attachsig" value="0" {ALWAYS_ADD_SIGNATURE_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ALLOW_BBCODE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="allowbbcode" value="1" {ALWAYS_ALLOW_BBCODE_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="allowbbcode" value="0" {ALWAYS_ALLOW_BBCODE_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ALLOW_HTML}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="allowhtml" value="1" {ALWAYS_ALLOW_HTML_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="allowhtml" value="0" {ALWAYS_ALLOW_HTML_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_ALWAYS_ALLOW_SMILIES}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="allowsmilies" value="1" {ALWAYS_ALLOW_SMILIES_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="allowsmilies" value="0" {ALWAYS_ALLOW_SMILIES_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_BOARD_LANGUAGE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB">{LANGUAGE_SELECT}</td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_BOARD_STYLE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB">{STYLE_SELECT}</td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_TIMEZONE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB">{TIMEZONE_SELECT}</td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_DATE_FORMAT}</span><br />
		<span class="gensmall">{L_DATE_FORMAT_EXPLAIN}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="dateformat" value="{DATE_FORMAT}" maxlength="16" />	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2"><span class="cattitle">&nbsp;</span></td>
	</tr>
	<tr> 
	  <th class="stil06" colspan="2" height="28" valign="bottom"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_AVATAR_PANEL}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr align="center"> 
	  <td bgcolor="#E1ECFB" colspan="2"> 
		<table width="100%" cellspacing="2" cellpadding="0" border="0">
		  <tr> 
			<td width="65%"><span class="gensmall">{L_AVATAR_EXPLAIN}</span></td>
			<td align="center"><span class="gensmall">{L_CURRENT_IMAGE}</span><br />
			  {AVATAR}<br />
			  <input type="checkbox" name="avatardel" />
			  &nbsp;<span class="gensmall">{L_DELETE_AVATAR}</span></td>
		  </tr>
		</table>
	  </td>
	</tr>

	<!-- BEGIN avatar_local_upload -->
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_UPLOAD_AVATAR_FILE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="hidden" name="MAX_FILE_SIZE" value="{AVATAR_SIZE}" />
		<input type="file" name="avatar" class="form2" style="width: 200px"  />	  </td>
	</tr>
	<!-- END avatar_local_upload -->
	<!-- BEGIN avatar_remote_upload -->
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_UPLOAD_AVATAR_URL}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="avatarurl" size="40" class="post" style="width: 200px"  />
	  </td>
	</tr>
	<!-- END avatar_remote_upload -->
	<!-- BEGIN avatar_remote_link -->
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_LINK_REMOTE_AVATAR}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input class="form2" type="text" name="avatarremoteurl" size="40" class="post" style="width: 200px"  />
	  </td>
	</tr>
	<!-- END avatar_remote_link -->
	<!-- BEGIN avatar_local_gallery -->
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_AVATAR_GALLERY}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="submit" name="avatargallery" value="{L_SHOW_GALLERY}" class="form2" />	  </td>
	</tr>
	<!-- END avatar_local_gallery -->

	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2">&nbsp;</td>
	</tr>
	<tr>
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_SPECIAL}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr>
	  <td bgcolor="#E1ECFB" colspan="2"><span class="gensmall">{L_SPECIAL_EXPLAIN}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_USER_ACTIVE}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="user_status" value="1" {USER_ACTIVE_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="user_status" value="0" {USER_ACTIVE_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_ALLOW_PM}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="user_allowpm" value="1" {ALLOW_PM_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="user_allowpm" value="0" {ALLOW_PM_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_ALLOW_AVATAR}</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="radio" name="user_allowavatar" value="1" {ALLOW_AVATAR_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="user_allowavatar" value="0" {ALLOW_AVATAR_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
	<tr>
		<td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_SELECT_RANK}</span></td>
		<td width="50%" bgcolor="#E1ECFB"><select name="user_rank">{RANK_SELECT_BOX}</select></td>
	</tr>
	<tr> 
	  <td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_DELETE_USER}?</span></td>
	  <td width="50%" bgcolor="#E1ECFB"> 
		<input type="checkbox" name="deleteuser">
		<span class="gen">{L_DELETE_USER_EXPLAIN}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2" align="center">{S_HIDDEN_FIELDS} 
		<input type="submit" name="submit" value="{L_SUBMIT}" class="form2" />
		&nbsp;&nbsp; 
		<input type="reset" value="{L_RESET}" class="form2" />
	  </td>
	</tr>
</table>	  </td>
    </tr>
</table>

</td>
  </tr>
</table>
</form>
