var FOX = {};

FOX.functions = {
	getOffset: function(e){
		return {x: e.pageX - FOX.offset.left, y: e.pageY - FOX.offset.top};
	},
	getPositiveNumber: function(n){
		return n < 0? n * -1: n;
	},
	p2l: function(x, y, x1, y1){
		return function(xi){
			return (x1 - x) / (y1 - y) * (xi - x) + y;
		};
	},
	rotate: function(k, ax, ay, x, y){
		k =  k * Math.PI / 180;
		x = (ax - x) * Math.cos(k) - (ay - y) * Math.sin(k) + x;
		y = (ax - x) * Math.sin(k) + (ay - y) * Math.cos(k) + y;
		//console.log(ay, y);
		return {x:x, y:y};
	}
};

FOX.LayerCorner = function(updateFunc){
	
	var attrs = {
		x: 0,
		y: 0
	};
	
	function get(key){
		return attrs.hasOwnProperty(key)? attrs[key]: null;
	};
	
	function set(key, val){
		attrs[key] = val;
		return this;
	};
	
	function updatePosition(x, y){
		var offset = updateFunc(x, y);
		attrs.x = offset.x;
		attrs.y = offset.y;
	};
	
	return {
		get: get,
		set: set,
		updatePosition: updatePosition
	};	
};

FOX.ActiveAnchor = function(name, updateFunc, width, color){
	var attrs = {
		x: 0,
		y: 0,
		name: name
	},
	canvas = document.createElement("canvas"),
	ctx = canvas.getContext("2d"),
	image = new Image();
	
	canvas.width = width;
	canvas.height = width;
	
	ctx.lineWidth = 1;
	ctx.strokeStyle = color;
	ctx.fillStyle = '#FFF';
	
	ctx.globalAlpha = 0.5;
	ctx.fillRect(1, 1, width - 2, width - 2);
	ctx.globalAlpha = 1;
	ctx.strokeRect(1, 1, width - 2, width - 2);
	
	image.src = canvas.toDataURL("image/png");
	
	function updatePosition(x, y){
		var offset = updateFunc(x, y);
		attrs.x = offset.x;
		attrs.y = offset.y;
	};
	
	function get(key){
		return attrs.hasOwnProperty(key)? attrs[key]: null;
	};
	
	function set(key, val){
		attrs[key] = val;
		return this;
	};
	
	function getImage(){
		return image;
	};
	
	function clicked(offset){
		var data = ctx.getImageData(
			offset.x - attrs.x - width / 2, 
			offset.y - attrs.y, 
			1, 1);
		return data.data[0] + data.data[1] + data.data[2] + data.data[3] > 0;
	};
	
	return {
		get: get,
		set: set,
		getImage: getImage,
		updatePosition: updatePosition,
		clicked: clicked
	};
};

FOX.Layer = function(type, image, dx, dy){
	
	var attrs = {
		x: dx,
		y: dy,
		type: 'body',
		mouseDownOffset: {x: 0, y: 0},
		mouseDownRotate: 0,
		active: -1,
		rotate: 0
	},
	canvas = document.createElement("canvas"),
	ctx = canvas.getContext("2d"),
	anchorWidth = 15,
	selected = false;

	canvas.width = image.width;
	canvas.height = image.height;
	
	ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
	
	//$('body').append($(canvas).css('border', '1px #CCC solid'));
	
	attrs.corner = {
		lt: new FOX.LayerCorner(function(lx, ly){
			return {x: lx, y: ly};
		}),
		rt: new FOX.LayerCorner(function(lx, ly){
			return {x: lx + canvas.width, y: ly};
		}),
		lb: new FOX.LayerCorner(function(lx, ly){
			return {x: lx, y: ly + canvas.height};
		}),
		rb: new FOX.LayerCorner(function(lx, ly){
			return {x: lx + canvas.width, y: ly + canvas.height};
		})
	};
	
	attrs.anchors = [
		// 四個角落
		new FOX.ActiveAnchor('lt', function(lx, ly){
			return {x: lx - anchorWidth / 2, y: ly - anchorWidth / 2};
		}, anchorWidth, '#333'),
		new FOX.ActiveAnchor('rt', function(lx, ly){
			return {x: lx + canvas.width - anchorWidth / 2, y: ly - anchorWidth / 2};
		}, anchorWidth, '#333'),
		new FOX.ActiveAnchor('lb', function(lx, ly){
			return {x: lx - anchorWidth / 2, y: ly + canvas.height - anchorWidth / 2};
		}, anchorWidth, '#333'),
		new FOX.ActiveAnchor('rb', function(lx, ly){
			return {x: lx + canvas.width - anchorWidth / 2, y: ly + canvas.height - anchorWidth / 2};
		}, anchorWidth, '#333'),
		
		// 中點
		new FOX.ActiveAnchor('ct', function(lx, ly){
			return {x: lx + canvas.width / 2 - anchorWidth / 2, y: ly - anchorWidth / 2};
		}, anchorWidth, '#333'),
		new FOX.ActiveAnchor('cr', function(lx, ly){
			return {x: lx + canvas.width - anchorWidth / 2, y: ly + canvas.height / 2 - anchorWidth / 2};
		}, anchorWidth, '#333'),
		new FOX.ActiveAnchor('cb', function(lx, ly){
			return {x: lx + canvas.width / 2 - anchorWidth / 2, y: ly + canvas.height - anchorWidth / 2};
		}, anchorWidth, '#333'),
		new FOX.ActiveAnchor('cl', function(lx, ly){
			return {x: lx - anchorWidth / 2, y: ly + canvas.height / 2 - anchorWidth / 2};
		}, anchorWidth, '#333'),
		
		// 旋轉點
		/**
		new FOX.ActiveAnchor('ltr', function(lx, ly){
			return {x: lx - anchorWidth * 2.5, y: ly - anchorWidth * 2.5};
		}, anchorWidth * 2, '#999'),
		new FOX.ActiveAnchor('rtr', function(lx, ly){
			return {x: lx + canvas.width + anchorWidth / 2, y: ly - anchorWidth * 2.5};
		}, anchorWidth * 2, '#999'),
		new FOX.ActiveAnchor('lbr', function(lx, ly){
			return {x: lx - anchorWidth * 2.5, y: ly + canvas.height + anchorWidth / 2};
		}, anchorWidth * 2, '#999'),
		new FOX.ActiveAnchor('rbr', function(lx, ly){
			return {x: lx + canvas.width + anchorWidth / 2, y: ly + canvas.height + anchorWidth / 2};
		}, anchorWidth * 2, '#999'),
		**/
	];
	
	updateActiveAnchor();
	updateLayerCorner();
	
	function activeAnchorClicked(offset){
		var i;
		for(i in attrs.anchors){
			if(attrs.anchors[i].clicked(FOX.functions.rotate(attrs.rotate, offset.x, offset.y, attrs.x + canvas.width / 2, attrs.y + canvas.height / 2))){
				attrs.active = attrs.anchors[i].get('name');
				attrs.mouseDownRotate = Math.atan2((attrs.corner.lt.get('y') + attrs.corner.rb.get('y')) / 2 - offset.y, (attrs.corner.lt.get('x') + attrs.corner.rb.get('x')) / 2 - offset.x) * 180 / Math.PI;
				//console.log(attrs.mouseDownRotate);
				return true;
				break;
			}
		}
		return false;
	};
	
	function clicked(offset){
		
		var roffset = FOX.functions.rotate(attrs.rotate, offset.x, offset.y, attrs.x + canvas.width / 2, attrs.y + canvas.height / 2);
		var re, data = ctx.getImageData(
			roffset.x - attrs.x, 
			roffset.y - attrs.y, 
			1, 1),
			re = data.data[0] + data.data[1] + data.data[2] + data.data[3] > 0;
		
		if(re){
			attrs.mouseDownOffset = {
				x: offset.x - attrs.x,
				y: offset.y - attrs.y
			};
		}
		
		return re;
		
	};
	
	function updateActiveAnchor(){
		for(i in attrs.anchors){
			attrs.anchors[i].updatePosition(attrs.x, attrs.y);
		}
	};
	
	function updateLayerCorner(){
		for(i in attrs.corner){
			attrs.corner[i].updatePosition(attrs.x, attrs.y);
		}
	};
	
	function getImage(){
		return image;
	};
	
	function getWidth(){
		return canvas.width;
	};
	
	function getHeight(){
		return canvas.height;
	};
	
	function get(key){
		return attrs.hasOwnProperty(key)? attrs[key]: null;
	};
	
	function set(key, val){
		attrs[key] = val;
		return this;
	};
	
	function getAnchorWidth(){
		return anchorWidth;
	};
	
	function setPosition(x, y){
		if(x !== false) attrs.x = x;
		if(y !== false) attrs.y = y;
		updateActiveAnchor();
		updateLayerCorner();
	};
	
	function setSize(width, height){
		if(width !== false) canvas.width = width < 0? 0: width;
		if(height !== false) canvas.height = height < 0? 0: height;
		ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
	};
	
	return {
		getImage: getImage,
		getWidth: getWidth,
		getHeight: getHeight,
		get: get,
		set: set,
		getAnchorWidth: getAnchorWidth,
		setPosition: setPosition,
		clicked: clicked,
		activeAnchorClicked: activeAnchorClicked,
		setSize: setSize
	};
	
};

FOX.layerFactory = function(type, image){
	var typeEnum = {
		'body': 0,
		'head': 1,
		'tail': 2
	};
	if(typeof typeEnum[type] !== 'number') ;//console.log('type 不存在 ');
	return FOX.Layer(typeEnum[type], image, arguments[2], arguments[3]);
};

FOX.Canvas = function($canvas, canvasWidth, canvasHeight, global){
	
	var that = this,
	layers = [],
	ctx = $canvas[0].getContext("2d"),
	select = null,
	drag = false,
	cursorType = 0,
	source,
	beforeupdate = [],
	cursors = [
		'images/cursor/left_ptr.png',
		'images/cursor/top_left.png',
		'images/cursor/top_right.png',
		'images/cursor/bottom_right.png',
		'images/cursor/bottom_left.png',
		'images/cursor/move.png',
		'images/cursor/top_left_corner.png',
		'images/cursor/top_right_corner.png',
		'images/cursor/bottom_left_corner.png',
		'images/cursor/bottom_right_corner.png'
	];
	
	$canvas.css({
		'-moz-user-select': '-moz-none', 
		'-khtml-user-select': 'none',
		'-webkit-user-select': 'none', 
		'-o-user-select': 'none',
		'user-select': 'none'
	});
	
	$canvas[0].width = canvasWidth;
	$canvas[0].height = canvasHeight;
	
	$('body').keydown(function(e){
		if(e.keyCode === 27 && typeof select === 'number'){
			layers.pop();
			select = null;
			update();
		}
	});
	
	FOX.offset = $canvas.offset();
	
	$canvas.on('mousedown touchstart', function(e){
		mousedown(e);
	});
	$canvas.on('mousemove', function(e){
		mousemove(e);
	});
	$canvas.on('mouseup', function(e){
		mouseup(e);
	});
	
	function init(baseUrl, images, callback){
		var loadedImages = 0,
		loaded = [],
		image,
		length = 0;
		
		for(var i in images) length += images[i].length;
		
		for(i in images){
			loaded[i] = {};
			for(var j in images[i]){
				image = new Image();
				image.onload = function(){
					//console.log('preload: ' + (loadedImages + 1) + '/' + length);
					if(++loadedImages >= length){
						//console.log('圖片載入完成');
						source = loaded;
						callback(loaded);
					}
				};
				image.src = baseUrl+images[i][j];
				loaded[i][j] = image;
			}
		}
	};

	function createLayers(images){
		for(var i in images){
			for(var j in images[i]){
				layers.push(FOX.layerFactory(i, images[i][j]));
			}
		}
		update();
	};

	function createLayer(type, index, x, y){
		layers.push(FOX.layerFactory(type, source[type][index], x, y));
		update();
	};
	
	function update(){
		var i = 0, l, anchors, j, corner,
		tmpx, tmpy;
		
		ctx.clearRect( 0, 0, canvasWidth, canvasHeight);
		
		for(var j in beforeupdate){
			beforeupdate[j](ctx);
		}
		
		for(; i < layers.length; i++){
			l = layers[i];
			corner = l.get('corner');
			anchors = l.get('anchors');
			tmpx = (corner.lt.get('x') + corner.rb.get('x')) / 2;
			tmpy = (corner.lt.get('y') + corner.rb.get('y')) / 2;
			
			ctx.save();
			
			ctx.translate(tmpx, tmpy);
			ctx.rotate(l.get('rotate') * Math.PI / 180);
			ctx.drawImage(l.getImage(), l.get('x') - tmpx, l.get('y') - tmpy, l.getWidth(), l.getHeight());
			//console.log(i);
			if(typeof select === 'number' && i === layers.length - 1){
				ctx.strokeStyle = '#999';
				ctx.strokeRect(l.get('x') - tmpx, l.get('y') - tmpy, l.getWidth(), l.getHeight());
				
				var image;
				
				for(j in anchors){
					image = anchors[j].getImage();
					ctx.drawImage(image, anchors[j].get('x') - tmpx, anchors[j].get('y') - tmpy, image.width, image.height);
				}
			}
			
			ctx.translate(-tmpx, -tmpy);
			ctx.restore();
		}

		var txt = ['cc: by-nc-sa 3.0 tw', 'http://moztw.org/foxmosa/creater'];
		ctx.font = "12px Arial";
		ctx.fillStyle = '#000000';
		for(i in txt){
			measureText = ctx.measureText(txt[i]);
			ctx.fillText(txt[i], canvasWidth - measureText.width - 10, canvasHeight - 10 - (txt.length - i - 1) * 16);
		}
	};
	
	// 滑鼠事件
	var mousedown = mousedownWhenHasNoteSelected;
	
	function mousedownWhenHasSelected(e){
		var l = layers[layers.length - 1],
		offset = FOX.functions.getOffset(e),
		i = layers.length,
		s = false;

		drag = true;

		if(l.activeAnchorClicked(offset)){
			select = 2;
		}else{
			
			for(;i--;){
				if(layers[i].clicked(offset)){
					//console.log('選取了 ' + i);
					layers = layers.slice(0, i).concat(layers.slice(i+1, layers.length)).concat(layers.slice(i, i+1));
					select = 1;
					update();
					s = true;
					break;
				}
			}
			
			if(! s){
				select = null;
				update();
				mousedown = mousedownWhenHasNoteSelected;
			}
		}
	
	};
	
	function mousedownWhenHasNoteSelected(e){
		var i = layers.length,
		offset = FOX.functions.getOffset(e);
		
		drag = true;
		//console.dir(offset);
		for(;i--;){
			//console.log(layers[i].clicked(offset));
			if(layers[i].clicked(offset)){
				//console.log('選取了 ' + i);
				layers = layers.slice(0, i).concat(layers.slice(i+1, layers.length)).concat(layers.slice(i, i+1));
				select = 1;
				update();
				mousedown = mousedownWhenHasSelected;
				break;
			}
		}
	};
	
	function mousemove(e){
		if(select === 1 && drag){
			var l = layers[layers.length-1],
			mouseDownOffset = l.get('mouseDownOffset'),
			corner = l.get('corner'),
			offset = FOX.functions.getOffset(e);
			l.setPosition(offset.x - mouseDownOffset.x, offset.y - mouseDownOffset.y);
			//console.log(corner.lt.get('x'), corner.lt.get('y'), corner.rb.get('x'), corner.rb.get('y'));
			update();
		}else if(select === 2 && drag){
			var l = layers[layers.length-1],
			offset = FOX.functions.getOffset(e),
			corner = l.get('corner'),
			mouseDownOffset = l.get('mouseDownOffset'),
			mouseDownRotate = l.get('mouseDownRotate');

			switch(l.get('active')){
			case 'lt':
				l.setSize(corner.rb.get('x') - offset.x, corner.rb.get('y') - offset.y);
				l.setPosition(offset.x, offset.y);
				break;
			case 'rt':
				l.setSize(offset.x - corner.lb.get('x'), corner.rb.get('y') - offset.y);
				l.setPosition(offset.x - l.getWidth(), offset.y);
				break;
			case 'lb':
				l.setSize(corner.rb.get('x') - offset.x, offset.y - corner.rt.get('y'));
				l.setPosition(offset.x, offset.y - l.getHeight());
				break;
			case 'rb':
				l.setSize(offset.x - corner.lb.get('x'), offset.y - corner.rt.get('y'));
				l.setPosition(offset.x - l.getWidth(), offset.y - l.getHeight());
				break;
				
			case 'ct':
				l.setSize(false, corner.rb.get('y') - offset.y);
				l.setPosition(false, offset.y);
				break;
			case 'cr':
				l.setSize(offset.x - corner.lb.get('x'), false);
				l.setPosition(offset.x - l.getWidth(), false);
				break;
			case 'cb':
				l.setSize(false, offset.y - corner.rt.get('y'));
				l.setPosition(false, offset.y - l.getHeight());
				break;
			case 'cl':
				l.setSize(corner.rb.get('x') - offset.x, false);
				l.setPosition(offset.x, false);
				break;
				
			case 'ltr':
			case 'rtr':
			case 'lbr':
			case 'rbr':
				l.set('rotate', Math.atan2((corner.lt.get('y') + corner.rb.get('y')) / 2 - offset.y, (corner.lt.get('x') + corner.rb.get('x')) / 2 - offset.x) * 180 / Math.PI - mouseDownRotate);
				break;
			}
			
			update();
		}
	};
	
	function mouseup(){
		drag = false;
	};
	
	function save(){
		$canvas[0].toBlob(function(blob) {
			saveAs(
				  blob
				, "foxmosa.png"
			);
		}, "image/png");
	};

	function parts($parts){
		var $ul = $('<ul>'), tmp, tmp2, i, j,
		$ctrl = $('<a class="prev pctrl" href=""><</a><a class="next pctrl" href="">></a>');
		for(i in source){
			tmp = $('<li>').data('picType', i);
			tmp2 = $('<ul>');
			for(j in source[i]){
				tmp2.append($('<li>').data('picIndex', j).append($(source[i][j]).clone()));
			}
			$ul.append(tmp.append(tmp2, $ctrl.clone()));
		}
		$parts.append($ul);
	};
	
	return {
		init: init,
		parts: parts,
		save: save,
		update: update,
		createLayer: createLayer,
		beforeUpdate: function(func){
			if(typeof func === 'function'){
				beforeupdate.push(func);
			}
		}
	};

};

var switchp = function(){
	return function($obj){
		var $btns = {
			next: $obj.find('.next'),
			prev: $obj.find('.prev')
		},
		$images = $obj.find('li'),
		len = $images.length - 1,
		current = 0;
		
		function show(index){
			$images.eq(index).stop(false, true).fadeIn('fast');
			$images.eq(current).stop(false, true).fadeOut('fast');
			current = index;
		};
		
		$btns.next.click(function(){
			show(current + 1 > len? 0: current + 1);
			return false;
		});
		
		$btns.prev.click(function(){
			show(current - 1 < 0? len: current - 1);
			return false;
		});
		
		return $btns;
	}
}('.next', '.prev');

var colorSelecter = function($container, width, height){
	var canvas = document.createElement("canvas"),
	$canvas = $(canvas),
	offset = $container.offset(),
	ctx = canvas.getContext("2d"),
	grd = ctx.createLinearGradient(0, 0, width, height),
	colors = [],
	btns = [],
	selecters = [],
	clicked = false,
	onchange;
	
	$canvas[0].width = width;
	$canvas[0].height = height;
	
	grd.addColorStop(0, "#000");
	grd.addColorStop(0.3, "#FFF");
	grd.addColorStop(0.3, "#FF0000");
	grd.addColorStop(0.6, "#00FF00");
	grd.addColorStop(1, "#0000FF");
	
	ctx.fillStyle = grd;
	ctx.fillRect(0, 0, width, height);
	
	$container.append($canvas);
	
	var counter = function(){
		var c = 0;
		return function(){
			return c++;
		};
	}();

	$(window).on('mousemove', function(e){
		if(typeof clicked === 'number'){
			var x = getOffset(e).x;
			x = x > width? width: (x < 0? 0: x);
			btns[clicked].css('left', x + 'px');
		}
	}).on('mouseup', function(e){
		if(typeof clicked === 'number'){
			var data = ctx.getImageData(getOffset(e).x, 0, 1, 1).data;//console.log(data);
			colors[clicked] = 'rgba('+data[0]+', '+data[1]+', '+data[2]+', 1)';
			clicked = false;
			if(typeof onchange === 'function'){
				onchange(colors);
			}
		}
	});
	
	function getOffset(e){
		return {x: e.pageX - offset.left, y: e.pageY - offset.top};
	};
	
	function btnClicked(){
		clicked = parseInt($(this).data('btnindex'), 10);
	};
	
	return {
		e: canvas,
		selecters: selecters,
		addBtn: function(){
			var $cs = $('<a class="csbtn"></a>'),
			id = counter();
			$cs.on('mousedown', btnClicked);
			$cs.data('btnindex', id);
			btns.push($cs);
			colors.push('rgba(255, 255, 255, 1)');
			$canvas.after($cs);
			$s = {
				getColor: function(){
					return colors[id];
				}
			}
			selecters.push($s);
			return $s;
		},
		onChange: function(func){
			if(typeof func === 'function'){
				onchange = func;
			}
		}
	};
};

jQuery(function($){
	
	var canvas = $('#canvas'),
	$parts = $('#parts'),
	Foxmosa = new FOX.Canvas(canvas, 600, 300, this);
	Foxmosa.init('images/foxmosa/', {
		body: ['1.png', '2.png'],
		head: ['4.png','6.png','7.png','8.png','9.png','10.png'],
		tail: ['3.png','5.png']
	}, function(images){
		
		Foxmosa.createLayer('body', 0, 275, 110);
		Foxmosa.createLayer('head', 0, 250, 50);
		Foxmosa.createLayer('tail', 1, 233, 148);

		Foxmosa.parts($parts);

		$('#parts > ul > li li > img').click(function(){
			var $this = $(this).parent('li');
			//console.log($this.parent('ul').data('picType'), $this.data('picIndex'));
			Foxmosa.createLayer($this.parent('ul').parent('li').data('picType'), $this.data('picIndex'), 0, 0);
		});
		
		$parts.children('ul').children('li').each(function(){
			switchp($(this));
		});

	});
	
	$('#download').click(function(){
		Foxmosa.save();
		return false;
	});

	var cs = new colorSelecter($('#colorSelecter'), 760, 5);
	cs.addBtn();
	cs.addBtn();
	cs.onChange(function(colors){
		Foxmosa.beforeUpdate(function(ctx){
			//console.log(colors);
			var grd = ctx.createLinearGradient(0, 0, 600, 300);
			grd.addColorStop(0, colors[0]);
			grd.addColorStop(1, colors[1]);
			ctx.fillStyle = grd;
			ctx.fillRect(0, 0, 600, 300);
		});
		Foxmosa.update();
	});
	
});
