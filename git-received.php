<?php
$isInStage = (strpos($_SERVER["SCRIPT_FILENAME"], 'www-stage') != false);
// Github We’ll hit these URLs with POST requests when you push to us, 
// passing along information about the push. More information can be found in the Post-Receive Guide.
//
// The Public IP addresses for these hooks are: 207.97.227.253/32, 50.57.128.197/32, 108.171.174.178/32, 
// 50.57.231.61/32, 54.235.183.49/32, 54.235.183.23/32, 54.235.118.251/32, 54.235.120.57/32, 54.235.120.61/32, 54.235.120.62/32.
$whitelist = array('207.97.227.253', '50.57.128.197','108.171.174.178','50.57.231.61','54.235.183.49','54.235.183.23','54.235.118.251','54.235.120.57','54.235.120.61','54.235.120.62');
$isGithub = (in_array($_SERVER['REMOTE_ADDR'], $whitelist) === true);
var_dump($isInStage);
var_dump($isGithub);
if( $isInStage && $isGithub){
  $cmd = 'bash /home/moztw/htdocs/autoupdate/update-git.sh';
  $cmd .= ' 2>&1';
  ob_flush();
  flush();
  $handle = popen("" . $cmd, "r");
  pclose($handle);
}
?>
