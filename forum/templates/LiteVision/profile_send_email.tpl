
<script language="JavaScript" type="text/javascript">
<!--
function checkForm(formObj) {

	formErrors = false;    

	if (formObj.message.value.length < 2) {
		formErrors = "{L_EMPTY_MESSAGE_EMAIL}";
	}
	else if ( formObj.subject.value.length < 2)
	{
		formErrors = "{L_EMPTY_SUBJECT_EMAIL}";
	}

	if (formErrors) {
		alert(formErrors);
		return false;
	}
}
//-->
</script>
<form action="{S_POST_ACTION}" method="post" name="post" onSubmit="return checkForm(this)">

{ERROR_BOX}

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
                <td><div align="center"><span class="genmed"><strong>{L_SEND_EMAIL_MSG}</strong></span></div></td>
              </tr>
          </table></td>
          <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
            <tr>
              <td bgcolor="#EAF1FC" width="22%"><span class="gen"><b>&nbsp;{L_RECIPIENT}</b></span></td>
              <td bgcolor="#E1ECFB" width="78%"><span class="gen"><b>&nbsp;&nbsp;{USERNAME}</b></span> </td>
            </tr>
            <tr>
              <td bgcolor="#EAF1FC" width="22%"><span class="gen"><b>&nbsp;{L_SUBJECT}</b></span></td>
              <td bgcolor="#E1ECFB" width="78%"><span class="gen">
                &nbsp;
                <input type="text" name="subject" size="45" maxlength="100" style="width:450px" tabindex="2" class="form2" value="{SUBJECT}" />
              </span> </td>
            </tr>
            <tr>
              <td bgcolor="#EAF1FC" valign="top"><span class="gen"><b>&nbsp;{L_MESSAGE_BODY}</b></span>
                <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><div align="justify"><span class="gensmall">{L_MESSAGE_BODY_DESC}</span></div></td>
                  </tr>
                </table>                <br />
                  </td>
              <td bgcolor="#E1ECFB"><span class="gen">
                &nbsp;
                <textarea name="message" rows="25" cols="40" wrap="virtual" style="width:500px" tabindex="3" class="form2">{MESSAGE}</textarea>
              </span></td>
            </tr>
            <tr>
              <td bgcolor="#EAF1FC" valign="top"><span class="gen"><b>&nbsp;{L_OPTIONS}</b></span></td>
              <td bgcolor="#E1ECFB"><table cellspacing="0" cellpadding="1" border="0">
                  <tr>
                    <td><input type="checkbox" name="cc_email"  value="1" checked="checked" /></td>
                    <td><span class="gen">{L_CC_EMAIL}</span></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB" colspan="2" align="center" height="28">{S_HIDDEN_FIELDS}
                  <input type="submit" tabindex="6" name="submit" class="form2" value="{L_SEND_EMAIL}" /></td>
            </tr>
          </table></td>
        </tr>
      </table>      </td>
  </tr>
</table>
</form>

