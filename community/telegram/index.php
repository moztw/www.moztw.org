<?php
define('SiteKey', '6LdlOxYTAAAAALp47v-OJ69P3s1fuOPsR987xpGO');
?>

<html>
	<head>
		<meta charset="utf-8"></meta>
		<title>MozTW Telegram Group</title>
		<meta property="og:title" content="MozTW Telegeam Group"></meta>
		<meta property="og:image" content="https://moztw.org/foxmosa/images/30series/30foxmosa-12.png"></meta>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
		<script src="//www.google.com/recaptcha/api.js"></script>
		<script src="https://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
	</head>
	<body>
		<div id="recaptcha">
			<p>為了防止廣告機器人進入群組，麻煩您點選下面的「我不是機器人」</p>
			<!-- Google reCAPTCHA -->
			<div class="g-recaptcha" data-sitekey="<?php echo SiteKey ?>"></div><br />
			<input type="button" value="Submit" onclick="recaptcha()"></input>
		</div>

		<div id="waiting" style="display: none">
			<p>處理中，請稍候..</p>
		</div>

		<div id="join" style="display: none">
			<p>非常感謝您的配合，加入連結：</p>
			<div id="link"></div>
		</div>

		<div id="error" style="display: none">
			<p>驗證失敗，<a href=".">點我重試</a></p>
		</div>

		<script type="text/javascript">
		function recaptcha() {
			$("#recaptcha").hide();
			$("#waiting").show();
			var url = 'ajax.php?recaptcha=' + $("#g-recaptcha-response").val();
			$.get(url, {}, function (result) {
				show(result);
			});
		}
		
		function show(json) {
			var obj = JSON.parse(json);
			if (obj.success) {
				var data = obj.data;
				var theHtml = '';
				for (key in data) {
					var link = 'https://telegram.me/joinchat/' + data[key].trim();
					theHtml += '<a href="' + link + '">' + key + '</a><br>\n';
				}
				$("#link").html(theHtml);
				$("#waiting").hide();
				$("#join").show();
			} else {
				alert("驗證失敗\n麻煩您再試一次");
				document.location.href = ".";
				$("#waiting").hide();
				$("#error").show();
			}
		}
		</script>
	</body>
</html>
