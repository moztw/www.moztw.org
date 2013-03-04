<?
include("inc/meta.html");
include("inc/title.html");
include("inc/class.html");
include("inc/header.html");
?>
<h1>MozTW Website Online Update</h1>
<?
if(isset($_POST["rebuild_git"]) && $_POST["rebuild_git"])
{
  # processing
?>
<p>Starting pull updates of browser-pairs game...</p>
<pre id='progress_blk'  title='still processing, please wait...'
    style='padding: 5px; maring: 5px; cursor: wait;
    border: 1px solid green;
    border-bottom: 1px dotted red'><?
  $cmd = '/home/moztw/htdocs/autoupdate/update-git.sh';
  $cmd .= ' 2>&1';
  echo "Command: " . htmlspecialchars($cmd) . "\n\n";

  ob_flush();
  flush();
  $handle = popen("" . $cmd, "r");
  while($s= fgets($handle, 1024)) {
    // read from the pipe
    print htmlspecialchars($s);
    fwrite($handle, "p\n");
    ob_flush();
    flush();
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
}
if(isset($_POST["rebuild_yes"]) && $_POST["rebuild_yes"])
{
    # processing
?>
Starting Update [moztw GIT]...
<pre id='progress_blk'  title='still processing, please wait...'
  style='padding: 5px; maring: 5px; cursor: wait;
    border: 1px solid green;
    border-bottom: 1px dotted red'><?
  $isInStage = (strpos($_SERVER["SCRIPT_FILENAME"], 'www-stage') != false);
  $cmd = '/home/moztw/htdocs/autoupdate/update.sh';
  $opt = '';

  if ($isInStage)
    $opt .= ' stage';
  if(isset($_POST["rebuild_md5"]) && $_POST["rebuild_md5"])
    $opt .= ' md5';
  if(isset($_POST["rebuild_cache"]) && $_POST["rebuild_cache"])
    $opt .= ' cache';

  $cmd .= $opt;
  $cmd .= ' 2>&1';
  echo "Command: " . htmlspecialchars($cmd) . "\n\n";

  ob_flush();
  flush();
  // system("" . $cmd);
  $handle = popen("" . $cmd, "r");
  while($s= fgets($handle, 1024)) {
    // read from the pipe
    print htmlspecialchars($s);
    fwrite($handle, "p\n");
    ob_flush();
    flush();
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
    <p style="color: blue; font-weight:bold;">Update MozTW Website:<br><br>
	    <label style="color: black;">Confirm to update main repo for MozTW website.
			<input id='xgeneral' type='checkbox' name='rebuild_yes' checked>
		</label>
	</p>
	<p style="color: blue; font-weight:bold;">Update other Git repos:<br><br>
		<label style="color: black;">Confirm to update browser-pairs and other git repos.
			<input id='xgit' type="checkbox" name="rebuild_git">
		</label>
	</p>
  <hr>
	<p style="color: blue; font-weight:bold;">Optional Git rebuild process:<br><br>
		<label style="color: black;">Recalculate MD5 information <b style='color: red;'>(if files in dls/ were changed, and very slow)</b>
		    <input id='xmd5' type="checkbox" name="rebuild_md5">
  		</label><br>
		<label style="color: black;">Rebuild all HTML caches <b style='color: red;'>(if htdocs/inc/*.html were modified)</b>
			<input id='xcache' type="checkbox" name="rebuild_cache">
		</label>
	</p>
  <hr>
	<input type='submit' value='Start Update'>
    </fieldset></form>
<?
}
?>

<?
include("inc/footer.html");
?>

