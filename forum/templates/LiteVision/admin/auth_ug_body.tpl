<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="center"><span class="gensmall"><strong>{L_AUTH_TITLE}</strong></span></div></td>
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
        <td><span class="genmed"><strong>&nbsp;{L_USER_OR_GROUPNAME}: {USERNAME}</strong></span></td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1">
        <tr>
          <td>
		  
<form method="post" action="{S_AUTH_ACTION}">

<!-- BEGIN switch_user_auth -->
<span class="gensmall">&nbsp;{USER_LEVEL}</span><br>
<span class="gensmall">&nbsp;{USER_GROUP_MEMBERSHIPS}</span><br>
<!-- END switch_user_auth -->

<!-- BEGIN switch_group_auth -->
<span class="gensmall">&nbsp;{GROUP_MEMBERSHIP}</span>
<!-- END switch_group_auth -->

<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="26" valign="bottom" class="stil06"><div align="center">
      <table width="99%" height="16"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="gensmall"><strong>{L_PERMISSIONS}</strong></span></div></td>
        </tr>
      </table>
    </div></td>
  </tr>
</table>

<table width="100%"  border="0" cellspacing="2" cellpadding="0">
  <tr>
    <td><div align="justify"><span class="gensmall">{L_AUTH_EXPLAIN}</span></div></td>
  </tr>
</table>


  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
	<tr valign="bottom"> 
	  <td height="26" class="stil06"><table width="100%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="gensmall"><strong>{L_FORUM}</strong></span></div></td>
        </tr>
      </table></td>
	  <!-- BEGIN acltype -->
	  <td height="26" class="stil06"><table width="100%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="gensmall"><strong>{acltype.L_UG_ACL_TYPE}</strong></span></div></td>
        </tr>
      </table></td>
	  <!-- END acltype -->
	  <td height="26" class="stil06"><table width="100%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top"><div align="center"><span class="gensmall"><strong>{L_MODERATOR_STATUS}</strong></span></div></td>
        </tr>
      </table></td>
	</tr>
	<!-- BEGIN forums -->
	<tr> 
	  <td height="25" align="center" bgcolor="#E1ECFB"><span class="gensmall">{forums.FORUM_NAME}</span></td>
	  <!-- BEGIN aclvalues -->
	  <td height="25" align="center" bgcolor="#EAF1FC"><span class="gensmall">{forums.aclvalues.S_ACL_SELECT}</span></td>
	  <!-- END aclvalues -->
	  <td height="25" align="center" bgcolor="#E1ECFB"><span class="gensmall">{forums.S_MOD_SELECT}</span></td>
	</tr>
	<!-- END forums -->
	<tr> 
	  <td colspan="{S_COLUMN_SPAN}" bgcolor="#EAF1FC" align="center"> <span class="gensmall">{U_SWITCH_MODE}</span></td>
	</tr>
	<tr>
	  <td height="25" colspan="{S_COLUMN_SPAN}" align="center" bgcolor="#E1ECFB">{S_HIDDEN_FIELDS} 
		<input type="submit" name="submit" value="{L_SUBMIT}" class="form2" />
		&nbsp;&nbsp; 
		<input type="reset" value="{L_RESET}" class="form2" name="reset" />	  </td>
	</tr></form>
  </table>

		  
		  </td>
        </tr>
      </table></td>
    </tr>
</table>

</td>
  </tr>
</table>
