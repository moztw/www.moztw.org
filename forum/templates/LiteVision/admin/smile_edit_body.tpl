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
              <td><div align="justify"><span class="gensmall">{L_SMILEY_EXPLAIN}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
<script language="javascript" type="text/javascript">
<!--
function update_smiley(newimage)
{
	document.smiley_image.src = "{S_SMILEY_BASEDIR}/" + newimage;
}
//-->
</script>

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
                    <td valign="top"><span class="gensmall"><strong>{L_SMILEY_CONFIG}</strong></span></td>
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
		<td width="50%" bgcolor="#E1ECFB"><span class="gensmall">&nbsp;{L_SMILEY_CODE}</span></td>
		<td width="50%" bgcolor="#EAF1FC">&nbsp;<input class="form2" type="text" name="smile_code" value="{SMILEY_CODE}" /></td>
	</tr>
	<tr>
		<td width="50%" bgcolor="#E1ECFB"><span class="gensmall">&nbsp;{L_SMILEY_URL}</span></td>
		<td width="50%" bgcolor="#EAF1FC">&nbsp;<select name="smile_url" onchange="update_smiley(this.options[selectedIndex].value);">{S_FILENAME_OPTIONS}</select> &nbsp; <img name="smiley_image" src="{SMILEY_IMG}" border="0" alt="" /> &nbsp;</td>
	</tr>
	<tr>
		<td width="50%" bgcolor="#E1ECFB"><span class="gensmall">&nbsp;{L_SMILEY_EMOTION}</span></td>
		<td width="50%" bgcolor="#EAF1FC">&nbsp;<input class="form2" type="text" name="smile_emotion" value="{SMILEY_EMOTICON}" /></td>
	</tr>
	<tr>
		<td height="25" colspan="2" align="center" bgcolor="#E1ECFB">{S_HIDDEN_FIELDS}<input class="form2" type="submit" value="{L_SUBMIT}" /></td>
	</tr>
</table>
		  </td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>
