
<form action="{S_PROFILE_ACTION}" method="post">
<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <td>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
        <tr valign="bottom">
          <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
              <tr>
                <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
                <td width="95%" valign="bottom"><table width="99%" height="21"  border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="top">&nbsp;&nbsp;<span  class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></td>
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
                <td><div align="center"><span class="genmed"><strong>{L_AVATAR_GALLERY}</strong></span></div></td>
              </tr>
          </table></td>
          <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
        <tr>
          <td>
		  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
	<tr> 
	  <td bgcolor="#E1ECFB" align="center" valign="middle" colspan="6" height="28"><span class="genmed">{L_CATEGORY}:&nbsp;{S_CATEGORY_SELECT}&nbsp;<input type="submit" class="form2" value="{L_GO}" name="avatargallery" /></span></td>
	</tr>
	<!-- BEGIN avatar_row -->
	<tr> 
	<!-- BEGIN avatar_column -->
		<td bgcolor="#EAF1FC" align="center"><img src="{avatar_row.avatar_column.AVATAR_IMAGE}" alt="{avatar_row.avatar_column.AVATAR_NAME}" title="{avatar_row.avatar_column.AVATAR_NAME}" /></td>
	<!-- END avatar_column -->
	</tr>
	<tr>
	<!-- BEGIN avatar_option_column -->
		<td bgcolor="#F4F8FD" align="center"><input type="radio" name="avatarselect" value="{avatar_row.avatar_option_column.S_OPTIONS_AVATAR}" /></td>
	<!-- END avatar_option_column -->
	</tr>

	<!-- END avatar_row -->
	<tr> 
	  <td bgcolor="#E1ECFB" colspan="{S_COLSPAN}" align="center" height="28">{S_HIDDEN_FIELDS} 
		<input type="submit" name="submitavatar" value="{L_SELECT_AVATAR}" class="form2" />
		&nbsp;&nbsp; 
		<input type="submit" name="cancelavatar" value="{L_RETURN_PROFILE}" class="form2" />
	  </td>
	</tr>
  </table>
		  
		  </td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>
