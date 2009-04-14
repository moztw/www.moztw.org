<?php
	/**
	 * 讀取圖片
	 *
	 * @since   2009-04-13
	 * @author  softcup
	 * @version 1.2
	 * @copyright GPL
	 **/

	define('DS', DIRECTORY_SEPARATOR);

	$chroot = dirname(__FILE__) . DS;
	$preimg = dirname(__FILE__) . DS . 'eventpic.txt';
	$imgext = array(
		'gif' => 'image/gif',
		'png' => 'image/png',
		'jpg' => 'image/jpeg'
	);

	/**
	 * 取得今天要顯示的圖片
	 * @return 圖片的完整路徑 (含檔名)
	 *     FALSE: 找不到圖片
	 **/
	function getTodayImage($orgimg) {
		global $chroot, $imgext;

		$dir = $chroot;
		$now = date('Ymd');

		$imglst = array();
		foreach (array_keys($imgext) as $ext) {
			foreach (glob($dir . "*.{$ext}") as $filename) {
				$name = basename($filename, ".{$ext}");
				if (!is_numeric($name) || (strlen($name) != 8)) continue;
				if (strcmp($now, $name) < 0) continue;

				$imglst[$name] = $filename;
			}
		}

		if (count($imglst) <= 0) {
			setCache($orgimg);
			return FALSE;
		} else {
			krsort($imglst);
			$img = array_shift($imglst);
			setCache($img);
			return $img;
		}
	}

	function setCache($fname) {
		global $preimg;

		touch($preimg);
		$fp = fopen($preimg, 'w');
		if ($fp) {
			fwrite($fp, date('Y-m-d') . "\n");
			fwrite($fp, $fname);
			fclose($fp);
		}
	}

	/*
	$fp = @fopen($preimg, 'r');
	if ($fp) {
		$update = trim(fgets($fp, 4096));
		$img = trim(fgets($fp, 4096));
		fclose($fp);

		$now = date('Y-m-d');
		if ( ($update != $now) || (strpos($orgimg, $chroot) !== 0) || !file_exists($orgimg) ) {
			$newimg = getTodayImage($img);
			if ($newimg !== false) {
				$img == $newimg;
			}
		}
	} else {
		$img = getTodayImage('');
	}
	*/

	$img = getTodayImage('');

	if (empty($img)) {
		header("HTTP/1.0 404 Not Found");
		die();
	} else {
		$type = $imgext['gif'];
		$key = array_pop(explode('.', basename($img)));
		if (array_key_exists($key, $imgext)) {
			$type = $imgext[$key];
		} else {
			$type = $imgext['gif'];
		}

		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Pragma: no-cache');
		header('Expires: 0');
		header('Content-Type: ' . $type);
		header('Content-Transfer-Encoding: binary');
		header('Content-Disposition: filename=' . basename($img));
		header('Content-Length: ' . filesize($img));
		readfile($img);
		die();
	}
?>
