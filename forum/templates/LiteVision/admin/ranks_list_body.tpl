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
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_RANKS_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_RANKS_TEXT}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table><br>

<form method="post" action="{S_RANKS_ACTION}">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="left"><span class="gensmall"><strong>{L_RANKS_TITLE}</strong></span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
    <tr>
      <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
      <td width="98%">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
	<tr valign="bottom">
		<th height="28" class="stil06"><table width="100%" height="16"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="center"><span class="gensmall"><strong>{L_RANK}</strong></span></div></td>
          </tr>
        </table></th>
        <th height="28" class="stil06"><table width="100%" height="16"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="center"><span class="gensmall"><strong>{L_RANK_MINIMUM}</strong></span></div></td>
          </tr>
        </table></th>
		<th height="28" class="stil06"><table width="100%" height="16"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="center"><span class="gensmall"><strong>{L_SPECIAL_RANK}</strong></span></div></td>
          </tr>
        </table></th>
		<th height="28" class="stil06"><table width="100%" height="16"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="center"><span class="gensmall"><strong>{L_EDIT}</strong></span></div></td>
          </tr>
        </table></th>
		<th height="28" class="stil06"><table width="100%" height="16"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="center"><span class="gensmall"><strong>{L_DELETE}</strong></span></div></td>
          </tr>
        </table></th>
	</tr>
	<!-- BEGIN ranks -->
	<tr>
		<td height="20" align="center" bgcolor="#E1ECFB"><span class="gensmall">{ranks.RANK}</span></td>
        <td height="20" align="center" bgcolor="#EAF1FC"><span class="gensmall">{ranks.RANK_MIN}</span></td>
		<td height="20" align="center" bgcolor="#E1ECFB"><span class="gensmall">{ranks.SPECIAL_RANK}</span></td>
		<td height="20" align="center" bgcolor="#EAF1FC"><span class="gensmall"><a href="{ranks.U_RANK_EDIT}">{L_EDIT}</a></span></td>
		<td height="20" align="center" bgcolor="#E1ECFB"><span class="gensmall"><a href="{ranks.U_RANK_DELETE}">{L_DELETE}</a></span></td>
	</tr>
	<!-- END ranks -->			
	<tr>
		<td height="25" colspan="6" align="center" bgcolor="#E1ECFB"><input type="submit" class="form2" name="add" value="{L_ADD_RANK}" /></td>
	</tr>
</table>
	  </td>
      <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
    </tr>
</table>

</td>
  </tr>
</table>
</form>