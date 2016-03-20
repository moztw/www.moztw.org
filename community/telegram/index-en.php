<?php
require('config.php');

if (!isset($_COOKIE['tg_lang'])) {
	if (preg_match('/zh/', $SERVER['HTTP_ACCEPT_LANGUAGE'])) {
		setcookie('tg_lang', 'zh', time() + 365*24*60*60, '/community/telegram');
	} else {
		setcookie('tg_lang', 'en', time() + 365*24*60*60, '/community/telegram');
	}
}

if ($_COOKIE['tg_lang'] == 'zh') {
	header('Location: ' . PATH, True, 302);
} elseif ($_COOKIE['tg_lang'] != 'en') {
	header('Location: ' . PATH . '/' . $_COOKIE['tg_lang'], True, 302);
}
?>

<?php echo file_get_contents('../../sandstone/meta.shtml'); ?>
		<title>MozTW Telegram Group</title>
		<meta property="og:title" content="MozTW Telegeam Groups">
		<meta property="og:locale" content="en">
		<meta property="og:image" content="https://moztw.org/foxmosa/images/30series/30foxmosa-12.png">
		<meta property="og:image:secure_url" content="https://moztw.org/foxmosa/images/30series/30foxmosa-12.png">
		<meta property="og:image:type" content="image/png" />
		<meta property="og:image:width" content="553" />
		<meta property="og:image:height" content="526" />
		<script src="//www.google.com/recaptcha/api.js"></script>
		<script src="https://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<?php echo file_get_contents('../../sandstone/iefix.shtml'); ?>
	</head>
	<body>
<?php echo file_get_contents('../../sandstone/header.shtml'); ?>
		<p>Change Language<select id="lang" onchange="change_lang()">
			<option value="en" selected="selected">English</option>
			<option value="zh">Chinese</option>
		</select></p>
		<div id="recaptcha">
			<p>Please click "I am not a robot"</p>
			<!-- Google reCAPTCHA -->
			<div class="g-recaptcha" data-sitekey="<?php echo SiteKey ?>" data-callback="recaptcha"></div>
		</div>

		<div id="waiting" style="display: none">
			<p>Processing, please wait...</p>
		</div>

		<div id="join" style="display: none">
			<p>Thank you very much! you can join group via following link:</p>
			<div id="links"></div>
		</div>

		<div id="error" style="display: none">
			<p>Verification failed. <a href=".">Retry</a></p>
		</div>

		<!-- Public to bots -->
		<div id="sticker" style="display: none">
			<a href="https://telegram.me/addstickers/Foxmosa" target="_blank" title="Foxmosa Telegram Sticker">Foxmosa Sticker</a>
		</div>

		<script type="text/javascript">
		function change_lang() {
			var lang = $("#lang").val();
			document.cookie = "tg_lang=" + lang;
			if (lang == "zh") {
				location.href = "<?php echo PATH; ?>";
			} else {
				location.href = "<?php echo PATH; ?>/" + lang;
			}
		}

		function recaptcha() {
			$("#recaptcha").hide();
			$("#waiting").show();

			var url = 'ajax.php?tag=en&recaptcha=' + $("#g-recaptcha-response").val();
			$.get(url, {}, function (result) {
				submit(result);
			});
		}

		function submit(json) {
			var obj = JSON.parse(json);
			if (obj.success) {
				var data = obj.data;
				showLinks(data);
				$("#waiting").hide();
				$("#join").show();
				$("#sticker").show();
			} else {
				$("#waiting").hide();
				alert("Verification failed.\nPlease retry.");
				document.location.href = ".";
				$("#error").show();
			}
		}

		function showLinks(datas) {
			var HTML = '';
			for (key in datas) {
				var data = datas[key];

				var link = 'https://telegram.me/joinchat/' + data["id"];
				var name = data["name"];
				var title = data['description'];

				HTML += '<a href="' + link + '" title="' + title + '" target="_blank">' + name + '</a><br>\n';
			}
			$("#links").html(HTML);
		}
		</script>

<?php echo file_get_contents('../../sandstone/footer.shtml'); ?>
