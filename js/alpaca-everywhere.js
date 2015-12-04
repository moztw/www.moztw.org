var AlpacaEverywhere = (function(){

    const /* Curently Removed, because my css skill is too poor.
          ANIMATION_LEFT_RIGHT_LEFT = 0,
          ANIMATION_RIGHT_LEFT_RIGHT = 1,
          ANIMATION_TOP_BOTTOM_TOP = 2, */
          ANIMATION_BOTTOM_TOP_BOTTOM = 0;

    var _targets,
        _target,
        _animationList = [],
        _alpacaContainer,
        _alpaca,
        _delay, 
        _player;

    function _callAlpaca(){
      _player = _animationList[ ~~(Math.random() * _animationList.length) ],
      _target = _targets[ ~~(Math.random() * _targets.length) ];
      
      _player.start && _player.start();
    }

    function _kickAlpaca(){
      _player.stop && _player.stop();
      _target = undefined;
      _player = undefined;
    }

    function _awakeTimer(){
      _callAlpaca();
    }

    function _sleepTimer(){
	  window.setTimeout( _awakeTimer, _delay );
      _kickAlpaca();
    }

    (function _init_frame_animation(){
/* Currently Remove, because my css skill is too poor.
      _animationList[ANIMATION_LEFT_RIGHT_LEFT] = {};

      _animationList[ANIMATION_LEFT_RIGHT_LEFT].start = function(){
        var keyframe = 'alpaca_left_right_left';
      	_alpaca.aId = _alpaca.addEventListener("animationend", _sleepTimer);
      	_alpaca.style.WebkitAnimation = ["10s", keyframe].join(' ');
      	_alpaca.style.animation = ["10s", keyframe].join(' ');
        _target.appendChild(_alpacaContainer);
      };

      _animationList[ANIMATION_LEFT_RIGHT_LEFT].stop = function(){
      	_alpaca.removeEventListener( "animationend", _alpaca.aId );
      	_target.removeChild(_alpacaContainer);
      	_alpaca.style.WebkitAnimation = "";
      	_alpaca.style.animation = "";
      };

      _animationList[ANIMATION_RIGHT_LEFT_RIGHT] = {};

      _animationList[ANIMATION_RIGHT_LEFT_RIGHT].start = function(){
        var keyframe = 'alpaca_right_left_right';
      	_alpaca.aId = _alpaca.addEventListener("animationend", _sleepTimer);
      	_alpaca.style.WebkitAnimation = ["10s", keyframe].join(' ');
      	_alpaca.style.animation = ["10s", keyframe].join(' ');
        _target.appendChild(_alpacaContainer);
      };

      _animationList[ANIMATION_RIGHT_LEFT_RIGHT].stop = function(){
      	_alpaca.removeEventListener(_alpaca.aId);
      	_target.removeChild(_alpacaContainer);
      	_alpaca.style.WebkitAnimation = "";
      	_alpaca.style.animation = "";
      };
  
      _animationList[ANIMATION_TOP_BOTTOM_TOP] = {};

      _animationList[ANIMATION_TOP_BOTTOM_TOP].start = function(){
        var keyframe = 'alpaca_top_bottom_top';
      	_alpaca.aId = _alpaca.addEventListener("animationend", _sleepTimer);
      	_alpaca.style.WebkitAnimation = ["10s", keyframe].join(' ');
      	_alpaca.style.animation = ["10s", keyframe].join(' ');
        _target.appendChild(_alpacaContainer);
      };

      _animationList[ANIMATION_TOP_BOTTOM_TOP].stop = function(){
      	_alpaca.removeEventListener(_alpaca.aId);
      	_target.removeChild(_alpacaContainer);
      	_alpaca.style.WebkitAnimation = "";
      	_alpaca.style.animation = "";
      };
*/
      _animationList[ANIMATION_BOTTOM_TOP_BOTTOM] = {};

      _animationList[ANIMATION_BOTTOM_TOP_BOTTOM].start = function(){
        var keyframe = 'alpaca_bottom_top_bottom';
      	_alpaca.aId = _alpaca.addEventListener("animationend", _sleepTimer);
      	_alpaca.style.WebkitAnimation = ["10s", keyframe].join(' ');
      	_alpaca.style.animation = ["10s", keyframe].join(' ');
        _target.appendChild(_alpacaContainer);
      };

      _animationList[ANIMATION_BOTTOM_TOP_BOTTOM].stop = function(){
      	_alpaca.removeEventListener(_alpaca.aId);
      	_target.removeChild(_alpacaContainer);
      	_alpaca.style.WebkitAnimation = "";
      	_alpaca.style.animation = "";
      };

    })();

    function init( imgsrc, delay, targets ){

      var alpaca = document.createElement('div'),
          alpacaVirtualBox = document.createElement('div'),
          alpacaImg = document.createElement('img');

      _targets = targets || document.querySelectorAll( 'div, section' );

      _delay = delay || 1000;

      alpacaImg.src = imgsrc;

	  alpaca.className = 'alpaca_everywhere';
	  alpaca.appendChild(alpacaImg);
      
	  alpacaVirtualBox.className = 'alpaca_virtualblock';
      alpacaVirtualBox.appendChild(alpaca);

      _alpacaContainer = alpacaVirtualBox;
      _alpaca = alpaca;

      _awakeTimer();
    }
    
    return {
      init: init
    };

})();