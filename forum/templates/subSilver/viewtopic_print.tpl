<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" -->
<html dir="{S_CONTENT_DIRECTION}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={S_CONTENT_ENCODING}">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>{SITENAME} :: {PAGE_TITLE}</title>
<style type="text/css">
<!--
body {
    font-family: {T_FONTFACE1};
    font-size: 12px ;
    letter-spacing: 1px;
}
/* Quote & Code blocks */
.code, .quote, .php {
    font-size: 11px;
	border: black; border-style: solid;
	border-left-width: 1px; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px
}
.Forum {
    font-weight : bold;
    font-size: 18px;
}
.Topic {
    font-weight : bold;
    font-size: 14px;
}
.genmed {
    font-size: 12px;
}
hr.sep	{ height: 0px; border: solid #D1D7DC 0px; border-top-width: 1px;}



-->
</style>
</head>
<body>
<span class="Forum"><div align="center">{SITENAME}</div></span><br />
<span class="Topic">{FORUM_NAME} - {TOPIC_TITLE}</span><br />

  <!-- BEGIN postrow -->
   <hr />
  <b>{postrow.POSTER_NAME}</b> - {postrow.POST_DATE}<br />
  <b>{L_POST_SUBJECT}: </b>{postrow.POST_SUBJECT}<hr width=95% class="sep"/>
  {postrow.MESSAGE}
  <!-- END postrow -->
  <hr />
<div align="center">
  <!--{S_TIMEZONE}<br />

	Please note that the following copyright notice
	MUST be displayed on each and every page output
	by phpBB. You may alter the font, colour etc. but
	you CANNOT remove it, nor change it so that it be,
	to all intents and purposes, invisible. You may ADD
	your own notice to it should you have altered the
	code but you may not replace it. The hyperlink must
	also remain intact. These conditions are part of the
	licence this software is released under. See the
	LICENCE and README files for more information.

	The phpBB Group : 2001

// -->
  Powered by phpBB {PHPBB_VERSION} &copy; 2003 <a href="http://www.phpbb.com/" target="_phpbb" class="copyright">phpBB
  Group</a></div>
</body>
</html>
