
<form method="post" action="{S_POST_DAYS_ACTION}">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%">&nbsp;&nbsp;<span class="genmed"><strong><a href="{U_VIEW_FORUM}">{FORUM_NAME}</a></strong></span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
    <td width="98%" height="28" valign="bottom" class="stil06"><table width="98%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="52%"><span class="gensmall">&nbsp;<b>{L_MODERATOR}: {MODERATORS}</b></td>
        <td width="48%"><div align="right"><span class="gensmall"><b>{PAGINATION}</b></span></div></td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
      <tr>
        <td align="left" valign="middle" width="50"><a href="{U_POST_NEW_TOPIC}"><img src="{POST_IMG}" border="0" alt="{L_POST_NEW_TOPIC}" /></a></td>
        <td align="left" valign="middle" class="nav" width="100%"><span class="nav">&nbsp;<a href="{U_INDEX}" class="nav">{L_INDEX}</a> &raquo; <a class="nav" href="{U_VIEW_FORUM}">{FORUM_NAME}</a></span></td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
	</td>
  </tr>
</table>

  
  <br>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
      <tr>
        <td width="1%" height="26" colspan="2" valign="bottom" class="stil01"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
            <tr>
              <td><table height="21"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
                  </tr>
              </table></td>
              <td width="90%"><span class="genmed"><strong>{L_TOPICS}</strong></span></td>
            </tr>
        </table></td>
        <td height="26" colspan="2" valign="bottom" class="stil02"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
            <tr>
              <td width="18%" valign="top"><div align="right"><span class="genmed">{L_REPLIES}</span>&nbsp;</div></td>
            </tr>
        </table></td>
        <td height="26" colspan="2" valign="bottom" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
            <tr>
              <td width="18%" valign="top"><div align="left">&nbsp;<span class="genmed">{L_VIEWS}</span></div></td>
            </tr>
        </table></td>
        <td height="26" colspan="2" valign="bottom" class="stil04"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
            <tr>
              <td width="18%" valign="middle"><div align="center"><span class="genmed">{L_LASTPOST}</span></div></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td width="1%" height="28" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        <td width="60%" height="28" valign="bottom" class="stil06"><table width="100%" height="28"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>			  <!-- BEGIN switch_no_topics -->
			  <div align="center"><span class="genmed">{L_NO_TOPICS}</span>
		        <!-- END switch_no_topics -->
		      </div></td>
          </tr>
        </table>
</td>
        <td width="1%" height="28" class="stil06">&nbsp;</td>
        <td height="28" colspan="3" class="stil06">&nbsp;</td>
        <td width="22%" height="28" class="stil06">&nbsp;</td>
        <td width="1%" height="28" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
      </tr>
      <!-- BEGIN topicrow -->
      <tr>
        <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        <td width="60%" bgcolor="#EAF1FC" class="border-bleu-dr"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td width="6%" valign="top"><div align="center"><img src="{topicrow.TOPIC_FOLDER_IMG}" alt="{topicrow.L_TOPIC_FOLDER_ALT}" title="{topicrow.L_TOPIC_FOLDER_ALT}" /></div></td>
              <td width="94%" valign="top"><span class="topictitle"> {topicrow.TOPIC_TYPE}<a href="{topicrow.U_VIEW_TOPIC}" class="topictitle">{topicrow.TOPIC_TITLE}</a></span><br />
					<span class="genmed">&nbsp;&raquo;{topicrow.TOPIC_AUTHOR}</span><br />
                   <span class="gensmall">{topicrow.GOTO_PAGE}</span><br></td>
            </tr>
        </table></td>
        <td width="1%">&nbsp;</td>
        <td width="7%" valign="top" bgcolor="#EEEEEE" class="border-maro-st-dr"><div align="right"><span class="postdetails">{topicrow.REPLIES}</span>&nbsp;</div></td>
        <td width="7%" valign="top" bgcolor="#D9E7F9" class="border-maro-dr"><div align="left">&nbsp;<span class="postdetails">{topicrow.VIEWS}</span></div></td>
        <td width="1%">&nbsp;</td>
        <td width="22%" valign="top" bgcolor="#EAF1FC" class="border-bleu-st"><div align="center"><span class="postdetails">{topicrow.LAST_POST_TIME}<br />
            {topicrow.LAST_POST_AUTHOR}</span></div></td>
        <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
      </tr>
      <!-- END topicrow -->
    </table></td>
  </tr>
</table>
</form>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr>
          <td height="26" colspan="7" valign="bottom" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="18%" valign="bottom"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
                    <tr>
                      <td width="5%"><table height="21"  border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
                          </tr>
                      </table></td>
                      <td width="95%"><span class="genmed"><strong>&nbsp;&nbsp;&nbsp;ICONS</strong></span></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" height="28" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="62%" height="28" valign="bottom" class="stil06">&nbsp;</td>
          <td height="28" colspan="4" class="stil06" width="39%">&nbsp;</td>
          <td width="1%" height="28" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td colspan="5" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td width="65%"><table cellspacing="3" cellpadding="0" border="0">
                <tr>
                  <td width="19" align="left"><img src="{FOLDER_NEW_IMG}" alt="{L_NEW_POSTS}" width="19" height="18" /></td>
                  <td width="204" class="gensmall">{L_NEW_POSTS}</td>
                  <td width="8">&nbsp;&nbsp;</td>
                  <td width="19" align="center"><img src="{FOLDER_IMG}" alt="{L_NO_NEW_POSTS}" width="19" height="18" /></td>
                  <td width="236" class="gensmall">{L_NO_NEW_POSTS}</td>
                  <td width="8">&nbsp;&nbsp;</td>
                  <td width="19" align="center"><img src="{FOLDER_ANNOUNCE_IMG}" alt="{L_ANNOUNCEMENT}" width="19" height="18" /></td>
                  <td width="172" class="gensmall">{L_ANNOUNCEMENT}</td>
                </tr>
                <tr>
                  <td width="19" align="center"><img src="{FOLDER_HOT_NEW_IMG}" alt="{L_NEW_POSTS_HOT}" width="19" height="18" /></td>
                  <td class="gensmall">{L_NEW_POSTS_HOT}</td>
                  <td>&nbsp;&nbsp;</td>
                  <td width="19" align="center"><img src="{FOLDER_HOT_IMG}" alt="{L_NO_NEW_POSTS_HOT}" width="19" height="18" /></td>
                  <td class="gensmall">{L_NO_NEW_POSTS_HOT}</td>
                  <td>&nbsp;&nbsp;</td>
                  <td width="19" align="center"><img src="{FOLDER_STICKY_IMG}" alt="{L_STICKY}" width="19" height="18" /></td>
                  <td class="gensmall">{L_STICKY}</td>
                </tr>
                <tr>
                  <td class="gensmall"><img src="{FOLDER_LOCKED_NEW_IMG}" alt="{L_NEW_POSTS_LOCKED}" width="19" height="18" /></td>
                  <td class="gensmall">{L_NEW_POSTS_LOCKED}</td>
                  <td>&nbsp;&nbsp;</td>
                  <td class="gensmall"><img src="{FOLDER_LOCKED_IMG}" alt="{L_NO_NEW_POSTS_LOCKED}" width="19" height="18" /></td>
                  <td class="gensmall">{L_NO_NEW_POSTS_LOCKED}</td>
                </tr>
              </table></td>
              <td width="35%"><div align="right"><span class="gensmall">{S_AUTH_LIST}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table><br>
