<!DOCTYPE html>

<html>
<head> 
	<meta charset="UTF-8">
	<title>#mozilla-taiwan IRC Archive</title>
	<link rel="stylesheet" href="style.css" type="text/css" />
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"> </script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"> </script>
	<script type="text/javascript" src="LumberJack_js_app.js"> </script>
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">

</head>
<body>
	
<div id="toolbar"> 
	<div id="toolbar_inner">
	
	<form id="search" style="display:inline;" action="#loading">
		<input id="searchbox" placeholder="Search" tabindex="1" type="text" />
		<input id="searchbutton" tabindex="2" type="submit" value="Search"/>
	</form>
	<a id="home" class='toolbutton' href="#">Home</a>
	<span id="searchoptions"> 
	<a id="load_more" class='toolbutton' href="#">More</a> 
	</span>
	<span id="options">
		<a id="prev" class='toolbutton' href="#">&lt;&lt;</a> 
		<a id="next" class='toolbutton' href="#">&gt;&gt;</a> 
	</span>
	<img id="loading" src="images/ajax-loader.gif" alt="Loading..." />
	</div>

</div>	
	
<div id="content">
	
	<table id="irc">
	</table>
	<div id="bottom"></div>
	
</div>

<div id="footer">
	Powered by <a href="http://curtis.lassam.net/software/lumberjack/">LumberJack</a> v1.1
</div>

</body>
</html>
