
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%">&nbsp;&nbsp;<span class="genmed"><strong>PM</strong></span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
    <td width="98%" height="50" valign="bottom" class="stil06"><table width="99%" height="43"  border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">&nbsp;{REPLY_PM_IMG}</td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
      <tr>
        <td valign="middle">{INBOX_IMG}</td>
        <td valign="middle"><span class="cattitle">{INBOX} &nbsp;</span></td>
        <td valign="middle">{SENTBOX_IMG}</td>
        <td valign="middle"><span class="cattitle">{SENTBOX} &nbsp;</span></td>
        <td valign="middle">{OUTBOX_IMG}</td>
        <td valign="middle"><span class="cattitle">{OUTBOX} &nbsp;</span></td>
        <td valign="middle">{SAVEBOX_IMG}</td>
        <td valign="middle"><span class="cattitle">{SAVEBOX}</span></td>
      </tr>
    </table></td>
  </tr>
</table>
	</td>
  </tr>
</table>

<br clear="all" />

<form method="post" action="{S_PRIVMSGS_ACTION}">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="72%" valign="top"><div align="left"><span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></div></td>
            <td width="28%" valign="bottom"><div align="right"></div></td>
          </tr>
        </table></td>
	
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
    <td width="98%" height="26" valign="bottom" class="stil06"><table width="90%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center"><span class="genmed"><strong>{BOX_NAME} :: {L_MESSAGE}</strong></span></div></td>
  </tr>
</table>
</td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF">
	  
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
            <tr>
              <td bgcolor="#E1ECFB"><span class="genmed">{L_FROM}:</span></td>
              <td width="100%" bgcolor="#E1ECFB" colspan="2"><span class="genmed">&nbsp;{MESSAGE_FROM}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="genmed">{L_TO}:</span></td>
              <td width="100%" bgcolor="#E1ECFB" colspan="2"><span class="genmed">&nbsp;{MESSAGE_TO}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="genmed">{L_POSTED}:</span></td>
              <td width="100%" bgcolor="#E1ECFB" colspan="2"><span class="genmed">&nbsp;{POST_DATE}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB"><span class="genmed">{L_SUBJECT}:</span></td>
              <td width="100%" bgcolor="#E1ECFB"><span class="genmed">&nbsp;{POST_SUBJECT}</span></td>
              <td nowrap="nowrap" bgcolor="#E1ECFB" align="right"> {QUOTE_PM_IMG} {EDIT_PM_IMG}&nbsp;</td>
            </tr>
            <tr>
              <td valign="top" colspan="3" bgcolor="#EAF1FC"><span class="postbody">{MESSAGE}</span></td>
            </tr>
            <tr>
              <td width="100%" height="28" valign="bottom" colspan="3" bgcolor="#E1ECFB">
                <table cellspacing="0" cellpadding="0" border="0" height="18">
                  <tr>
                    <td valign="middle" nowrap="nowrap">{PROFILE_IMG} {PM_IMG} {EMAIL_IMG} {WWW_IMG} {AIM_IMG} {YIM_IMG} {MSN_IMG}</td>
                    <td>&nbsp;</td>
                    <td valign="top" nowrap="nowrap"><script language="JavaScript" type="text/javascript"><!-- 

		if ( navigator.userAgent.toLowerCase().indexOf('mozilla') != -1 && navigator.userAgent.indexOf('5.') == -1 && navigator.userAgent.indexOf('6.') == -1 )
			document.write('{ICQ_IMG}');
		else
			document.write('<div style="position:relative"><div style="position:absolute">{ICQ_IMG}</div><div style="position:absolute;left:3px">{ICQ_STATUS_IMG}</div></div>');
		  
		  //--></script>
                        <noscript>
                        {ICQ_IMG}
                      </noscript></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td bgcolor="#EAF1FC" colspan="3" height="28" align="right"> {S_HIDDEN_FIELDS}
                  <input type="submit" name="save" value="{L_SAVE_MSG}" class="form2" />
&nbsp;
      <input type="submit" name="delete" value="{L_DELETE_MSG}" class="form2" />
              </td>
            </tr>
          </table></td>
        </tr>
      </table>
	  
	  </td>
    </tr>
</table></td>
  </tr>
</table>
</form>

