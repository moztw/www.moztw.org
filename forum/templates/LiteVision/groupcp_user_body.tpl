 
<table width="100%" cellspacing="2" cellpadding="2" border="0" align="center">
  <tr> 
	<td align="left"><span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></td>
  </tr>
</table>

<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="72%"><div align="left">&nbsp;&nbsp;<span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></div></td>
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
        <td><div align="center"><span class="genmed"><strong>{L_GROUP_MEMBERSHIP_DETAILS}</strong></span></div></td>
        </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF">
	  
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
  <!-- BEGIN switch_groups_joined -->
  <!-- BEGIN switch_groups_member -->
  <tr> 
	<td height="26" bgcolor="#E1ECFB"><span class="gen">{L_YOU_BELONG_GROUPS}</span></td>
	<td height="26" align="right" bgcolor="#EAF1FC"> 
	  <table width="90%" cellspacing="0" cellpadding="0" border="0">
		<tr><form method="get" action="{S_USERGROUP_ACTION}">
			<td width="40%"><span class="gensmall">{GROUP_MEMBER_SELECT}</span></td>
			<td align="center" width="30%"> 
			  <input type="submit" value="{L_VIEW_INFORMATION}" class="form" />{S_HIDDEN_FIELDS}
			</td>
		</form></tr>
	  </table>	</td>
  </tr>
  <!-- END switch_groups_member -->
  <!-- BEGIN switch_groups_pending -->
  <tr> 
	<td height="26" bgcolor="#E1ECFB"><span class="gen">{L_PENDING_GROUPS}</span></td>
	<td height="26" align="right" bgcolor="#EAF1FC"> 
	  <table width="90%" cellspacing="0" cellpadding="0" border="0">
		<tr><form method="get" action="{S_USERGROUP_ACTION}">
			<td width="40%"><span class="gensmall">{GROUP_PENDING_SELECT}</span></td>
			<td align="center" width="30%"> 
			  <input type="submit" value="{L_VIEW_INFORMATION}" class="form" />{S_HIDDEN_FIELDS}
			</td>
		</form></tr>
	  </table>	</td>
  </tr>
  <!-- END switch_groups_pending -->
  <!-- END switch_groups_joined -->
  <!-- BEGIN switch_groups_remaining -->
  <tr valign="bottom"> 
	<th height="20" colspan="2" align="center" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="middle"><div align="center"><span class="genmed"><strong>{L_JOIN_A_GROUP}</strong></span></div></td>
      </tr>
    </table></th>
  </tr>
  <tr> 
	<td height="26" bgcolor="#E1ECFB"><span class="gen">{L_SELECT_A_GROUP}</span></td>
	<td height="26" align="right" bgcolor="#EAF1FC"> 
	  <table width="90%" cellspacing="0" cellpadding="0" border="0">
		<tr><form method="get" action="{S_USERGROUP_ACTION}">
			<td width="40%"><span class="gensmall">{GROUP_LIST_SELECT}</span></td>
			<td align="center" width="30%"> 
			  <input type="submit" value="{L_VIEW_INFORMATION}" class="form" />{S_HIDDEN_FIELDS}
			</td>
		</form></tr>
	  </table>	</td>
  </tr>
  <!-- END switch_groups_remaining -->
</table>		  
        </tr>
      </table>
	  
	  
	  </td>
    </tr>
</table></td>
  </tr>
</table><br>

