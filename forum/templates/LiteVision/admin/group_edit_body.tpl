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

<form action="{S_GROUP_ACTION}" method="post" name="post">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_GROUP_EDIT_DELETE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
	<tr>
	  <td bgcolor="#E1ECFB" colspan="2">&nbsp;<span class="gensmall">{L_ITEMS_REQUIRED}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" width="38%">&nbsp;<span class="gensmall">{L_GROUP_NAME}:</span></td>
	  <td bgcolor="#EAF1FC" width="62%">&nbsp;<input class="form2" type="text" name="group_name" size="35" maxlength="40" value="{GROUP_NAME}" />
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" width="38%">&nbsp;<span class="gensmall">{L_GROUP_DESCRIPTION}:</span></td>
	  <td bgcolor="#EAF1FC" width="62%">&nbsp;<textarea class="form2" name="group_description" rows="5" cols="51">{GROUP_DESCRIPTION}</textarea>
	  </td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" width="38%">&nbsp;<span class="gensmall">{L_GROUP_MODERATOR}:</span></td>
	  <td bgcolor="#EAF1FC" width="62%">&nbsp;<input class="form2" type="text" class="form2" name="username" maxlength="50" size="20" value="{GROUP_MODERATOR}" /> &nbsp; <input type="submit" name="usersubmit" value="{L_FIND_USERNAME}" class="form2" onclick="window.open('{U_SEARCH_USER}', '_phpbbsearch', 'HEIGHT=250,resizable=yes,WIDTH=400');return false;" /></td>
	</tr>

	<tr> 
	  <td bgcolor="#E1ECFB" width="38%">&nbsp;<span class="gensmall">{L_GROUP_STATUS}:</span></td>
	  <td bgcolor="#EAF1FC" width="62%"> &nbsp;<span class="gensmall">
		<input type="radio" name="group_type" value="{S_GROUP_OPEN_TYPE}" {S_GROUP_OPEN_CHECKED} /> {L_GROUP_OPEN} &nbsp;&nbsp;<input type="radio" name="group_type" value="{S_GROUP_CLOSED_TYPE}" {S_GROUP_CLOSED_CHECKED} />	{L_GROUP_CLOSED} &nbsp;&nbsp;<input type="radio" name="group_type" value="{S_GROUP_HIDDEN_TYPE}" {S_GROUP_HIDDEN_CHECKED} />	{L_GROUP_HIDDEN}</span></td> 
	</tr>
	<!-- BEGIN group_edit -->
	<tr> 
	  <td bgcolor="#E1ECFB" width="38%">&nbsp;<span class="gensmall">{L_DELETE_MODERATOR}</span>
	  <br />
	  &nbsp;<span class="gensmall"><div align="center">{L_DELETE_MODERATOR_EXPLAIN}</div></span></td>
	  <td bgcolor="#EAF1FC" width="62%"> 
		<input type="checkbox" name="delete_old_moderator" value="1"><span class="gensmall">
		{L_YES}</span></td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" width="38%">&nbsp;<span class="gensmall">{L_GROUP_DELETE}:</span></td>
	  <td bgcolor="#EAF1FC" width="62%"> 
		<input type="checkbox" name="group_delete" value="1"><span class="gensmall">
		{L_GROUP_DELETE_CHECK}</span></td>
	</tr>
	<!-- END group_edit -->
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2" align="center"><span class="cattitle"> 
		<input type="submit" name="group_update" value="{L_SUBMIT}" class="form2" />
		&nbsp;&nbsp; 
		<input type="reset" value="{L_RESET}" name="reset" class="form" />
		</span></td>
	</tr>
</table>
		  </td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
{S_HIDDEN_FIELDS}</form>
