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

<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_BAN_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_BAN_EXPLAIN}<br><br>{L_BAN_EXPLAIN_WARN}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table><br>

<form method="post" name="post" action="{S_BANLIST_ACTION}">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="left"><span class="gensmall"><strong>{L_BAN_TITLE}</strong></span></div></td>
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
        <td><div align="center"><span class="genmed"><strong>{L_BAN_USER}</strong></span></div></td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td>
<table width="100%" cellspacing="1" cellpadding="0" border="0" align="center">
	<tr> 
	  <td bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="left"><span class="gensmall">{L_USERNAME}:</span></div></td>
        </tr>
      </table></td>
	  <td bgcolor="#EAF1FC"><input class="form2" type="text" class="form2" name="username" maxlength="50" size="20" /> <input type="hidden" name="mode" value="edit" />{S_HIDDEN_FIELDS} <input type="submit" name="usersubmit" value="{L_FIND_USERNAME}" class="form2" onclick="window.open('{U_SEARCH_USER}', '_phpbbsearch', 'HEIGHT=250,resizable=yes,WIDTH=400');return false;" /></td>
	</tr>
	<tr> 
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_UNBAN_USER}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="left"><span class="gensmall">{L_USERNAME}:<br>{L_UNBAN_USER_EXPLAIN}</span></div></td>
        </tr>
      </table></td>
	  <td bgcolor="#EAF1FC">{S_UNBAN_USERLIST_SELECT}</td>
	</tr>
	<tr> 
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_BAN_IP}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="left"><span class="gensmall">{L_IP_OR_HOSTNAME}:<br>{L_BAN_IP_EXPLAIN}</span></div></td>
        </tr>
      </table></td>
	  <td bgcolor="#EAF1FC"><input class="form2" type="text" name="ban_ip" size="35" /></td>
	</tr>
	<tr> 
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_UNBAN_IP}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="left"><span class="gensmall">{L_IP_OR_HOSTNAME}:<br>{L_UNBAN_IP_EXPLAIN}</span></div></td>
        </tr>
      </table></td>
	  <td bgcolor="#EAF1FC">{S_UNBAN_IPLIST_SELECT}</td>
	</tr>
	<tr> 
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_BAN_EMAIL}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="left"><span class="gensmall">{L_EMAIL_ADDRESS}:<br>{L_BAN_EMAIL_EXPLAIN}</span></div></td>
        </tr>
      </table></td>
	  <td bgcolor="#EAF1FC"><input class="form2" type="text" name="ban_email" size="35" /></td>
	</tr>
	<tr> 
	  <th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_UNBAN_EMAIL}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="left"><span class="gensmall">{L_EMAIL_ADDRESS}:<br>{L_UNBAN_EMAIL_EXPLAIN}</span></div></td>
        </tr>
      </table></td>
	  <td bgcolor="#EAF1FC">{S_UNBAN_EMAILLIST_SELECT}</td>
	</tr>
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="2" align="center"><input type="submit" name="submit" value="{L_SUBMIT}" class="form2" />&nbsp;&nbsp;<input type="reset" value="{L_RESET}" class="form2" /></td>
	</tr>
</table>	  </td>
    </tr>
</table>

</td>
  </tr>
</table>
</form>
