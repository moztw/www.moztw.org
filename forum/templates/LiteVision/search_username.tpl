
<script language="javascript" type="text/javascript">
<!--
function refresh_username(selected_username)
{
	opener.document.forms['post'].username.value = selected_username;
	opener.focus();
	window.close();
}
//-->
</script>

<form method="post" name="search" action="{S_SEARCH_ACTION}">
<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="2" class="border-bleu">
			<tr> 
				<td class="stil06" height="21"><div align="center"><span class="genmed"><strong>{L_SEARCH_USERNAME}</strong></span></div></td>
			</tr>
			<tr> 
				<td valign="top" bgcolor="#E1ECFB"><span class="genmed"><br /><input type="text" name="search_username" value="{USERNAME}" class="form" />&nbsp; <input type="submit" name="search" value="{L_SEARCH}" class="form2" /></span><br /><span class="gensmall">{L_SEARCH_EXPLAIN}</span><br />
				<!-- BEGIN switch_select_name -->
				<span class="genmed">{L_UPDATE_USERNAME}<br /><select name="username_list">{S_USERNAME_OPTIONS}</select>&nbsp; <input type="submit" class="liteoption" onclick="refresh_username(this.form.username_list.options[this.form.username_list.selectedIndex].value);return false;" name="use" value="{L_SELECT}" /></span><br />
				<!-- END switch_select_name -->
				<br /><span class="genmed"><a href="javascript:window.close();" class="genmed">{L_CLOSE_WINDOW}</a></span></td>
			</tr>
		</table></td>
	</tr>
</table>
</form>
