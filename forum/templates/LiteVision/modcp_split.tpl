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
        <td height="30" valign="middle">&nbsp;<a href="{U_VIEW_FORUM}" class="nav">{FORUM_NAME}</a></td>
        </tr>
      <tr>
        <td height="20"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><span class="genmed"><strong>{L_SPLIT_TOPIC}</strong></span></div></td>
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
                <div align="left"><span class="gensmall">&nbsp;{L_SPLIT_TOPIC_EXPLAIN}</span></div></td>
            </tr>
            <tr>
              <td>
<form method="post" action="{S_SPLIT_ACTION}">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
	<tr> 
	  <td bgcolor="#EAF1FC" nowrap="nowrap"><span class="gen">{L_SPLIT_SUBJECT}</span></td>
	  <td bgcolor="#E1ECFB" colspan="2">&nbsp;<input class="post" type="text" size="35" style="width: 350px" maxlength="60" name="subject" /></td>
	</tr>
	<tr> 
	  <td bgcolor="#EAF1FC" nowrap="nowrap"><span class="gen">{L_SPLIT_FORUM}</span></td>
	  <td bgcolor="#E1ECFB" colspan="2">&nbsp;{S_FORUM_SELECT}</td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="3" height="28"> 
		<table width="60%" cellspacing="0" cellpadding="0" border="0" align="center">
		  <tr> 
			<td width="50%" align="center"> 
			  <input class="liteoption" type="submit" name="split_type_all" value="{L_SPLIT_POSTS}" />
			</td>
			<td width="50%" align="center"> 
			  <input class="liteoption" type="submit" name="split_type_beyond" value="{L_SPLIT_AFTER}" />
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
	<tr> 
	  <td height="20" nowrap="nowrap" class="stil06"><div align="center"><span class="genmed"><strong>{L_AUTHOR}</strong></span></div></td>
	  <td height="20" nowrap="nowrap" class="stil06"><div align="center"><span class="genmed"><strong>{L_MESSAGE}</strong></span></div></td>
	  <td height="20" nowrap="nowrap" class="stil06"><div align="center"><span class="genmed"><strong>{L_SELECT}</strong></span></div></td>
	</tr>
	<!-- BEGIN postrow -->
	<tr> 
	  <td align="center" valign="middle" bgcolor="#E1ECFB"><span class="name">&nbsp;<a name="{postrow.U_POST_ID}"></a>{postrow.POSTER_NAME}</span></td>
	  <td width="100%" valign="top" class="{postrow.ROW_CLASS}"> 
		<table width="100%" cellspacing="0" cellpadding="3" border="0" bgcolor="#EAF1FC">
		  <tr> 
			<td valign="middle"><span class="postdetails">{L_POSTED}: 
			  {postrow.POST_DATE}&nbsp;&nbsp;&nbsp;&nbsp;{L_POST_SUBJECT}: {postrow.POST_SUBJECT}</span></td>
		  </tr>
		  <tr> 
			<td valign="top" class="border-bleu-sus"> 
			  <span class="postbody">{postrow.MESSAGE}</span></td> 
		  </tr>
		</table>
	  </td>
	  <td width="5%" align="center" bgcolor="#E1ECFB">{postrow.S_SPLIT_CHECKBOX}</td>
	</tr>

	<!-- END postrow -->
	<tr valign="bottom"> 
	  <td colspan="3" bgcolor="#E1ECFB"><table width="60%" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="50%" align="center" valign="bottom">
            <input class="liteoption" type="submit" name="split_type_all2" value="{L_SPLIT_POSTS}" />
          </td>
          <td width="50%" align="center" valign="bottom">
            <input class="liteoption" type="submit" name="split_type_beyond2" value="{L_SPLIT_AFTER}" />
      {S_HIDDEN_FIELDS} </td>
        </tr>
      </table> 
		</form>	
	  </td>
	</tr>
  </table>
  
		    </table>
		  </td>
        </tr>
      </table></td>
        </tr>
      </table>
	  
	  </td>
    </tr>
