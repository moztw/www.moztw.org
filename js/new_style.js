/*global jQuery */

jQuery(function ($) {
	'use strict';
	
	var $menu = $('#nav-main');

	$menu.on('click', function () {
		$menu.toggleClass('open');
	});

	$menu.on('click', '#nav-main-menu', function () {
		return false;
	});

	$menu.on('click', 'a', function () {
		location.href = $(this).attr('href');
		return;
	});
});
