<?php
define('SiteSecret', '6LdlOxYTAAAAAAlL-GdqeU_KWOYt1WrHNGtW6m2E');
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
			'MozTW' => 'AmWeuT0XZKtOEexPakrTVw',
			'MozTW 字幕組' => 'AutpyAC4ZZF7syTysmXPOg',
			'MozTW Design' => 'AutpyAHfYs0BX2ZfX9XwYA',
			'Foxfooder' => 'AutpyAJlAH_DT1o80qwbhQ',
			'Mozillians (en)' => 'AutpyDvFHJHnUD9OZdPtlg',
			'mozilla-video-l10n (en)' => 'AutpyAGi7CL74m0Zs7pPTA',
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
