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
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_SMILEY_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_SMILEY_TEXT}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>

<form method="post" action="{S_SMILEY_ACTION}">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><span class="gensmall"><strong>{L_SMILEY_TITLE}</strong></span></td>
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
		<td height="25" valign="bottom" class="stil06"><table width="100%" height="16"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_CODE}</strong></span></div></td>
  </tr>
</table>
</td>
		<td height="25" valign="bottom" class="stil06"><table width="100%" height="16"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_SMILE}</strong></span></div></td>
  </tr>
</table>
</td>
		<td height="25" valign="bottom" class="stil06"><table width="100%" height="16"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_EMOT}</strong></span></div></td>
  </tr>
</table>
</td>
		<td height="25" colspan="2" class="stil06" valign="bottom"><table width="100%" height="16"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_ACTION}</strong></span></div></td>
  </tr>
</table>
</td>
	</tr>
	<!-- BEGIN smiles -->
	<tr>
		<td bgcolor="#E1ECFB"><span class="gensmall">&nbsp;{smiles.CODE}</span></td>
		<td bgcolor="#EAF1FC">&nbsp;<img src="{smiles.SMILEY_IMG}" alt="{smiles.CODE}" /></td>
		<td bgcolor="#E1ECFB">&nbsp;<span class="gensmall">{smiles.EMOT}</span></td>
		<td bgcolor="#EAF1FC"><div align="center"><a href="{smiles.U_SMILEY_EDIT}"><span class="gensmall">&nbsp;{L_EDIT}</span></a></div></td>
		<td bgcolor="#E1ECFB"><div align="center"><a href="{smiles.U_SMILEY_DELETE}"><span class="gensmall">{L_DELETE}</span></a></div></td>
	</tr>
	<!-- END smiles -->
	<tr>
		<td height="25" colspan="5" align="center" bgcolor="#E1ECFB">{S_HIDDEN_FIELDS}
		  <input type="submit" name="add" value="{L_SMILEY_ADD}" class="form2" />&nbsp;&nbsp;<input class="form2" type="submit" name="import_pack" value="{L_IMPORT_PACK}">&nbsp;&nbsp;<input class="form2" type="submit" name="export_pack" value="{L_EXPORT_PACK}"></td>
	</tr>
</table>
		  </td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>
