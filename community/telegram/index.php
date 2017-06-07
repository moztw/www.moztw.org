<?php
require('config.php');

if (!isset($_COOKIE['tg_lang'])) {
	if (preg_match('/zh/', $_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
		setcookie('tg_lang', 'zh', time() + 365*24*60*60, PATH);
	} else {
		setcookie('tg_lang', 'en', time() + 365*24*60*60, PATH);
	}
}

if ($_COOKIE['tg_lang'] != 'zh') {
	header('Location: ' . PATH . '/' . $_COOKIE['tg_lang'], True, 302);
}
?>

<?php echo file_get_contents('../../sandstone/meta.shtml'); ?>
		<title>MozTW Telegram Group</title>
		<meta property="og:title" content="MozTW Telegeam Groups">
		<meta property="og:locale" content="zh_TW">
		<meta property="og:image" content="https://moztw.org/foxmosa/images/30series/30foxmosa-12.png">
		<meta property="og:image:secure_url" content="https://moztw.org/foxmosa/images/30series/30foxmosa-12.png">
		<meta property="og:image:type" content="image/png" />
		<meta property="og:image:width" content="553" />
		<meta property="og:image:height" content="526" />
		<script src="//www.google.com/recaptcha/api.js"></script>
		<script src="//code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" media="all" href="/css/telegram.css">
<?php echo file_get_contents('../../sandstone/iefix.shtml'); ?>
	</head>
	<body>
<?php echo file_get_contents('../../sandstone/header.shtml'); ?>
  <div id="wrap">
		<div id="recaptcha">
			<p>為了防止廣告機器人進入群組，麻煩您點選下面的「我不是機器人」</p>
			<!-- Google reCAPTCHA -->
			<div class="g-recaptcha" data-sitekey="<?php echo SiteKey ?>" data-callback="recaptcha"></div>
		</div>

		<div id="waiting" style="display: none">
			<p>處理中，請稍候..</p>
		</div>

		<div id="join" style="display: none">
			<p>非常感謝您的配合，加入連結：</p>
			<div id="links"></div>
		</div>

		<div id="error" style="display: none">
			<p>驗證失敗，<a href=".">點我重試</a></p>
		</div>

		<!-- Public to bots -->
		<div id="sticker" style="display: none">
			<a href="https://telegram.me/addstickers/Foxmosa" target="_blank" title="Foxmosa Telegram 貼圖">Foxmosa 貼圖</a>
			<div>Foxmosa 狐爾摩莎（小莎）的 Telegram 貼圖。</div>
		</div>
		<div id="fullList" style="display: none; margin-top: 20px;">
			<a href="https://wiki.mozilla.org/Telegram" target="_blank" >更多 Mozilla 相關 Telegram 頻道</a>
		</div>

		<p>切換語言 <select id="lang" onchange="change_lang()">
			<option value="zh" selected="selected">Chinese</option>
			<option value="en">English</option>
		</select></p>

		<script type="text/javascript">
		function change_lang() {
			var lang = $("#lang").val();
			document.cookie = "tg_lang=" + lang;
			if (lang == "zh") {
				location.href = "<?php echo PATH; ?>";
			} else {
				location.href = "<?php echo PATH; ?>" + "/" + lang;
			}
		}

		function recaptcha() {
			$("#recaptcha").hide();
			$("#waiting").show();

			var url = 'ajax.php?recaptcha=' + $("#g-recaptcha-response").val();
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
				$("#fullList").show();
			} else {
				$("#waiting").hide();
				alert("驗證失敗\n麻煩您再試一次");
				document.location.href = ".";
				$("#error").show();
			}
		}

		function showLinks(datas) {
			var HTML = '';
			for (var key in datas) {
				var data = datas[key];
        if (data.id.match(/^@/)) {
				  var link = 'https://telegram.me/' + data.id.replace('@','');
        } else {
          var link = 'https://telegram.me/joinchat/' + data.id;
        }
				var name = data.name;
				var title = data.description;
				var introduction = data.introduction;
				HTML += '<a href="' + link + '" title="' + title + '" target="_blank">' + name + '</a><div>' + introduction + '</div><br>\n';
			}
			$("#links").html(HTML);
		}
		</script>
	</div>

<?php echo file_get_contents('../../sandstone/footer.shtml'); ?>
