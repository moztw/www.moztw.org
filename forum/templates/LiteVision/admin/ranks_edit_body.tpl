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

<form action="{S_RANK_ACTION}" method="post">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="16"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="left"><span class="gensmall"><strong>{L_RANKS_TITLE}</strong></span></div></td>
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
        <td><div align="center"><span class="genmed"><strong>{L_RANKS_TITLE}</strong></span></div></td>
      </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
	<tr>
		<td bgcolor="#EAF1FC" width="50%"><span class="gen">{L_RANK_TITLE}:</span></td>
		<td width="50%" bgcolor="#E1ECFB"><input class="form2" type="text" name="title" size="35" maxlength="40" value="{RANK}" /></td>
	</tr>
	<tr>
		<td width="50%" bgcolor="#EAF1FC"><span class="gen">{L_RANK_SPECIAL}</span></td>
		<td width="50%" bgcolor="#E1ECFB"><input type="radio" name="special_rank" value="1" {SPECIAL_RANK} /><span class="gensmall">{L_YES}</span> &nbsp;&nbsp;<input type="radio" name="special_rank" value="0" {NOT_SPECIAL_RANK} /><span class="gensmall">{L_NO}</span></td>
	</tr>
	<tr>
		<td bgcolor="#EAF1FC" width="50%"><span class="gen">{L_RANK_MINIMUM}:</span></td>
		<td width="50%" bgcolor="#E1ECFB"><input class="form2" type="text" name="min_posts" size="5" maxlength="10" value="{MINIMUM}" /></td>
	</tr>
	<tr>
		<td bgcolor="#EAF1FC" width="50%"><span class="gen">{L_RANK_IMAGE}:</span><br />
		<span class="gensmall">{L_RANK_IMAGE_EXPLAIN}</span></td>
		<td width="50%" bgcolor="#E1ECFB"><input class="form2" type="text" name="rank_image" size="40" maxlength="255" value="{IMAGE}" /><br />{IMAGE_DISPLAY}</td>
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
{S_HIDDEN_FIELDS}</form>
