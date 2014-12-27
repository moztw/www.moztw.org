<?php
$isInStage = (strpos($_SERVER["SCRIPT_FILENAME"], 'www-stage') != false);
// Github We’ll hit these URLs with POST requests when you push to us,
// passing along information about the push. More information can be found in the Post-Receive Guide.
//
// The Public IP addresses for these hooks are: 204.232.175.64/27, 192.30.252.0/22.
// FIXME: counting CIDR is too complicated. DO NOT UNMARK FOLLOWING TWO LINES UNLESS YOU WROTE CODE FOR COUNTING IP RANGE.
//$whitelist = array('204.232.175.64/27', '192.30.252.0/22');
//$isGithub = (in_array($_SERVER['REMOTE_ADDR'], $whitelist) === true);
$isGithub = isset($_POST["payload"]) && (strpos($_SERVER["HTTP_USER_AGENT"], 'GitHub')  !== false);
if($isGithub){
  $payload = json_decode($_POST["payload"]);

  $cmd = '/home/moztw/repo/base/autoupdate/update.sh';

  $opt = '';
  if($payload->ref==="refs/heads/production"){
    //production
    $opt .= ' www';
    echo("is production\n");
  }elseif($payload->ref==="refs/heads/master"){
    //stage
    $opt .= ' stage';
    echo("is stage\n");
  }else{
    die("!!!Wrong payload.");
  }

  $opt .= ' md5';
  $opt .= ' cache';

  $cmd .= $opt;
  $cmd .= ' 2>&1';
  echo($cmd . "\n");

  error_log(print_r($cmd,TRUE));
  ob_flush();
  flush();

  $handle = popen($cmd, "r");
  while(!feof($handle)) {
    print fread($handle, 1024);
  }
  flush();
  pclose($handle);
} else {
  die("!!!Invalid arguments given or not from Github.");
}
?>
