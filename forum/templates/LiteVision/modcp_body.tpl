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
    <td width="98%" height="50" valign="bottom" class="stil06"><table width="100%" height="50"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" valign="top">&nbsp;<a href="{U_VIEW_FORUM}" class="nav">{FORUM_NAME}</a><br>&nbsp;<span class="nav">{PAGINATION}</span></td>
        </tr>
      <tr>
        <td height="20"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><span class="genmed"><strong>{L_MOD_CP}</strong></span></div></td>
          </tr>
        </table></td>
        </tr>
    </table>	</td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF">
	  
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>
                <div align="left"><span class="gensmall">&nbsp;{L_MOD_CP_EXPLAIN}</span></div></td>
            </tr>
            <tr>
              <td>
<form method="post" action="{S_MODCP_ACTION}">
<table width="100%" cellpadding="0" cellspacing="1" border="0">
	<tr> 
	  <th width="4%" height="21" nowrap="nowrap" class="stil06">&nbsp;</th>
	  <th height="21" valign="bottom" nowrap="nowrap" class="stil06"><table width="100%" height="18"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="genmed"><strong>{L_TOPICS}</strong></span></div></td>
        </tr>
      </table></th>
	  <th width="8%" height="21" valign="bottom" nowrap="nowrap" class="stil06"><table width="100%" height="18"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="genmed"><strong>{L_REPLIES}</strong></span></div></td>
        </tr>
      </table></th>
	  <th width="17%" height="21" valign="bottom" nowrap="nowrap" class="stil06"><table width="100%" height="18"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="genmed"><strong>{L_LASTPOST}</strong></span></div></td>
        </tr>
      </table></th>
	  <th width="5%" height="21" valign="bottom" nowrap="nowrap" class="stil06"><table width="100%" height="18"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="genmed"><strong>{L_SELECT}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<!-- BEGIN topicrow -->
	<tr> 
	  <td bgcolor="#E1ECFB" align="center" valign="middle"><img src="{topicrow.TOPIC_FOLDER_IMG}" width="19" height="18" alt="{topicrow.L_TOPIC_FOLDER_ALT}" title="{topicrow.L_TOPIC_FOLDER_ALT}" /></td>
	  <td bgcolor="#E1ECFB">&nbsp;<span class="topictitle">{topicrow.TOPIC_TYPE}<a href="{topicrow.U_VIEW_TOPIC}" class="topictitle">{topicrow.TOPIC_TITLE}</a></span></td>
	  <td bgcolor="#EAF1FC" align="center" valign="middle"><span class="postdetails">{topicrow.REPLIES}</span></td>
	  <td bgcolor="#E1ECFB" align="center" valign="middle"><span class="postdetails">{topicrow.LAST_POST_TIME}</span></td>
	  <td bgcolor="#EAF1FC" align="center" valign="middle"> 
		<input type="checkbox" name="topic_id_list[]" value="{topicrow.TOPIC_ID}" />
	  </td>
	</tr>
	<!-- END topicrow -->
	<tr align="right"> 
	  <td bgcolor="#E1ECFB" colspan="5" height="29"> {S_HIDDEN_FIELDS} 
		<input type="submit" name="delete" class="liteoption" value="{L_DELETE}" />
		&nbsp; 
		<input type="submit" name="move" class="liteoption" value="{L_MOVE}" />
		&nbsp; 
		<input type="submit" name="lock" class="liteoption" value="{L_LOCK}" />
		&nbsp; 
		<input type="submit" name="unlock" class="liteoption" value="{L_UNLOCK}" />
	  </td>
	</tr>
  </table>
</form>	  
			  
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