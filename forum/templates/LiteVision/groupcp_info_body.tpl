<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="21"  border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td width="72%" valign="top"><div align="left">&nbsp;<span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></div></td>
            <td width="28%" valign="bottom"><div align="right"></div></td>
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
        <td><div align="center"><span class="genmed"><strong>{L_GROUP_INFORMATION}</strong></span></div></td>
        </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <form action="{S_GROUPCP_ACTION}" method="post">
              <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1">
                <tr>
                  <td bgcolor="#EAF1FC" width="20%"><span class="gen">{L_GROUP_NAME}:</span></td>
                  <td bgcolor="E1ECFB"><span class="gen"><b>{GROUP_NAME}</b></span></td>
                </tr>
                <tr>
                  <td bgcolor="#EAF1FC" width="20%"><span class="gen">{L_GROUP_DESC}:</span></td>
                  <td bgcolor="E1ECFB"><span class="gen">{GROUP_DESC}</span></td>
                </tr>
                <tr>
                  <td bgcolor="#EAF1FC" width="20%"><span class="gen">{L_GROUP_MEMBERSHIP}:</span></td>
                  <td bgcolor="E1ECFB"><span class="gen">{GROUP_DETAILS} &nbsp;&nbsp;
                        <!-- BEGIN switch_subscribe_group_input -->
                        <input class="form2" type="submit" name="joingroup" value="{L_JOIN_GROUP}" />
                        <!-- END switch_subscribe_group_input -->
                        <!-- BEGIN switch_unsubscribe_group_input -->
                        <input class="form2" type="submit" name="unsub" value="{L_UNSUBSCRIBE_GROUP}" />
                        <!-- END switch_unsubscribe_group_input -->
                  </span></td>
                </tr>
                <!-- BEGIN switch_mod_option -->
                <tr>
                  <td bgcolor="#EAF1FC" width="20%"><span class="gen">{L_GROUP_TYPE}:</span></td>
                  <td bgcolor="E1ECFB"><span class="gen">
                    <input type="radio" name="group_type" value="{S_GROUP_OPEN_TYPE}" {S_GROUP_OPEN_CHECKED} />
              {L_GROUP_OPEN} &nbsp;&nbsp;
              <input type="radio" name="group_type" value="{S_GROUP_CLOSED_TYPE}" {S_GROUP_CLOSED_CHECKED} />
              {L_GROUP_CLOSED} &nbsp;&nbsp;
              <input type="radio" name="group_type" value="{S_GROUP_HIDDEN_TYPE}" {S_GROUP_HIDDEN_CHECKED} />
              {L_GROUP_HIDDEN} &nbsp;&nbsp;
              <input class="form2" type="submit" name="groupstatus" value="{L_UPDATE}" />
                  </span></td>
                </tr>
                <!-- END switch_mod_option -->
              </table>
              {S_HIDDEN_FIELDS}
          </form></td>
        </tr>
      </table></td>
    </tr>
</table></td>
  </tr>
</table>










<form action="{S_GROUPCP_ACTION}" method="post" name="post">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="22"  border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td width="57%" valign="top"><div align="left">&nbsp;<span class="genmed"><strong>Group information</strong></span></div></td>
            <td width="43%" valign="top"><div align="right"><span class="nav">{PAGE_NUMBER}</span>&nbsp;</div></td>
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
        <td><div align="center"><span class="genmed"><strong>[ {GROUP_NAME} ]</strong></span></div></td>
        </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF">
	  
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr> 
	  <th height="28" valign="bottom" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_PM}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" valign="bottom" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_USERNAME}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" valign="bottom" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_POSTS}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" valign="bottom" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_FROM}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" valign="bottom" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_EMAIL}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" valign="bottom" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_WEBSITE}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" valign="bottom" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_SELECT}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr valign="bottom"> 
	  <td height="28" colspan="8" class="stil06"><table width="100%" height="17"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="genmed"><strong>{L_GROUP_MODERATOR}</strong></span></div></td>
        </tr>
      </table></td>
	</tr>
	<tr> 
	  <td height="21" align="center" valign="bottom" bgcolor="#E1ECFB"> {MOD_PM_IMG} </td>
	  <td height="21" align="center" bgcolor="#E1ECFB"><span class="gen"><a href="{U_MOD_VIEWPROFILE}" class="gen">{MOD_USERNAME}</a></span></td>
	  <td height="21" align="center" valign="middle" bgcolor="#E1ECFB"><span class="gen">{MOD_POSTS}</span></td>
	  <td height="21" align="center" valign="middle" bgcolor="#E1ECFB"><span class="gen">{MOD_FROM}</span></td>
	  <td height="21" align="center" valign="middle" bgcolor="#E1ECFB"><span class="gen">{MOD_EMAIL_IMG}</span></td>
	  <td height="21" align="center" bgcolor="#E1ECFB">{MOD_WWW_IMG}</td>
	  <td height="21" align="center" bgcolor="#E1ECFB">&nbsp;  </td>
  </tr>
	<tr valign="bottom"> 
	  <td height="20" colspan="8" class="stil06"><table width="100%" height="17"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="genmed"><strong>{L_GROUP_MEMBERS}</strong></span></div></td>
        </tr>
      </table></td>
	</tr>
	<!-- BEGIN member_row -->
	<tr> 
	  <td align="center" valign="bottom" bgcolor="#EAF1FC" class="border-alb"> {member_row.PM_IMG} </td>
	  <td bgcolor="#EAF1FC" align="center" class="border-alb"><span class="gen"><a href="{member_row.U_VIEWPROFILE}" class="gen">{member_row.USERNAME}</a></span></td>
	  <td bgcolor="#EAF1FC" align="center" class="border-alb"><span class="gen">{member_row.POSTS}</span></td>
	  <td bgcolor="#E1ECFB" align="center" class="border-alb"><span class="gen"> {member_row.FROM} 
		</span></td>
	  <td bgcolor="#EAF1FC" align="center" valign="middle" class="border-alb"><span class="gen">{member_row.EMAIL_IMG}</span></td>
	  <td bgcolor="#EAF1FC" align="center" class="border-alb"><span class="gen">{member_row.WWW_IMG}</span></td>
	  <td bgcolor="#EAF1FC" align="center"> 
	  <!-- BEGIN switch_mod_option -->
	  <input type="checkbox" name="members[]" value="{member_row.USER_ID}" /> 
	  <!-- END switch_mod_option -->
	  </td>
	</tr>
	<!-- END member_row -->

	<!-- BEGIN switch_no_members -->
	<tr bgcolor="#EAF1FC"> 
	  <td colspan="7" align="center" class="row1"><span class="gen">{L_NO_MEMBERS}</span></td>
  </tr>
	<!-- END switch_no_members -->

	<!-- BEGIN switch_hidden_group -->
	<tr bgcolor="#E1ECFB"> 
	  <td colspan="7" align="center" class="row1"><span class="gen">{L_HIDDEN_MEMBERS}</span></td>
  </tr>
	<!-- END switch_hidden_group -->

	<!-- BEGIN switch_mod_option -->
	<tr valign="top">
		<td height="20" colspan="8" align="right" >
			<table width="100%" height="26"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E1ECFB" class="border-alb-top">
  <tr>
    <td><div align="right">
      <input type="submit" name="remove" value="{L_REMOVE_SELECTED}" class="form2" />&nbsp;
    </div></td>
  </tr>
</table>			</td>
	</tr>
	<!-- END switch_mod_option -->
</table>

        </tr>
      </table>
	  
	  
	  </td>
    </tr>
</table></td>
  </tr>
</table>

<table width="98%" cellspacing="0" border="0" align="center" cellpadding="0">
	<tr>
		<td align="left" valign="top">
		<!-- BEGIN switch_mod_option -->
		<span class="genmed"><br>
		<input type="text"  class="form" name="username" maxlength="50" size="20" /> <input type="submit" name="add" value="{L_ADD_MEMBER}" class="form2" /> <input type="submit" name="usersubmit" value="{L_FIND_USERNAME}" class="form2" onclick="window.open('{U_SEARCH_USER}', '_phpbbsearch', 'HEIGHT=250,resizable=yes,WIDTH=400');return false;" /></span>
		<!-- END switch_mod_option --></td>
	</tr>
</table>

{PENDING_USER_BOX}

{S_HIDDEN_FIELDS}</form>

