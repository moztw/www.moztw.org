<?php
require('config.php');
require('links.php');

if (!isset($_GET['recaptcha']) || $_GET['recaptcha'] == '')
	fail();

if (isset($_GET['tag']) && array_key_exists($_GET['tag'], $tags))
	$tag = $_GET['tag'];
else
	$tag = 'all';

$curl = curl_init();
curl_setopt_array($curl, Array(
	CURLOPT_URL => 'https://www.google.com/recaptcha/api/siteverify',   # Google reCAPTCHA Veritication API
	CURLOPT_RETURNTRANSFER => True,   # Don't show respone
	CURLOPT_POST => True,   # Use POST
	CURLOPT_POSTFIELDS => Array(
		'secret' => SiteSecret,
		'response' => $_GET['recaptcha'],
	),
));
$data = curl_exec($curl);
curl_close($curl);
$data = json_decode($data, True);

if (isset($data['success']) && $data['success'])   # if verify success
	success($tag);
else
	fail();

function fail() {
	$respone = Array(
		'success' => False
	);
	$respone = json_encode($respone);
	echo $respone;
	exit;
}

function success($tag) {
	$link = genLinks($tag);
	$respone = Array(
		'success' => True,
		'data' => $link,
	);
	$respone = json_encode($respone);
	echo $respone;
	exit;
}

function genLinks($tag) {
	global $links;

	$result = Array($links[0]);   # MozTW
	$links = array_slice($links, 1);   # Remove MozTW form all group list

	foreach ($links as $link)
		if (in_array($tag, $link['tags']))
			$result[] = $link;
	return $result;
}
