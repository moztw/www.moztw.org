#!/usr/bin/env perl

use CGI qw/:standard/;

if(param()) {
    $LPID = param('LPID');
    $LPVER = param('LPVER');
    $TAPPID = param('TAPPID');
    $TAPPMINVER = param('TAPPMINVER');
    $TAPPMAXVER = param('TAPPMAXVER');
    $LPNAME = param('LPNAME');
    $LPDESC = param('LPDESC');
    $LPAUTHOR = param('LPAUTHOR');
    $LPHOMEPAGE = param('LPHOMEPAGE');

print "Content-Type: text/plain; charset=UTF-8\n\n";
    print <<HERE;
<?xml version="1.0"?>

<RDF xmlns="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:em="http://www.mozilla.org/2004/em-rdf#">

  <Description about="urn:mozilla:install-manifest">
    <em:id>${LPID}</em:id>
    <em:version>${LPVER}</em:version>

    <!-- Target Application this extension can install into, 
        with minimum and maximum supported versions. --> 
    <em:targetApplication>
      <Description>
        <em:id>${TAPPID}</em:id>
	<em:minVersion>${TAPPMINVER}</em:minVersion>
	<em:maxVersion>${TAPPMAXVER}</em:maxVersion>
      </Description>
    </em:targetApplication>

    <!-- Front End MetaData -->
    <em:name>${LPNAME}</em:name>
    <em:description>${LPDESC}</em:description>
    <em:creator>${LPAUTHOR}</em:creator>
    <em:homepageURL>${LPHOMEPAGE}</em:homepageURL>

    <!-- Front End Integration Hooks (used by Extension Manager)-->
    <em:optionsURL>chrome://lpswitcher/content/lpswitcher.xul</em:optionsURL>

    <!-- Packages, Skins and Locales that this extension registers -->
    <em:file>
      <Description about="urn:mozilla:extension:file:lpswitcher.jar">
        <em:package>content/lpswitcher/</em:package>
        <em:locale>locale/en-US/lpswitcher/</em:locale>
        <!-- em:skin>skin/classic/lpswitcher/</em:skin -->
      </Description>
    </em:file>

    <em:file>
      <Description about="urn:mozilla:extension:file:TW.jar">
        <em:locale>locale/TW/global-region/</em:locale>
        <em:locale>locale/TW/browser-region/</em:locale>
      </Description>
    </em:file>

    <em:file>
      <Description about="urn:mozilla:extension:file:zh-TW.jar">
        <em:locale>locale/zh-TW/autoconfig/</em:locale>
        <em:locale>locale/zh-TW/browser/</em:locale>
        <em:locale>locale/zh-TW/communicator/</em:locale>
        <em:locale>locale/zh-TW/cookie/</em:locale>
        <em:locale>locale/zh-TW/global/</em:locale>
        <em:locale>locale/zh-TW/help/</em:locale>
        <em:locale>locale/zh-TW/inspector/</em:locale>
        <em:locale>locale/zh-TW/mozapps/</em:locale>
        <em:locale>locale/zh-TW/necko/</em:locale>
        <em:locale>locale/zh-TW/passwordmgr/</em:locale>
        <em:locale>locale/zh-TW/pipnss/</em:locale>
        <em:locale>locale/zh-TW/pippki/</em:locale>
      </Description>
    </em:file>

    <em:file>
      <Description about="urn:mozilla:extension:file:zh-unix.jar">
        <em:locale>locale/zh-TW/global-platform/</em:locale>
      </Description>
    </em:file>

    <em:file>
      <Description about="urn:mozilla:extension:file:zh-mac.jar">
        <em:locale>locale/zh-TW/global-platform/</em:locale>
      </Description>
    </em:file>

    <em:file>
      <Description about="urn:mozilla:extension:file:zh-win.jar">
        <em:locale>locale/zh-TW/global-platform/</em:locale>
      </Description>
    </em:file>

  <em:requires>
    <Description>
      <em:id>${TAPPID}</em:id>
      <em:minVersion>${TAPPMINVER}</em:minVersion>
      <em:maxVersion>${TAPPMAXVER}</em:maxVersion>
    </Description>
  </em:requires>

  </Description>      
</RDF>
HERE
} else {
print "Content-Type: text/html; charset=UTF-8\n\n";
print <<HERE;
<html>
<head>
<title> Mozilla New Tookit/Extension install.rdf Generator </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style>
<!--
INPUT { width: 50em; }
-->
</style>
</head>
<body>
<H3> Mozilla New Tookit/Extension install.rdf Generator </H3>
<form method="POST">
<table>
<tr><th>Lanapack Name:<td><input name="LPNAME" value="Firefox abLP 0.9">
<tr><th>Description:<td><input name="LPDESC" value="aaa BBB (aa-BB) Language Pack for Firefox">
<tr><th>Creator:<td><input name="LPAUTHOR" value="Your Name">
<tr><th>Homepage:<td><input name="LPHOMEPAGE" value="http://www.your.domain/url/">
<tr><th>GUID:<td><input name="LPID" value="{fakeguid-lang-rand-rand-mozextension}">
<tr><th>Version:<td><input name="LPVER" value="0.9">
<tr><th>Target Application:<td><select name="TAPPID">
    <option value="{ec8030f7-c20a-464f-9b0e-13a3a9e97384}">Firefox</option>
</select>
<tr><th>Min Version:<td><input name="TAPPMINVER" value="0.9">
<tr><th>Max Version:<td><input name="TAPPMAXVER" value="0.9">
<tr><th><td><input type="submit" value="Generate">
</table>
</form>
</body>
</html>
HERE
}

