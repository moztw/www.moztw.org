<table width="98%"  border="0" cellspacing="0" cellpadding="0" align="center">
    <td>


<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="border-bleu-jos">
  <tr valign="bottom">
    <td height="26" colspan="3" class="stil01"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0" class="border-maro-dr">
      <tr>
        <td width="5%" valign="bottom"><img src="templates/LiteVision/images/05.gif" width="49" height="21"></td>
        <td width="95%" valign="bottom"><table width="98%" height="22"  border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><div align="left">&nbsp;<span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></div></td>
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
        <td><div align="center"><span class="genmed"><strong>{L_SEARCH_QUERY}</strong></span></div></td>
        </tr>
    </table></td>
    <td width="1%" rowspan="2" bgcolor="#D0E4FB" class="border-bleu-st-dr">&nbsp;</td>
  </tr>
    <tr>
      <td bgcolor="#EAF1FC"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td bgcolor="#FFFFFF">
		  <form action="{S_SEARCH_ACTION}" method="POST">
		  <table width="100%" cellpadding="0" cellspacing="2" border="0">
            <tr>
              <td bgcolor="#EAF1FC" colspan="2" width="50%"><span class="gen">{L_SEARCH_KEYWORDS}:</span><br />
                  <span class="gensmall">{L_SEARCH_KEYWORDS_EXPLAIN}</span></td>
              <td bgcolor="#E1ECFB" colspan="2" valign="top"><span class="genmed">
                <input type="text" style="width: 300px" class="form" name="search_keywords" size="30" />
                <br />
                <input type="radio" name="search_terms" value="any" checked="checked" />
      {L_SEARCH_ANY_TERMS}<br />
      <input type="radio" name="search_terms" value="all" />
      {L_SEARCH_ALL_TERMS}</span></td>
            </tr>
            <tr>
              <td bgcolor="#EAF1FC" colspan="2"><span class="gen">{L_SEARCH_AUTHOR}:</span><br />
                  <span class="gensmall">{L_SEARCH_AUTHOR_EXPLAIN}</span></td>
              <td bgcolor="#E1ECFB" colspan="2" valign="middle"><span class="genmed">
                <input type="text" style="width: 300px" class="form" name="search_author" size="30" />
              </span></td>
            </tr>
            <tr>
              <td colspan="4" height="25"><table width="100%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="stil06"><div align="center"><span class="genmed"><strong>{L_SEARCH_OPTIONS}</strong></span></div></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB" align="right"><span class="gen">{L_FORUM}:&nbsp;</span></td>
              <td bgcolor="#E1ECFB"><span class="genmed">
                <select class="post" name="search_forum">
                  {S_FORUM_OPTIONS}
                </select>
              </span></td>
              <td bgcolor="#EAF1FC" align="right" nowrap="nowrap"><span class="gen">{L_SEARCH_PREVIOUS}:&nbsp;</span></td>
              <td bgcolor="#EAF1FC" valign="middle"><span class="genmed">
                <select class="post" name="search_time">
                  {S_TIME_OPTIONS}
                </select>
                <br />
                <input type="radio" name="search_fields" value="all" checked="checked" />
      {L_SEARCH_MESSAGE_TITLE}<br />
      <input type="radio" name="search_fields" value="msgonly" />
      {L_SEARCH_MESSAGE_ONLY}</span></td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB" align="right"><span class="gen">{L_CATEGORY}:&nbsp;</span></td>
              <td bgcolor="#E1ECFB"><span class="genmed">
                <select class="post" name="search_cat">
                  {S_CATEGORY_OPTIONS}
		
                </select>
              </span></td>
              <td bgcolor="#EAF1FC" align="right"><span class="gen">{L_SORT_BY}:&nbsp;</span></td>
              <td bgcolor="#EAF1FC" valign="middle" nowrap="nowrap"><span class="genmed">
                <select class="post" name="sort_by">
                  {S_SORT_OPTIONS}
                </select>
                <br />
                <input type="radio" name="sort_dir" value="ASC" />
      {L_SORT_ASCENDING}<br />
      <input type="radio" name="sort_dir" value="DESC" checked />
      {L_SORT_DESCENDING}</span>&nbsp;</td>
            </tr>
            <tr>
              <td bgcolor="#E1ECFB" align="right" nowrap="nowrap"><span class="gen">{L_DISPLAY_RESULTS}:&nbsp;</span></td>
              <td bgcolor="#E1ECFB" nowrap="nowrap"><input type="radio" name="show_results" value="posts" />
                  <span class="genmed">{L_POSTS}
                  <input type="radio" name="show_results" value="topics" checked="checked" />
                  {L_TOPICS}</span></td>
              <td bgcolor="#EAF1FC" align="right"><span class="gen">{L_RETURN_FIRST}</span></td>
              <td bgcolor="#EAF1FC"><span class="genmed">
                <select class="post" name="return_chars">
                  {S_CHARACTER_OPTIONS}
                </select>
      {L_CHARACTERS}</span></td>
            </tr>
            <tr>
              <td bgcolor="#D3E3FA" colspan="4" align="center" height="28">{S_HIDDEN_FIELDS}
                  <input name="submit" type="submit" class="form" value="{L_SEARCH}" /></td>
            </tr>
          </table>
		  </form>
		  </td>
        </tr>
      </table></td>
    </tr>
</table></td>
  </tr>
</table>
