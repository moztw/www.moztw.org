<?php
$url = 'aHR0cHM6Ly90ZWxlZ3JhbS5tZS9qb2luY2hhdC9BbVdldVQwWFpLdE9FZXhQYWtyVFZ3';   # base64 Encode https://telegram.me/joinchat/Am* (anti-bot)
$err = 'https://telegram.org/';   # When Verification Failed

if (isset($_GET['recaptcha'])) {
	$curl = curl_init();
	curl_setopt($curl, CURLOPT_URL, 'https://www.google.com/recaptcha/api/siteverify');   # Google reCAPTCHA Veritication API
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, True);   # Don't show respone
	curl_setopt($curl, CURLOPT_POST, True);   # Use POST
	curl_setopt($curl, CURLOPT_POSTFIELDS, 'secret=6LdlOxYTAAAAAAlL-GdqeU_KWOYt1WrHNGtW6m2E&response=' . urlencode($_GET['recaptcha']));   # API key and verification token
	$data = curl_exec($curl);
	curl_close($curl);
	$data = json_decode($data, True);
	if (isset($data['success']) && $data['success'] === True) {   # if verify success
		$url = base64_decode($url);   # decode base64
		echo $url;   # output join link
	} else {
		echo $err;   # output another link
	}
	exit;   # don't show html
}   # if not isset get[recaptcha] parameter, show html
?>

<html>
	<head>
		<meta charset="utf-8"></meta>
		<title>MozTW Telegram Group</title>
		<meta property="og:title" content="MozTW Telegeam Group"></meta>
		<meta property="og:image" content="https://moztw.org/foxmosa/images/30series/30foxmosa-12.png"></meta>
		<script src="//www.google.com/recaptcha/api.js"></script>
	</head>
	<body>
		<script>
		function recaptcha() {
			document.getElementById("recaptcha").style.display = "none";
			document.getElementById("waiting").style.display = "";

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					document.getElementById("link").href = xhttp.responseText;
					document.getElementById("waiting").style.display = "none";
					document.getElementById("join").style.display = "";
				}
			};
			xhttp.open("GET", "https://www.moztw.org/community/telegram.php?recaptcha=" + document.getElementById("g-recaptcha-response").value, true);
			xhttp.send();
		}
		</script>

		<div id="recaptcha" style="">
			<p>為了防止廣告機器人進入群組，麻煩您點一下下面的「我不是機器人」</p>
			<div class="g-recaptcha" data-sitekey="6LdlOxYTAAAAALp47v-OJ69P3s1fuOPsR987xpGO"></div><br />
			<input type="button" value="Submit" onclick="recaptcha()"></input>
		</div>

		<div id="waiting" style="display: none">
			<p>處理中，請稍候..</p>
		</div>

		<div id="join" style="display: none">
			<p>非常感謝您的配合，<a id="link" href="//MozTW.org">點我加入 Telegram 群組</a>
		</div>
	</body>
</html>
