 
<script language="Javascript" type="text/javascript">
	//
	// Should really check the browser to stop this whining ...
	//
	function select_switch(status)
	{
		for (i = 0; i < document.privmsg_list.length; i++)
		{
			document.privmsg_list.elements[i].checked = status;
		}
	}
</script>

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
        <td valign="top">&nbsp;{POST_PM_IMG}</td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
  <tr>
    <td>
	
<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
  <tr> 
	<td valign="top" align="center" width="100%" bgcolor="#EAF1FC">    <table height="40" cellspacing="2" cellpadding="2" border="0">
                    <tr valign="middle"> 
                      <td><div align="left">{INBOX_IMG}</div></td>
                      <td><div align="left"><span class="cattitle">{INBOX} &nbsp;</span></div></td>
                      <td><div align="left">{SENTBOX_IMG}</div></td>
                      <td><div align="left"><span class="cattitle">{SENTBOX} &nbsp;</span></div></td>
                      <td><div align="left">{OUTBOX_IMG}</div></td>
                      <td><div align="left"><span class="cattitle">{OUTBOX} &nbsp;</span></div></td>
                      <td><div align="left">{SAVEBOX_IMG}</div></td>
                      <td><div align="left"><span class="cattitle">{SAVEBOX} &nbsp;</span></div></td>
                    </tr>
                  </table></td>
	<td align="right"> 
	  <!-- BEGIN switch_box_size_notice -->
	  <table width="175" cellspacing="2" cellpadding="2" border="0" class="bodyline">
		<tr> 
		  <td colspan="3" width="175" bgcolor="#E1ECFB" nowrap="nowrap"><div align="center"><span class="gensmall">{BOX_SIZE_STATUS}</span></div></td>
		</tr>
		<tr> 
		  <td colspan="3" width="175" bgcolor="#EAF1FC">			    <table cellspacing="0" cellpadding="1" border="0">
			            <tr> 
				          <td bgcolor="{T_TD_COLOR2}"><img src="templates/LiteVision/images/pm.gif" width="{INBOX_LIMIT_IMG_WIDTH}" height="8" alt="{INBOX_LIMIT_PERCENT}" /></td>
			            </tr>
			          </table></td>
		</tr>
		<tr> 
		  <td width="33%" bgcolor="#E1ECFB"><div align="center"><span class="gensmall">0%</span></div></td>
		  <td width="34%" align="center" bgcolor="#E1ECFB"><div align="center"><span class="gensmall">50%</span></div></td>
		  <td width="33%" align="right" bgcolor="#E1ECFB"><div align="center"><span class="gensmall">100%</span></div></td>
		</tr>
	  </table>
	  <div align="center">
	    <!-- END switch_box_size_notice -->
	    </div></td>
  </tr>
</table>	</td>
  </tr>
</table>
	</td>
  </tr>
</table>

<br clear="all" />

<form method="post" name="privmsg_list" action="{S_PRIVMSGS_ACTION}">
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
    <td width="98%" valign="bottom"><table width="100%" height="25"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="25" valign="top">&nbsp;<span class="gensmall"><a href="javascript:select_switch(true);" class="gensmall">{L_MARK_ALL}</a> :: <a href="javascript:select_switch(false);" class="gensmall">{L_UNMARK_ALL}</a></span></b><br />
          <span class="nav">{PAGINATION}<br /></span></td>
        </tr>
    </table>	</td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF">
	  
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
	<tr> 
	  <td width="5%" height="25" class="stil06" nowrap="nowrap"><div align="center"><span class="genmed"><strong>{L_FLAG}</strong></span></div></td>
	  <td width="55%" class="stil06" nowrap="nowrap"><div align="center"><span class="genmed"><strong>{L_SUBJECT}</strong></span></div></td>
	  <td width="20%" class="stil06" nowrap="nowrap"><div align="center"><span class="genmed"><strong>{L_FROM_OR_TO}</strong></span></div></td>
	  <td width="15%" class="stil06" nowrap="nowrap"><div align="center"><span class="genmed"><strong>{L_DATE}</strong></span></div></td>
	  <td width="5%" class="stil06" nowrap="nowrap"><div align="center"><span class="genmed"><strong>{L_MARK}</strong></span></div></td>
	</tr>
	<!-- BEGIN listrow -->
	<tr> 
	  <td bgcolor="#E1ECFB" width="5%" align="center" valign="middle"><img src="{listrow.PRIVMSG_FOLDER_IMG}" width="19" height="18" alt="{listrow.L_PRIVMSG_FOLDER_ALT}" title="{listrow.L_PRIVMSG_FOLDER_ALT}" /></td>
	  <td width="55%" valign="middle" bgcolor="#E1ECFB"><span class="topictitle">&nbsp;<a href="{listrow.U_READ}" class="topictitle">{listrow.SUBJECT}</a></span></td>
	  <td width="20%" valign="middle" align="center" bgcolor="#E1ECFB"><span class="name">&nbsp;<a href="{listrow.U_FROM_USER_PROFILE}" class="name">{listrow.FROM}</a></span></td>
	  <td width="15%" align="center" valign="middle" bgcolor="#E1ECFB"><span class="postdetails">{listrow.DATE}</span></td>
	  <td width="5%" align="center" valign="middle" bgcolor="#E1ECFB"><span class="postdetails"> 
		<input type="checkbox" name="mark[]2" value="{listrow.S_MARK_ID}" />
		</span></td>
	</tr>
	<!-- END listrow -->
	<!-- BEGIN switch_no_messages -->
	<tr> 
	  <td bgcolor="#EAF1FC" colspan="5" align="center" valign="middle"><span class="gen">{L_NO_MESSAGES}</span></td>
	</tr>
	<!-- END switch_no_messages -->
	<tr> 
	  <td bgcolor="#F4F8FD" colspan="5" height="28" align="right"> {S_HIDDEN_FIELDS} 
		<input type="submit" name="save" value="{L_SAVE_MARKED}" class="form2" />
		&nbsp; 
		<input type="submit" name="delete" value="{L_DELETE_MARKED}" class="form2" />
		&nbsp; 
		<input type="submit" name="deleteall" value="{L_DELETE_ALL}" class="form2" />
	  </td>
	</tr>
  </table>
		  
		  </td>
        </tr>
      </table>
	  
	  </td>
    </tr>
</table></td>
  </tr>
</table>

</form>

