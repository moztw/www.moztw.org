'use strict';
(function(window, $){

/**
 * events: change, beforeChange, error
 */

var l10n = function(options, main){
	var setting = {
		default: 'en-US',
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
					if(! $this.data('l10nkey')){
						$this.data('l10nkey', $this.text());	
					}
					msg = that.getMessage($this.data($this.data('l10nkey')));
				}else{
					msg = that.getMessage($this.data(datakey));
				}

				if(msg){
					$this.html(msg);
				}
			});
		},
		on: function(name, fc){
			$e.bind(name, fc);
		}
	};

	function loadFile(language){
		//console.log(language);
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

window.l10n = l10n;

})(window, jQuery);
