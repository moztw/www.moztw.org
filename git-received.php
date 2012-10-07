<?

$fp = fopen("/home/moztw/htdocs/logs/git-post-received-hook.log", "a");
fwrite($fp, "Get push: " . $_POST['payload']);
fclose($fp);

?>
