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
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_CONFIGURATION_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_CONFIGURATION_EXPLAIN}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table><br>

<form action="{S_CONFIG_ACTION}" method="post">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><div align="left"><span class="gensmall"><strong>&nbsp;{L_CONFIGURATION_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#FFFFFF">
<table width="100%" cellpadding="2" cellspacing="1" border="0" align="center">
            <tr valign="bottom">
              <th height="26" colspan="2" class="stil06"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_GENERAL_SETTINGS}</strong></span></div></td>
                  </tr>
              </table></th>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SERVER_NAME}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="255" size="40" name="server_name" value="{SERVER_NAME}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SERVER_PORT}<br />
                {L_SERVER_PORT_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="5" size="5" name="server_port" value="{SERVER_PORT}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SCRIPT_PATH}<br />
                {L_SCRIPT_PATH_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="255" name="script_path" value="{SCRIPT_PATH}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SITE_NAME}</span><br />
                  <span class="gensmall">{L_SITE_NAME_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="25" maxlength="100" name="sitename" value="{SITENAME}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SITE_DESCRIPTION}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="40" maxlength="255" name="site_desc" value="{SITE_DESCRIPTION}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_DISABLE_BOARD}</span><br />
                  <span class="gensmall">{L_DISABLE_BOARD_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="board_disable" value="1" {S_DISABLE_BOARD_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="board_disable" value="0" {S_DISABLE_BOARD_NO} />
      <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ACCT_ACTIVATION}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="require_activation" value="{ACTIVATION_NONE}" {ACTIVATION_NONE_CHECKED} />
                <span class="gensmall">{L_NONE}&nbsp; &nbsp;</span>
                <input type="radio" name="require_activation" value="{ACTIVATION_USER}" {ACTIVATION_USER_CHECKED} />
                <span class="gensmall">{L_USER}&nbsp; &nbsp;</span>
                <input type="radio" name="require_activation" value="{ACTIVATION_ADMIN}" {ACTIVATION_ADMIN_CHECKED} />
                <span class="gensmall">{L_ADMIN}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_BOARD_EMAIL_FORM}</span><br />
                  <span class="gensmall">{L_BOARD_EMAIL_FORM_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="board_email_form" value="1" {BOARD_EMAIL_FORM_ENABLE} />
      <span class="gensmall">{L_ENABLED}&nbsp;&nbsp;</span>
      <input type="radio" name="board_email_form" value="0" {BOARD_EMAIL_FORM_DISABLE} />
      <span class="gensmall">{L_DISABLED}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_FLOOD_INTERVAL}</span> <br />
                  <span class="gensmall">{L_FLOOD_INTERVAL_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="3" maxlength="4" name="flood_interval" value="{FLOOD_INTERVAL}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_TOPICS_PER_PAGE}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" name="topics_per_page" size="3" maxlength="4" value="{TOPICS_PER_PAGE}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_POSTS_PER_PAGE}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" name="posts_per_page" size="3" maxlength="4" value="{POSTS_PER_PAGE}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_HOT_THRESHOLD}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" name="hot_threshold" size="3" maxlength="4" value="{HOT_TOPIC}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_DEFAULT_STYLE}</span></td>
              <td bgcolor="#EAF1FC"><span class="gensmall">{STYLE_SELECT}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_OVERRIDE_STYLE}</span><br />
                  <span class="gensmall">{L_OVERRIDE_STYLE_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="override_user_style" value="1" {OVERRIDE_STYLE_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="override_user_style" value="0" {OVERRIDE_STYLE_NO} />
     <span class="gensmall"> {L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_DEFAULT_LANGUAGE}</span></td>
              <td bgcolor="#EAF1FC"><span class="gensmall">{LANG_SELECT}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_DATE_FORMAT}</span><br />
                  <span class="gensmall">{L_DATE_FORMAT_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" name="default_dateformat" value="{DEFAULT_DATEFORMAT}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SYSTEM_TIMEZONE}</span></td>
              <td bgcolor="#EAF1FC"><span class="gensmall">{TIMEZONE_SELECT}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ENABLE_GZIP}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="gzip_compress" value="1" {GZIP_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="gzip_compress" value="0" {GZIP_NO} />
      <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ENABLE_PRUNE}</td>
              <td bgcolor="#EAF1FC"><input type="radio" name="prune_enable" value="1" {PRUNE_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="prune_enable" value="0" {PRUNE_NO} />
     <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr valign="bottom">
              <th height="26" colspan="2" class="stil06"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top"><div align="center"><span class="gensmall"><strong>{L_COOKIE_SETTINGS}</strong></span></div></td>
                </tr>
              </table></th>
            </tr>
            <tr bgcolor="#EAF1FC">
              <td colspan="2"><div align="justify"><span class="gensmall">{L_COOKIE_SETTINGS_EXPLAIN}</span></div></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_COOKIE_DOMAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="255" name="cookie_domain" value="{COOKIE_DOMAIN}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_COOKIE_NAME}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="16" name="cookie_name" value="{COOKIE_NAME}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_COOKIE_PATH}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="255" name="cookie_path" value="{COOKIE_PATH}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_COOKIE_SECURE}</span><br />
                  <span class="gensmall">{L_COOKIE_SECURE_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="cookie_secure" value="0" {S_COOKIE_SECURE_DISABLED} />
                <span class="gensmall">{L_DISABLED}&nbsp; &nbsp;</span>
                <input type="radio" name="cookie_secure" value="1" {S_COOKIE_SECURE_ENABLED} />
                <span class="gensmall">{L_ENABLED}</td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SESSION_LENGTH}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="5" size="5" name="session_length" value="{SESSION_LENGTH}" /></td>
            </tr>
            <tr valign="bottom">
              <th height="26" colspan="2" class="stil06"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top"><div align="center"><span class="gensmall"><strong>{L_PRIVATE_MESSAGING}</strong></span></div></td>
                </tr>
              </table></th>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_DISABLE_PRIVATE_MESSAGING}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="privmsg_disable" value="0" {S_PRIVMSG_ENABLED} />
                <span class="gensmall">{L_ENABLED}&nbsp; &nbsp;</span>
                <input type="radio" name="privmsg_disable" value="1" {S_PRIVMSG_DISABLED} />
                <span class="gensmall">{L_DISABLED}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_INBOX_LIMIT}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="4" size="4" name="max_inbox_privmsgs" value="{INBOX_LIMIT}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SENTBOX_LIMIT}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="4" size="4" name="max_sentbox_privmsgs" value="{SENTBOX_LIMIT}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SAVEBOX_LIMIT}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" maxlength="4" size="4" name="max_savebox_privmsgs" value="{SAVEBOX_LIMIT}" /></td>
            </tr>
            <tr>
              <th height="26" colspan="2" valign="bottom" class="stil06"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top"><div align="center"><span class="gensmall"><strong>{L_ABILITIES_SETTINGS}</strong></span></div></td>
                </tr>
              </table></th>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_MAX_POLL_OPTIONS}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" name="max_poll_options" size="4" maxlength="4" value="{MAX_POLL_OPTIONS}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_HTML}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_html" value="1" {HTML_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_html" value="0" {HTML_NO} />
      <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOWED_TAGS}</span><br />
                  <span class="gensmall">{L_ALLOWED_TAGS_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="30" maxlength="255" name="allow_html_tags" value="{HTML_TAGS}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_BBCODE}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_bbcode" value="1" {BBCODE_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_bbcode" value="0" {BBCODE_NO} />
      <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_SMILIES}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_smilies" value="1" {SMILE_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_smilies" value="0" {SMILE_NO} />
     <span class="gensmall"> {L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SMILIES_PATH}</span> <br />
                  <span class="gensmall">{L_SMILIES_PATH_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="20" maxlength="255" name="smilies_path" value="{SMILIES_PATH}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_SIG}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_sig" value="1" {SIG_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_sig" value="0" {SIG_NO} />
     <span class="gensmall"> {L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_MAX_SIG_LENGTH}</span><br />
                  <span class="gensmall">{L_MAX_SIG_LENGTH_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="5" maxlength="4" name="max_sig_chars" value="{SIG_SIZE}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_NAME_CHANGE}</td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_namechange" value="1" {NAMECHANGE_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_namechange" value="0" {NAMECHANGE_NO} />
      <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <th height="26" colspan="2" valign="bottom" class="stil06"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top"><div align="center"><span class="gensmall"><strong>{L_AVATAR_SETTINGS}</strong></span></div></td>
                </tr>
              </table></th>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_LOCAL}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_avatar_local" value="1" {AVATARS_LOCAL_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_avatar_local" value="0" {AVATARS_LOCAL_NO} />
      <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_REMOTE} </span><br />
                  <span class="gensmall">{L_ALLOW_REMOTE_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_avatar_remote" value="1" {AVATARS_REMOTE_YES} />
     <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_avatar_remote" value="0" {AVATARS_REMOTE_NO} />
     <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ALLOW_UPLOAD}</td>
              <td bgcolor="#EAF1FC"><input type="radio" name="allow_avatar_upload" value="1" {AVATARS_UPLOAD_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;</span>
      <input type="radio" name="allow_avatar_upload" value="0" {AVATARS_UPLOAD_NO} />
      <span class="gensmall">{L_NO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_MAX_FILESIZE}</span><br />
                  <span class="gensmall">{L_MAX_FILESIZE_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><span class="gensmall"><input class="form2" type="text" size="4" maxlength="10" name="avatar_filesize" value="{AVATAR_FILESIZE}" />
      Bytes</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_MAX_AVATAR_SIZE}</span> <br />
                  <span class="gensmall">{L_MAX_AVATAR_SIZE_EXPLAIN}</span> </td>
              <td bgcolor="#EAF1FC"><span class="gensmall"><input class="form2" type="text" size="3" maxlength="4" name="avatar_max_height" value="{AVATAR_MAX_HEIGHT}" />
      x</span>
        <input class="form2" type="text" size="3" maxlength="4" name="avatar_max_width" value="{AVATAR_MAX_WIDTH}"></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_AVATAR_STORAGE_PATH} </span><br />
                  <span class="gensmall">{L_AVATAR_STORAGE_PATH_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="20" maxlength="255" name="avatar_path" value="{AVATAR_PATH}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_AVATAR_GALLERY_PATH}</span> <br />
                  <span class="gensmall">{L_AVATAR_GALLERY_PATH_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form" type="text" size="20" maxlength="255" name="avatar_gallery_path" value="{AVATAR_GALLERY_PATH}" /></td>
            </tr>
            <tr>
              <th height="26" colspan="2" valign="bottom" class="stil06"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top"><div align="center"><span class="gensmall"><strong>{L_COPPA_SETTINGS}</strong></span></div></td>
                </tr>
              </table></th>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_COPPA_FAX}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="25" maxlength="100" name="coppa_fax" value="{COPPA_FAX}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_COPPA_MAIL}</span><br />
                  <span class="gensmall">{L_COPPA_MAIL_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><textarea name="coppa_mail" rows="5" cols="30" class="form2">{COPPA_MAIL}</textarea></td>
            </tr>
            <tr>
              <th height="26" colspan="2" valign="bottom" class="stil06"><table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td valign="top"><div align="center"><span class="gensmall"><strong>{L_EMAIL_SETTINGS}</strong></span></div></td>
                </tr>
              </table></th>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_ADMIN_EMAIL}<</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" size="25" maxlength="100" name="board_email" value="{EMAIL_FROM}" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_EMAIL_SIG}</span><br />
                  <span class="gensmall">{L_EMAIL_SIG_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><textarea name="board_email_sig" rows="5" cols="30" class="form2">{EMAIL_SIG}</textarea></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_USE_SMTP}<br />
                  <span class="gensmall">{L_USE_SMTP_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input type="radio" name="smtp_delivery" value="1" {SMTP_YES} />
      <span class="gensmall">{L_YES}&nbsp;&nbsp;
      <input type="radio" name="smtp_delivery" value="0" {SMTP_NO} />
     <span class="gensmall">{L_NO}</td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SMTP_SERVER}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" name="smtp_host" value="{SMTP_HOST}" size="25" maxlength="50" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SMTP_USERNAME}</span><br />
                  <span class="gensmall">{L_SMTP_USERNAME_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="text" name="smtp_username" value="{SMTP_USERNAME}" size="25" maxlength="255" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="gensmall">{L_SMTP_PASSWORD}</span><br />
                  <span class="gensmall">{L_SMTP_PASSWORD_EXPLAIN}</span></td>
              <td bgcolor="#EAF1FC"><input class="form2" type="password" name="smtp_password" value="{SMTP_PASSWORD}" size="25" maxlength="255" /></td>
            </tr>
            <tr>
              <td height="25" colspan="2" align="center" bgcolor="#E1ECFB">{S_HIDDEN_FIELDS}
                  <input type="submit" name="submit" value="{L_SUBMIT}" class="form2" />
            &nbsp;&nbsp;
              <input name="reset" type="reset" class="form2" value="{L_RESET}" />              </td>
            </tr>
          </table>		  
		  </td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>

<br clear="all" />
