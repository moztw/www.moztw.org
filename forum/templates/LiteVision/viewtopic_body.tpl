<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%">
<span style='float: right; text-align: right;' class="genmed"><b>{PAGINATION}</b></span>
<span style='float: left; text-align: left;' class="nav">&nbsp;<a href="{U_INDEX}" class="nav">{L_INDEX}</a> &raquo; <a class="nav" href="{U_VIEW_FORUM}">{FORUM_NAME}</a></span>
</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
      <tr>
        <td width="180" align="left" valign="middle"><span class="nav"><a href="{U_POST_NEW_TOPIC}"><img src="{POST_IMG}" border="0" alt="{L_POST_NEW_TOPIC}" align="middle" /></a>&nbsp;&nbsp;<a href="{U_POST_REPLY_TOPIC}"><img src="{REPLY_IMG}" border="0" alt="{L_POST_REPLY_TOPIC}" align="middle" /></a></span></td>
        <td align="left" valign="middle" class="nav">
<span><strong><a href="{U_VIEW_TOPIC}" class='nav gen' style='font-size: 110%;'>&nbsp; &raquo; {TOPIC_TITLE} &laquo; </a></strong></span>
	</td>
		<td width='90' align='right' valign='middle'>
<a href="{U_PRINT}" title="{L_PRINT}" class="nav" target="_blank"><img
src="{U_PRINT_IMG}" alt="{L_PRINT}" border="0" /></a>
      </tr>
    </table></td>
  </tr>
</table>
	</td>
  </tr>
</table>

<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
    <td width="98%" height="28" valign="bottom" class="stil06">
	
	<table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="20%"><div align="center"><span class="genmed"><strong>{L_AUTHOR}</strong></span></div></td>
        <td width="79%">
<span style='float: right;'>
<a href="{U_VIEW_OLDER_TOPIC}"><img alt='previous' title='Previous' src="templates/LiteVision/images/prev.gif" width="16" height="15" border="0"></a>&nbsp;&nbsp;&nbsp;<a href="{U_VIEW_NEWER_TOPIC}" class="nav"><img alt='next' title='Next' src="templates/LiteVision/images/next.gif" width="16" height="15" border="0"></a>&nbsp;&nbsp;</span>
<div align="center"><span class="genmed"><strong>{L_MESSAGE}</strong></span></div>
</td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#EAF1FC"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
	<!-- BEGIN postrow -->
      <tr>
        <td colspan="2"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="2">
          <tr>
            <td width="20%" valign="top" class="border-alb-dr"> <span class="name"><a name="{postrow.U_POST_ID}"></a><b>{postrow.POSTER_NAME}</b></span><br />
                <span class="postdetails">{postrow.POSTER_RANK}<br />
                {postrow.RANK_IMAGE}{postrow.POSTER_AVATAR}<br />
                <br />
                {postrow.POSTER_JOINED}<br />
                {postrow.POSTER_POSTS}<br />
                {postrow.POSTER_FROM}</span><br />            </td>
            <td width="79%" valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="0">
                <tr>
                  <td width="100%"><a href="{postrow.U_MINI_POST}"><img src="{postrow.MINI_POST_IMG}" width="12" height="9" alt="{postrow.L_MINI_POST_ALT}" title="{postrow.L_MINI_POST_ALT}" border="0" /></a><span class="postdetails">{L_POSTED}: {postrow.POST_DATE}</span></td>
                  <td valign="top" nowrap="nowrap">{postrow.QUOTE_IMG} {postrow.EDIT_IMG} {postrow.DELETE_IMG} {postrow.IP_IMG}</td>
                </tr>
                <tr valign="top">
                  <td colspan="2" class="border-bleu-sus">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2"><span class="postbody">{postrow.MESSAGE}{postrow.SIGNATURE}</span><span class="gensmall">{postrow.EDITED_MESSAGE}</span></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td width="21%"><div align="left"><span class="nav"><a href="#top" class="nav">&nbsp;{L_BACK_TO_TOP}</a></span></div></td>
        <td width="78%"><table cellspacing="0" cellpadding="0" border="0" height="18" width="18">
          <tr>
            <td valign="middle" nowrap="nowrap">{postrow.PROFILE_IMG} {postrow.PM_IMG} {postrow.EMAIL_IMG} {postrow.WWW_IMG} {postrow.AIM_IMG} {postrow.YIM_IMG} {postrow.MSN_IMG}
                <script language="JavaScript" type="text/javascript"><!-- 

	if ( navigator.userAgent.toLowerCase().indexOf('mozilla') != -1 && navigator.userAgent.indexOf('5.') == -1 && navigator.userAgent.indexOf('6.') == -1 )
		document.write(' {postrow.ICQ_IMG}');
	else
		document.write('</td><td>&nbsp;</td><td valign="top" nowrap="nowrap"><div style="position:relative"><div style="position:absolute">{postrow.ICQ_IMG}</div><div style="position:absolute;left:3px;top:-1px">{postrow.ICQ_STATUS_IMG}</div></div>');
				
				//--></script>
                <noscript>
                {postrow.ICQ_IMG}
              </noscript></td>
          </tr>
        </table></td>
		
	</tr>
	<tr> 
		<td class="spaceRow" colspan="2" height="1"><img src="templates/LiteVision/images/spacer.gif" alt="" width="1" height="1" /></td>
	</tr>
	<!-- END postrow -->		
		
      </table>
	  
<table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td align="center">&nbsp;</td>
			</tr>
		</table>
	  
	  </td>
  </tr>
</table>

	</td>
  </tr>
</table><br>

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
                      <td width="95%"><span class="genmed"><strong>&nbsp;&nbsp;&nbsp;INFO</strong></span></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td colspan="5" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td width="65%"><span class="gensmall">{S_WATCH_TOPIC}</span><br />
&nbsp;<br />
{S_TOPIC_ADMIN}</td>
              <td width="35%"><div align="right"><span class="gensmall">{S_AUTH_LIST}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table><br>
