<?php
require('config.php');

if (isset($_GET['recaptcha'])) {
	$curl = curl_init();
	curl_setopt($curl, CURLOPT_URL, 'https://www.google.com/recaptcha/api/siteverify');   # Google reCAPTCHA Veritication API
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, True);   # Don't show respone
	curl_setopt($curl, CURLOPT_POST, True);   # Use POST
	curl_setopt($curl, CURLOPT_POSTFIELDS, 'secret=' . SiteSecret . '&response=' . urlencode($_GET['recaptcha']));   # API key and verification token
	$data = curl_exec($curl);
	curl_close($curl);
	$data = json_decode($data, True);
	if (isset($data['success']) && $data['success'] === True) {   # if verify success
		success();
	} else {
		fail();
	}
}

function success() {
	$respone = Array(
		'success' => True,
		'data' => Array(
# format:		'Name' => 'ID',    // $url = 'https://telegram.me/joinchat/' . $ID;
			'MozTW' => 'AmWeuT0XZKuwaB9m3AXfyw',
			'MozTW 字幕組' => 'AutpyAC4ZZFBxqYV0reM2w',
			'MozTW Design' => 'AutpyAHfYs36856lXGTZrA',
			'Foxfooder (zh)' => 'AutpyAJlAH8jqV6ZgyAr_Q',
			'Mozillians (en)' => 'AutpyDvFHJHFTwwS0JyTrA',
			'mozilla-videol10n (en)' => 'AutpyAGi7CJR02wP1AnY_g',
		)
	);
	$respone = json_encode($respone);
	echo $respone;
}

function fail() {
	$respone = Array(
		'success' => False
	);
	$respone = json_encode($respone);
	echo $respone;
}
