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
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_FORUM_TITLE}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%" bgcolor="#EAF1FC"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="2">
            <tr>
              <td><div align="justify"><span class="gensmall">{L_FORUM_EXPLAIN}</span></div></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>

<form action="{S_FORUM_ACTION}" method="post">
  <table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="../templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="18"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top"><div align="center"><span class="gensmall"><strong>{L_FORUM_SETTINGS}</strong></span></div></td>
                  </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
          <td width="98%"><table width="100%" cellpadding="0" cellspacing="1" border="0" align="center">
            <tr>
              <td bgcolor="#E1ECFB">&nbsp;<span class="gensmall">{L_FORUM_NAME}</span></td>
              <td bgcolor="#EAF1FC">&nbsp;<input type="text" size="25" name="forumname" value="{FORUM_NAME}" class="form2" /></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB">&nbsp;<span class="gensmall">{L_FORUM_DESCRIPTION}</span></td>
              <td bgcolor="#EAF1FC">&nbsp;<textarea rows="5" cols="45" wrap="virtual" name="forumdesc" class="form2">{DESCRIPTION}</textarea></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB">&nbsp;<span class="gensmall">{L_CATEGORY}</span></td>
              <td bgcolor="#EAF1FC">&nbsp;<select name="c">
                  {S_CAT_LIST}
              </select></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB">&nbsp;<span class="gensmall">{L_FORUM_STATUS}</span></td>
              <td bgcolor="#EAF1FC">&nbsp;<select name="forumstatus">
                  {S_STATUS_LIST}
              </select></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB">&nbsp;<span class="gensmall">{L_AUTO_PRUNE}</span></td>
              <td bgcolor="#EAF1FC"><table width="90%" border="0" align="center" cellpadding="1" cellspacing="0">
                  <tr>
                    <td align="right" valign="middle"><span class="gensmall">{L_ENABLED}</span></td>
                    <td align="left" valign="middle">&nbsp;<input type="checkbox" name="prune_enable" value="1" {S_PRUNE_ENABLED} /></td>
                  </tr>
                  <tr>
                    <td align="right" valign="middle"><span class="gensmall">{L_PRUNE_DAYS}</span></td>
                    <td align="left" valign="middle">&nbsp;
                        <input type="text" name="prune_days" value="{PRUNE_DAYS}" size="5" class="form2" />
            &nbsp;<span class="gensmall">{L_DAYS}</span></td>
                  </tr>
                  <tr>
                    <td align="right" valign="middle"><span class="gensmall">{L_PRUNE_FREQ}</span></td>
                    <td align="left" valign="middle">&nbsp;
                        <input type="text" name="prune_freq" value="{PRUNE_FREQ}" size="5" class="form2" />
            &nbsp;<span class="gensmall">{L_DAYS}</span></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB" colspan="2" align="center">{S_HIDDEN_FIELDS}
                  <input type="submit" name="submit" value="{S_SUBMIT_VALUE}" class="form2" /></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>
		
<br clear="all" />
