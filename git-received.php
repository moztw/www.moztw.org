<?php
$isInStage = (strpos($_SERVER["SCRIPT_FILENAME"], 'www-stage') != false);
// Github will hit this URL with POST requests when you push, passing along information about the push. 
// More information can be found at: https://help.github.com/articles/what-ip-addresses-does-github-use-that-i-should-whitelist/
//
// The Public IP addresses for these hooks are: 192.30.252.0/22.
// TODO: Add code to verify request using X-GitHub-Delivery header

$GhWhitelist = array('192.30.252.0',22); //ipaddr_begin,mask
$GhWhitelistBegin_DEC = ip2long($GhWhitelist[0]);
$CIDR_DEC = pow(2, 32 - $GhWhitelist[1]); //Use (2 ** (32 - $GhWhitelist[1])) in PHP 5.6+
$GhWhitelistEnd_DEC = $GhWhitelistBegin_DEC + $CIDR_DEC - 1;
$ClientIP_DEC = ip2long($_SERVER["REMOTE_ADDR"]);
$isGithub = ($GhWhitelistBegin_DEC <= $ClientIP_DEC) && ($ClientIP_DEC <= $GhWhitelistEnd_DEC);
$checkPayload = isset($_POST["payload"]) && (strpos($_SERVER["HTTP_USER_AGENT"], 'GitHub') !== false);

if($isGithub && $checkPayload){
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
    http_response_code(400);
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
  http_response_code(400);
  die("!!!Invalid arguments given or not from Github.");
}
?>
