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
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_WORDS_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_WORDS_TEXT}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table><br>

<form method="post" action="{S_WORDS_ACTION}">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><div align="left"><span class="gensmall"><strong>&nbsp;{L_WORDS_TITLE}</strong></span></div></td>
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
		<td height="25" class="stil06" valign="bottom"><table width="100%" height="16"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_WORD}</strong></span></div></td>
  </tr>
</table>
</td>
		<td height="25" class="stil06" valign="bottom"><table width="100%" height="16"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_REPLACEMENT}</strong></span></div></td>
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
	<!-- BEGIN words -->
	<tr>
		<td bgcolor="#E1ECFB" align="center"><span class="gensmall">{words.WORD}</span></td>
		<td bgcolor="#E1ECFB" align="center"><span class="gensmall">{words.REPLACEMENT}</span></td>
		<td bgcolor="#E1ECFB" align="center"><span class="gensmall"><a href="{words.U_WORD_EDIT}">{L_EDIT}</a></span></td>
		<td bgcolor="#E1ECFB" align="center"><span class="gensmall"><a href="{words.U_WORD_DELETE}">{L_DELETE}</a></span></td>
	</tr>
	<!-- END words -->
	<tr>
		<td height="25" colspan="5" align="center" bgcolor="#EAF1FC">{S_HIDDEN_FIELDS}
		  <input type="submit" name="add" value="{L_ADD_WORD}" class="form2" /></td>
	</tr>
</table>
		  </td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>
