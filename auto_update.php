<?
include("inc/meta.html");
include("inc/title.html");
include("inc/class.html");
include("inc/header.html");
?>
<H1>Mozilla Taiwan Website Online Update</H1>
Starting Update...
<hr>
<? ob_flush(); flush(); ?>
<pre>
<? system("/home/moztw/autoupdate/update.cgi 2>&1"); ?>
</pre>
<hr>

<?
include("inc/footer.html");
?>
