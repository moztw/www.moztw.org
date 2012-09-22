var I18n = function(options){
	var setting = {
		default: 'zh-TW',
		baseUrl: 'languages/',
		languages: [
			'en-US'
		]
	},
	that;

	if(options){
		for(var i in setting){
			if(options.hasOwnProperty(i)){
				setting[i] = options[i];
			}
		}
	}

	function changeLanguage(lan, fc){
		loadFile(lan, fc);
	};

	function loadFile(language, fc){
		$.get(setting.baseUrl + language + '.json', function(data){
		
			that = {
				get: function(key){
					return data.hasOwnProperty(key)? data[key]: null;
				},
				changeLanguage: changeLanguage
			};
			
			fc(that);

		}).error(function(){
			console.log('語言檔載入失敗');
		});
	};

	loadFile(setting.default, function(that){
		
	});

};
