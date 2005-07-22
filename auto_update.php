<?
include("inc/meta.html");
include("inc/title.html");
include("inc/class.html");
include("inc/header.html");
?>
<H1>Mozilla Taiwan Website Online Update</H1>
<?
if(isset($_POST["rebuild_yes"]) && $_POST["rebuild_yes"])
{
    # processing
?>
Starting Update...  
<pre id='progress_blk'  title='still processing, please wait...'
    style='padding: 5px; maring: 5px; cursor: wait;
	    border: 1px solid green; 
            border-bottom: 1px dotted red'><?
    $cmd = '/home/moztw/autoupdate/update.cgi';
    $opt = '';

    if(isset($_POST["rebuild_md5"]) && $_POST["rebuild_md5"])
      $opt .= ' md5';
    if(isset($_POST["rebuild_cache"]) && $_POST["rebuild_cache"])
      $opt .= ' cache';

    $cmd .= $opt;
    $cmd .= ' 2>&1';
    echo "Command: " . htmlspecialchars($cmd) . "\n\n";

    ob_flush(); flush(); 
    // system("" . $cmd); 
    $handle = popen("" . $cmd, "r"); 
    while($s= fgets($handle, 1024)) {
	// read from the pipe
	print htmlspecialchars($s);
	ob_flush(); flush(); 
    }
    pclose($handle);
?>
</pre><script type='text/javascript'>
<!--
document.getElementById('progress_blk').style.border = '1px solid black';
document.getElementById('progress_blk').style.cursor = 'default';
document.getElementById('progress_blk').title = 'ready';
// -->
</script>
<?
} else {
    # index page
    ?>
    <form method="post"><fieldset>
    <label style='color: blue;'>
    Basic update:</label><br/><br/>
    <input  id='xgeneral' type='checkbox' name='rebuild_yes' checked>
    <label for='xgeneral'>Confirm to update SVN and rebuild.</label><br/>
    <hr><label style='color: blue;'>
    Optional rebuild process:</label><br/><br/>
    <input  id='xmd5' type="checkbox" name="rebuild_md5"> 
    <label for='xmd5'>Recalculate MD5 information 
	<b style='color: red;'>(if files in dls/ changed, and very slow)
	</b></label><br/>
    <input  id='xcache' type="checkbox" name="rebuild_cache"> 
    <label for='xcache'>Rebuild all HTML cache 
    	<b style='color: red;'>(if htdocs/inc/*.html modified)
	</b></label><br/>
    <hr><input type='submit' value='Start Update'>
    </fieldset></form>
<?
}
?>

<?
include("inc/footer.html");
?>
