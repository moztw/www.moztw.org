var PicWall = (function(ele, picList, options){
	
	var that = this,
	eventTarget = $('<div>'),
	setting = {
		gridWidth: 225,
		baseUrl: 'images/foxmosa/'
	},
	grid = [];

	if(options){
		for(var i in setting){
			if(options.hasOwnProperty(i)){
				setting[i] = options[i];
			}
		}
	}

	that.setting = setting;
	
	ele.css('margin-left', '0px');

	function random(min, max){
		return Math.floor(Math.random()*(max-min+1)+min);	
	};

	function preLoad(list, fc){
		var counter = 0;
		for(var i in list){
			$('<img>').attr('src', setting.baseUrl + list[i]).on('load', function(){
				if(++counter >= list.length){
					//console.log('圖片預載成功');
					fc();
					eventTarget.trigger('load'); 
				}
			}).error(function(){
				//alert('圖片載入失敗');
				//console.error('圖片載入失敗');
				eventTarget.trigger('error'); 
			});
		}
	};

	function reSize(){
		var width = ele.width(),
		len = Math.round(width / setting.gridWidth),
		gridWidth = width / len;

		grid = [];

		//console.log('數目：' + len);
		//console.log('寬度：' + gridWidth);

		for(var i = 0; i < len; i++){
			grid.push(new Grid(i, picList, {
				width: gridWidth
			}));
			ele.append(grid[i].getJqueryElement());
		}

		eventTarget.trigger('afterResize'); 
	};

	var Grid = function(id, list, options){
		var setting = {
			width: 200
		},
		pics = [],
		ele = $('<div>').addClass('picwall-grid'),
		layout = [
			['0,0|0.5,1', '0.5,0|0.5,0.5', '0.5,0.5|0.5,0.5'],
			['0,0|1,0.5', '0,0.5|0.5,0.5', '0.5,0.5|0.5,0.5'],
			['0.5,0|0.5,1', '0,0|0.5,0.5', '0,0.5|0.5,0.5'],
			['0,0.5|1,0.5', '0,0|0.5,0.5', '0.5,0|0.5,0.5']
		];
	
		if(options){
			for(var i in setting){
				if(options.hasOwnProperty(i)){
					setting[i] = options[i];
				}
			}
		}

		ele.css({
			width: setting.width,
			height: setting.width
		});

		(function(){
			var l = layout[id % layout.length],
			regex = /^([\d\.]+),([\d\.]+)\|([\d\.]+),([\d\.]+)$/,
			index,
			match;

			for(var j = 0; j < 3; j++){
				index = (id * 3 + j) % list.length;
				match = l[j].match(regex);
				
				pics.push(new Pic(list[index], {
					left: parseFloat(match[1], 10) * setting.width,
					top: parseFloat(match[2], 10) * setting.width,
					width: parseFloat(match[3], 10) * setting.width,
					height: parseFloat(match[4], 10) * setting.width
				}));
				ele.append(pics[j].getJqueryElement());
			}
		})();

		return {
			getJqueryElement: function(){
				return ele;
			},
			pics: pics
		};
	};

	var Pic = function(url, options){
		var ele = $('<div>').addClass('picwall-pic'),
		setting = {
			width: 50,
			height: 50,
			top: 0,
			left: 0
		},
		change = false;

		if(options){
			for(var i in setting){
				if(options.hasOwnProperty(i)){
					setting[i] = options[i];
				}
			}
		}
		
		ele.css({
			background: 'url(' + (that.setting.baseUrl + url) + ') center center',
			top: setting.top,
			left: setting.left,
			width: setting.width - 4,
			height: setting.height - 4
		}).attr('href', that.setting.baseUrl + url);

		return {
			getJqueryElement: function(){
				return ele;
			},
			change: function(url){
				if(change) return false;
				change = true;
				ele.fadeTo(500, 0, function(){
					ele.css('background', 'url(' + (that.setting.baseUrl + url) + ') center center').fadeTo(500, 1, function(){
							change = false;
						}).attr('href', that.setting.baseUrl + url);
				})
			}
		};
	};

	preLoad(picList, function(){
		
		reSize();
		ele.resize(function(){
			reSize();
		});

	});

	return {
		change: function(){
			for(var i in grid){
				grid[i].pics[random(0, 2)].change(picList[random(0, picList.length - 1)]);
			}
			return this;
		},
		on: function(e, handler){
			eventTarget.bind(e, handler); 
			return this;
		},
		grid: {
			on: function(e, handler){
				ele.children('div').children('div').on(e, handler);
				return this;
			}
		}
	};

});
