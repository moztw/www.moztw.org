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

<form method="post" action="{S_FORUM_ACTION}">
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
          <td width="98%"><table width="100%" cellpadding="0" cellspacing="1" border="0" align="center">
            <!-- BEGIN catrow -->
            <tr>
              <td bgcolor="#E1ECFB" colspan="3"><span class="cattitle"><b><a href="{catrow.U_VIEWCAT}">{catrow.CAT_DESC}</a></b></span></td>
              <td bgcolor="#E1ECFB" align="center" valign="middle"><span class="gen"><a href="{catrow.U_CAT_EDIT}">{L_EDIT}</a></span></td>
              <td bgcolor="#E1ECFB" align="center" valign="middle"><span class="gen"><a href="{catrow.U_CAT_DELETE}">{L_DELETE}</a></span></td>
              <td bgcolor="#E1ECFB" align="center" valign="middle" nowrap="nowrap"><span class="gen"><a href="{catrow.U_CAT_MOVE_UP}">{L_MOVE_UP}</a> <a href="{catrow.U_CAT_MOVE_DOWN}">{L_MOVE_DOWN}</a></span></td>
              <td bgcolor="#E1ECFB" align="center" valign="middle"><span class="gen">&nbsp;</span></td>
            </tr>
            <!-- BEGIN forumrow -->
            <tr>
              <td bgcolor="#E1ECFB"><span class="gen"><a href="{catrow.forumrow.U_VIEWFORUM}" target="_new">{catrow.forumrow.FORUM_NAME}</a></span><br />
                  <span class="gensmall">{catrow.forumrow.FORUM_DESC}</span></td>
              <td bgcolor="#EAF1FC" align="center" valign="middle"><span class="gen">{catrow.forumrow.NUM_TOPICS}</span></td>
              <td bgcolor="#E1ECFB" align="center" valign="middle"><span class="gen">{catrow.forumrow.NUM_POSTS}</span></td>
              <td bgcolor="#EAF1FC" align="center" valign="middle"><span class="gen"><a href="{catrow.forumrow.U_FORUM_EDIT}">{L_EDIT}</a></span></td>
              <td bgcolor="#E1ECFB" align="center" valign="middle"><span class="gen"><a href="{catrow.forumrow.U_FORUM_DELETE}">{L_DELETE}</a></span></td>
              <td bgcolor="#EAF1FC" align="center" valign="middle"><span class="gen"><a href="{catrow.forumrow.U_FORUM_MOVE_UP}">{L_MOVE_UP}</a> <br />
                    <a href="{catrow.forumrow.U_FORUM_MOVE_DOWN}">{L_MOVE_DOWN}</a></span></td>
              <td bgcolor="#E1ECFB" align="center" valign="middle"><span class="gen"><a href="{catrow.forumrow.U_FORUM_RESYNC}">{L_RESYNC}</a></span></td>
            </tr>
            <!-- END forumrow -->
            <tr>
              <td colspan="7" bgcolor="#EAF1FC"><input class="form2" type="text" name="{catrow.S_ADD_FORUM_NAME}" />
                  <input type="submit" class="form2"  name="{catrow.S_ADD_FORUM_SUBMIT}" value="{L_CREATE_FORUM}" /></td>
            </tr>

            <!-- END catrow -->
            <tr>
              <td colspan="7" bgcolor="#E1ECFB"><input class="form2" type="text" name="categoryname" />
                  <input type="submit" class="form2"  name="addcategory" value="{L_CREATE_CATEGORY}" /></td>
            </tr>
          </table></td>
          <td width="1%" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>
