
<br clear="all" />

<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="99%" height="22"  border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td width="72%" valign="top"><div align="left">&nbsp;<span class="genmed"><strong>[ {GROUP_NAME} ]</strong></span></div></td>
            <td width="28%" valign="bottom"><div align="right"></div></td>
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
        <td><div align="center"><span class="genmed"><strong>{L_PENDING_MEMBERS}</strong></span></div></td>
        </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#FFFFFF">
	  
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr valign="bottom"> 
	  <th height="28" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_PM}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_USERNAME}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_POSTS}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_FROM}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_EMAIL}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" class="stil03"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_WEBSITE}</strong></span></div></td>
        </tr>
      </table></th>
	  <th height="28" class="stil01"><table width="100%" height="21"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center"><span class="genmed"><strong>{L_SELECT}</strong></span></div></td>
        </tr>
      </table></th>
	</tr>
	<!-- BEGIN pending_members_row -->
	<tr> 
	  <td bgcolor="#E1ECFB" align="center" class="border-alb"> {pending_members_row.PM_IMG} 
	  </td>
	  <td bgcolor="#E1ECFB" align="center" class="border-alb"><span class="gen"><a href="{pending_members_row.U_VIEWPROFILE}" class="gen">{pending_members_row.USERNAME}</a></span></td>
	  <td bgcolor="#E1ECFB" align="center" class="border-alb"><span class="gen">{pending_members_row.POSTS}</span></td>
	  <td bgcolor="#EAF1FC" align="center" class="border-alb"><span class="gen">{pending_members_row.FROM}</span></td>
	  <td bgcolor="#E1ECFB" align="center" class="border-alb"><span class="gen">{pending_members_row.EMAIL_IMG}</span></td>
	  <td bgcolor="#E1ECFB" align="center" class="border-alb"><span class="gen">{pending_members_row.WWW_IMG}</span></td>
	  <td bgcolor="#E1ECFB" align="center"><span class="gensmall"> <input type="checkbox" name="pending_members[]" value="{pending_members_row.USER_ID}" checked="checked" /></span></td>
	</tr>
	<!-- END pending_members_row -->
	<tr> 
	  <td class="cat" colspan="8" align="right" bgcolor="E1ECFB"><span class="cattitle"> 
		<input type="submit" name="approve" value="{L_APPROVE_SELECTED}" class="form2" />
		&nbsp; 
		<input type="submit" name="deny" value="{L_DENY_SELECTED}" class="form2" />
		</span></td>
	</tr>
</table>
		  
		  </tr>
      </table>
	  
	  
	  </td>
    </tr>
</table></td>
  </tr>
</table>
