
<form action="{S_MODCP_ACTION}" method="post">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="72%" valign="top"><div align="left"><span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></div></td>
                      <td width="28%" valign="bottom"><div align="right"></div></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" valign="bottom" class="stil06"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="20" valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td height="20"><table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><div align="center"><span class="genmed"><strong>{MESSAGE_TITLE}</strong></span></div></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF">
            <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td bgcolor="#EAF1FC"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center"><span class="gen">{L_MOVE_TO_FORUM} &nbsp; {S_FORUM_SELECT}<br />
                          <br />
                          <input type="checkbox" name="move_leave_shadow" checked="checked" />
                          {L_LEAVESHADOW}<br />
                          <br />
      {MESSAGE_TEXT}</span><br />
      <br />
      {S_HIDDEN_FIELDS}
      <input class="mainoption" type="submit" name="confirm" value="{L_YES}" />
&nbsp;&nbsp;
      <input class="liteoption" type="submit" name="cancel" value="{L_NO}" />
                    </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>  
</form>
