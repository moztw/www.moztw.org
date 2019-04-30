<?php
// Github will hit this URL with POST requests when you push, passing along information about the push.
// More information can be found at: https://help.github.com/en/articles/about-githubs-ip-addresses
//
// TODO: Add code to verify request using X-GitHub-Delivery header

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://api.github.com/meta");
curl_setopt($ch, CURLOPT_USERAGENT, "PHP"); // GitHub requires User Agent to be sent
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);

$gh_data = json_decode(curl_exec($ch), true);
curl_close($ch);

$gh_whitelist = $gh_data["hooks"];
$clientip_DEC = $_SERVER["REMOTE_ADDR"];
$payload = json_decode($_POST["payload"]);
$checkPayload = $payload && (strpos($_SERVER["HTTP_USER_AGENT"], "GitHub-Hookshot") !== FALSE);

function checkIPAddr( $ipaddr, $validrange ) {
  if ( !strpos( $validrange, "/" ) ) {
    $validrange .= "/32";
  }

  list( $validrange, $netmask ) = explode( "/", $validrange, 2 );
  $validrange_DEC = ip2long( $validrange );
  $ipaddr_DEC = ip2long( $ipaddr );
  $wildcard_DEC = 2 ** ( 32 - $netmask ) - 1;

  return ( $ipaddr_DEC >= $validrange_DEC ) && ( $ipaddr_DEC < $validrange_DEC + $wildcard_DEC );
}

foreach ($gh_whitelist as $validip) {
  // 檢查來源 IP 是否在白名單中
  $output = checkIPAddr($clientip_DEC, $validip);

  if ($output && $checkPayload) {
    $cmd = "/home/moztw/repo/base/autoupdate/update.sh";
    $opt = "";
    $branch = "";
    if ($payload->ref === "refs/heads/production") {
      //production
      $branch = " www";
      echo("is production\n");
    } elseif ($payload->ref === "refs/heads/master") {
      //stage
      $branch = " stage";
      echo("is stage\n");
    } else {
      http_response_code(400);
      die("!!!Wrong payload.");
    }
    // $opt = " md5 cache"; // TODO: updating MD5 and SHTML cache will cause timeout for GitHub, comment out for now
    $cmd = $cmd . $branch . $opt . " 2>&1";
    echo($cmd . "\n");

    system($cmd);

    http_response_code(200);
    die("Updated Successfully.");
  }
}
http_response_code(400);
die("!!!Invalid arguments given or not from Github.");
?>
