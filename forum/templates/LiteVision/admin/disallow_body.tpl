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
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_DISALLOW_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_DISALLOW_EXPLAIN}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table><br>

<form method="post" action="{S_FORM_ACTION}">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="left"><span class="gensmall"><strong>{L_DISALLOW_TITLE}</strong></span></div></td>
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
        <td><div align="center"><span class="genmed"><strong>{L_ADD_DISALLOW}</strong></span></div></td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td>
<table width="100%" cellspacing="1" cellpadding="0" border="0" align="center">
	<tr> 
		<td width="50%" bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><span class="gensmall">{L_USERNAME}</span><br />
                <span class="gensmall">{L_ADD_EXPLAIN}</span></td>
          </tr>
        </table></td>
		<td width="50%" bgcolor="#EAF1FC">&nbsp;<input class="form2" type="text" name="disallowed_user" size="30" />&nbsp;<input type="submit" name="add_name" value="{L_ADD}" class="form2" /></td>
	</tr>
	<tr> 
		<th height="28" colspan="2" valign="bottom" class="stil06"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><span class="genmed"><strong>{L_DELETE_DISALLOW}</strong></span></div></td>
          </tr>
        </table></th>
	</tr>
	<tr> 
		<td width="50%" bgcolor="#E1ECFB"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><span class="gensmall">{L_USERNAME}</span><br />
                <span class="gensmall">{L_DELETE_EXPLAIN}</span></td>
          </tr>
        </table></td>
		<td width="50%" bgcolor="#EAF1FC">&nbsp;{S_DISALLOW_SELECT}&nbsp;<input type="submit" name="delete_name" value="{L_DELETE}" class="form2" /></td>
	</tr>
	<tr> 
		<td bgcolor="#E1ECFB" colspan="2" align="center">&nbsp;</td>
	</tr>
</table>
	  </td>
    </tr>
</table>

</td>
  </tr>
</table>
</form>
