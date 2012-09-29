'use strict';
(function(window, $){

/**
 * events: change, beforeChange, error
 */

var i18n = function(options, main){
	var setting = {
		default: 'zh-TW',
		baseUrl: 'languages/',
		languages: {
			'zh-TW': '中文 (繁體)',
			'zh-CN': '中文 (簡體)',
			'en-US': 'English'
		}
	},
	current = window.navigator.userLanguage || window.navigator.language,
	message,
	that,
	cache = {},
	$e = $('<div>');

	if(typeof options === 'function'){
		main = options;
		options = null;
	}

	if(options){
		for(var i in setting){
			if(options.hasOwnProperty(i)){
				setting[i] = options[i];
			}
		}
	}
	
	current = setting.languages.hasOwnProperty(current)? current: setting.default;

	that = {
		init: function(){
			loadFile(current);
		},
		getMessage: function(key){
			return message.hasOwnProperty(key)? message[key]: null;
		},
		changeLanguage: function(lan){
			$e.trigger('beforeChange', current, lan);
			loadFile(lan);
		},
		update: function(selecter, datakey){
			var ele = $(selecter);
			ele.each(function(){
				var $this = $(this),
				msg;

				if(! datakey){
					if(! $this.data('i18nkey')){
						$this.data('i18nkey', $this.text());	
					}
					msg = that.getMessage($this.data($this.data('i18nkey')));
				}else{
					msg = that.getMessage($this.data(datakey));
				}

				if(msg){
					$this.text(msg);
				}
			});
		},
		on: function(name, fc){
			$e.bind(name, fc);
		}
	};

	function loadFile(language){
		$.get(setting.baseUrl + language + '.json', function(data){
			message = data;
			current = language;
			$e.trigger('change', that);
		}).error(function(){
			$e.trigger('error');
			//console.log('語言檔載入失敗');
		});
	};
	
	return function(){
		var args = Array.prototype.slice.call(arguments);
		args.push(that);
		main.apply(this, args);
	};
};

window.i18n = i18n;

})(window, jQuery);
