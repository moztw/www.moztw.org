/*
$v0.7.2
This Software is part of LeanBack Player [HTML5 Video Player] by Ronny Mennerich
Copyright (c) 2010 Ronny Mennerich <ronny@mennerich.name>

The Software and therefore the included functionality is distributed in the hope
that it will be useful for you.

The use of this Software is free for private, you can redistribute in
your private project(s) and/or modify it to your needs.
For commercial use, at this time, you need the permission of the author!

The above copyright and permission notices shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
*/
/** VARIABLES and ATTRIBUTES definition */
// list of players on the page
var LBPlayers = [];
/**
	LBPlayer CLASS definition
 */
var LBPlayer = function(o, v, p) {
	/*-----------------------*/
	// Default Options
    this.options = {
	};
	LBPlayer.mergeObjs(this.options, o);
	/*-----------------------*/
	// Global Variables
	this.vars = {
		autoplay: false,
		hasControls: false,
		proc: null,				// process-var
		loaded: 0,
		fullscreen: false,
		hideSubtitle: false,
		subs: null,
		activeSub: null,
		activeSubId: -1,
		poster: null,
		showControls: false,
		keyHolderCRTL: false,
		keyHolderTAB: false,
		keyHolderALT: false,
		videoHeight: null,
		videoWidth: null,
		fixLoadingSource: {},
		waitingEvent: {},
		spinnerAlpha: 0,
		spinnerProc: null,
		initSources: {},
		seeking: {playing: false, proc: null},
		// Browser & Device Checks
		browserLanguage: LBPlayer.getBrowserLanguage(),
		isIE: ((navigator.userAgent.toLowerCase().indexOf('msie') > -1) ? true : false),
		isBrowser: (((navigator.userAgent.toLowerCase().indexOf('msie') > -1) ? "msie" : (((navigator.userAgent.toLowerCase().indexOf('firefox') > -1) ? "firefox" : (((navigator.userAgent.toLowerCase().indexOf('chrome') > -1) ? "chrome" : (((navigator.userAgent.toLowerCase().indexOf('opera') > -1) ? "opera" : (((navigator.userAgent.toLowerCase().indexOf('safari') > -1) ? "safari" : "")))))))))),
		canPlayType: {
			msie: /(.mp4|.webm)$/i,	// IE9 will only support WebM "when the user has installed a VP8 codec"
			firefox: /(.ogv|.ogg|.webm)$/i,	// FF4 will also play WebM
			chrome: /(.mp4|.webm|.ogv|.ogg)$/i,
			opera: /(.webm|.ogv|.ogg)$/i,
			safari: /(.mp4|.m4v|.m3u8)$/i // also support for m3u8-streams on iPad
		},
		playlistItem: 0
	};
	LBPlayer.mergeObjs(this.vars, v);
	/*-----------------------*/
	// Default Options
    this.playlist = [];
	LBPlayer.mergeObjs(this.playlist, p);
	/*-----------------------*/
	// set to browser-language, if available
	if(this.options.setToBrowserLanguage && typeof(LBPlayer.Lang[this.vars.browserLanguage]) === "undefined") {this.vars.browserLanguage=this.options.defaultLanguage;}
	/*-----------------------*/
	// Video-Object
	this.vObj = LBPlayer.$(this.options.vid);
	/*-----------------------*/
	// on autoplay focus current video
	if(this.vObj.autoplay && LBPlayer.videoFocused === null) {this.vObj.pause(); this.vars.autoplay = true;}
	/*-----------------------*/
	// function - fix "preload" attribute issue
	this.fixPreloading();
	/*-----------------------*/
	// function - init player
	this.initializePlayer();
	/*-----------------------*/
	// function - init sources
	if(!LBPlayer.isIPad() && this.vars.playableSources.length > 1 && this.options.sourcesSwitch) {this.initializeSources();}
};
// function - fix issue with "preload" atrribute that most browsers have
LBPlayer.prototype.fixPreloading = function(){
	var preload = this.vObj.preload;
	// fix "preload" attribute in firefox 3.6
	if(typeof(this.vObj.preload) == "undefined") {preload = this.options.fixPreload;}
	// return if autoplay, otherwise opera fails autoplaying
	if(this.vars.autoplay) {return;}
	switch(preload) {
		case "none":
		case "metadata":
			LBPlayer.mergeObjs(this.vObj, {src: "null"});
			try{this.vObj.load();}catch(ex1){/*IE9 doesn't like "load()" here*/} break;
		default: try{this.vObj.load();}catch(ex2){/*IE9 doesn't like "load()" here*/} var self = this; this.vars.proc = setInterval(function() {self.onBuffering();}, 250); break;
	}
};
// function - initialize player
LBPlayer.prototype.initializePlayer = function() {
	var vid = this.options.vid, pid = (LBPlayer.$(this.options.vid).parentNode).id;
	// add css class to video element and video parent
	LBPlayer.mergeObjs(LBPlayer.$(pid), {className: "h5_lb_player h5_lb_smallscreen h5_lb_unfocused"});
	LBPlayer.mergeObjs(LBPlayer.$(vid), {className: "h5_lb_video"});
	// function - resize and set video
	this.resizeVideo();
	// function - get subtitles
	if(this.options.showSubtitle) {this.getSubs();}
	// function - if playlist available add default video to beginning of playlist position 0
	if(!LBPlayer.isIPad() && this.playlist.length > 0) {this.addToPlaylist(0, this.vObj.poster, this.vars.playableVideo, this.vars.playableSources, this.vars.subs);}
	// function - add controls
	this.addControls();
	/** Global Events */
	// do something on key down, if video-object has focus
	document.onkeydown = function(e) {
		if(LBPlayer.videoFocused !== null) {
			try {
				var id0 = LBPlayer.videoFocused.id, o0 = LBPlayer.getObj(LBPlayers, id0);
				if(LBPlayer.$(id0).focused && o0) { o0.onKeydown(e); o0.setControlsTask(); }
			} catch(ex) { /*do nothing*/ }
			return LBPlayer.onKeyAction;
		}
	};
	// do something on key up
	document.onkeyup = function(e) {
		if(LBPlayer.videoFocused !== null) {
			try {
				var id1 = LBPlayer.videoFocused.id, o1 = LBPlayer.getObj(LBPlayers, id1);
				if(LBPlayer.$(id1).focused && o1) { o1.onKeyup(e); }
			} catch(ex) { /*do nothing*/ }
		}
		var ev = (e || window.event); ev = (ev.target || ev.srcElement);
		var id2 = ((ev.getAttribute("id") !== null) ? ev.getAttribute("id") : null);
		if(id2 === null && (typeof((ev.parentNode).getAttribute) !== "undefined" && (ev.parentNode).getAttribute("id") !== null)) { id2 = (ev.parentNode).getAttribute("id"); }
		var o2 = LBPlayer.getObj(LBPlayers, id2);
		if(!LBPlayer.isVideoEvent && o2) {
			if(LBPlayer.videoFocused !== null) {
				var ovid = LBPlayer.videoFocused.id;
				// blur old video element
				if(ovid !== o2.options.vid) {LBPlayer.focusVideo(false, ovid); o2.vars.keyHolderTAB = false;}
			}
			// focus new video element
			LBPlayer.focusVideo(true, o2.options.vid);
		} else if(!LBPlayer.isVideoEvent) {
			if(LBPlayer.videoFocused !== null) {
				var id3 = LBPlayer.videoFocused.id;
				var o3 = LBPlayer.getObj(LBPlayers, id3);
				//blur old video element
				if(o3.vars.keyHolderTAB) {LBPlayer.focusVideo(false, id3); o3.vars.keyHolderTAB = false;}
				LBPlayer.isVideoEvent = false;
			}
		}
		if(LBPlayer.videoFocused !== null) {return LBPlayer.onKeyAction;}
	};
	// do something on key press
	document.onkeypress = function(e) {if(LBPlayer.videoFocused !== null) {return LBPlayer.onKeyAction;}};
	// do something if window size changed
	window.onresize = function() {if(LBPlayer.videoFocused !== null) { var vid = LBPlayer.videoFocused.id; var o = LBPlayer.getObj(LBPlayers, vid); if(LBPlayer.$(vid).focused && o){ o.setScreen(o.vars.fullscreen); }}};
	// set focus to element
	document.onmousedown = function (e) {
		var e1 = (e || window.event), e2 = (e1.target || e1.srcElement);
		var id4 = ((e2.getAttribute("id") !== null) ? e2.getAttribute("id") : null);
		if(id4 === null && (typeof((e2.parentNode).getAttribute) !== "undefined" && (e2.parentNode).getAttribute("id") !== null)) { id4 = (e2.parentNode).getAttribute("id"); }
		var o4 = LBPlayer.getObj(LBPlayers, id4);
		if(id4 !== null && o4) {
			if(LBPlayer.videoFocused !== null) {
				var ovid = LBPlayer.videoFocused.id;
				// only if old focused not new focused
				if(ovid !== o4.options.vid) {
					// blur old video element
					LBPlayer.focusVideo(false, ovid);
					// focus new video element				
					LBPlayer.focusVideo(true, o4.options.vid);
				}
			} else {
				// focus new video element
				LBPlayer.focusVideo(true, o4.options.vid);
			}
		} else {
			// blur old video element
			if(LBPlayer.videoFocused !== null) {var id5 = LBPlayer.videoFocused.id; LBPlayer.focusVideo(false, id5);}
		}
	};
};
// function - initialize multiple sources, determine metadata (width, height)
LBPlayer.prototype.initializeSources = function(i) {
	var i = ((i) ? parseInt(parseInt(i, 10)+1, 10) : 0);
	this.setSpinner(true);
	var v = document.createElement("video"); this.vars.playableSources[i].video = v;
	var d = new Date(), id = parseInt(d.getTime()*Math.random()*100, 10); // try random id to overwrite cache, hope this works
	LBPlayer.mergeObjs(this.vars.playableSources[i].video, {id: "init"+id+"_"+i, src: this.vars.playableSources[i].src});
	try{this.vars.playableSources[i].video.load();}catch(ex1){/*IE9 doesn't like "load()" here*/}
	// on loadedmetadata save dimensions
	var self = this;
	LBPlayer.addEvent(this.vars.playableSources[i].video, "loadedmetadata", function() {
		var id = (/[^_]+$/.exec(this.id))[0];
		self.vars.playableSources[id].res = ((self.vars.playableSources[id].video.videoWidth >= 1920 && self.vars.playableSources[id].video.videoHeight >= 1080) ? 1080 : ((self.vars.playableSources[id].video.videoWidth >= 1280 && self.vars.playableSources[id].video.videoHeight >= 720) ? 720 : ((self.vars.playableSources[id].video.videoWidth >= 852 && self.vars.playableSources[id].video.videoHeight >= 480) ? 480 : ((self.vars.playableSources[id].video.videoHeight >= 360) ? 360 : ((self.vars.playableSources[id].video.videoHeight >= 240) ? 240 : "SD")))));
		self.vars.playableSources[id].type = ((self.vars.playableSources[id].video.videoWidth >= 1920 && self.vars.playableSources[id].video.videoHeight >= 1080) ? "HD" : ((self.vars.playableSources[id].video.videoWidth >= 1280 && self.vars.playableSources[id].video.videoHeight >= 720) ? "HD" : ((self.vars.playableSources[id].video.videoWidth >= 852 && self.vars.playableSources[id].video.videoHeight >= 480) ? "SD" : ((self.vars.playableSources[id].video.videoHeight >= 360) ? "SD" : ""))));
		LBPlayer.mergeObjs(this, {src: "null"});try{this.load();}catch(ex2){/*IE9 doesn't like "load()" here*/}
		self.vars.playableSources[id].video = null;
		var r = 0;
		for(var i=0; i<self.vars.playableSources.length; i++){if(typeof self.vars.playableSources[i].res !== "undefined" && typeof self.vars.playableSources[i].type !== "undefined"){r++}}
		if(r === self.vars.playableSources.length) {self.fixSourcesMenu()} else if(parseInt(id, 10) < self.vars.playableSources.length) {self.initializeSources(id);}
	});
};
// function - draw sources menu items
LBPlayer.prototype.drawSourcesMenu = function(id) {
	var vid = this.options.vid, self = this;
	// create controls popup, only one time
	if(!LBPlayer.$(vid+"_sources_nav")) {LBPlayer.createHTMLEl(vid+"_sources_control_inner", "div", {id: vid+"_sources_nav", className: "sources_nav"});}
	// create element
	var txt = ((!isNaN(this.vars.playableSources[id].res)) ? this.vars.playableSources[id].res+"p" : this.vars.playableSources[id].res);
	LBPlayer.createHTMLEl(vid+"_sources_nav", "div", {id: vid+"_sources_"+id, innerHTML: txt});
	if(this.vars.playableSources[id].type !== null) {LBPlayer.createHTMLEl(vid+"_sources_"+id, "span", {id: vid+"_sources_sup_"+id, innerHTML: " <span>"+this.vars.playableSources[id].type+"</span>"});}
	LBPlayer.mergeObjs(LBPlayer.$(vid+"_sources_"+id), {title: LBPlayer.Lang[this.vars.browserLanguage].Sources_to+txt, onclick: function() {LBPlayer.$(vid+"_sources_control_inner").childNodes[0].textContent=((!isNaN(self.vars.playableSources[id].res)) ? self.vars.playableSources[id].res+"p" : self.vars.playableSources[id].res); self.fixLoadingSource("onSrcSwitch", null, self.vars.playableSources[id].src);}});
	LBPlayer.$(vid+"_sources_nav").style.top = "-"+parseInt((LBPlayer.$(vid+"_sources_nav").childNodes.length) * parseInt(LBPlayer.getElemStyle(vid+"_sources_"+id, "height"), 10)+5, 10)+"px";
	// active source quality on controls button
	if(this.vars.playableSources[id].src === this.vars.playableVideo) {LBPlayer.$(vid+"_sources_control_inner").childNodes[0].textContent = txt;}
};
// function - fix sources menu
LBPlayer.prototype.fixSourcesMenu = function() {
	var vid = this.options.vid, s = this.vars.playableSources, t = [];
	// reset controls
	this.resetControls(); this.addControls();
	for(var i=0; i<s.length; i++) {
		if(!LBPlayer.inArray(t, s[i].res) && typeof s[i].res !== "undefined"  && typeof s[i].type !== "undefined") {
			// add element to controls sources element popup
			this.drawSourcesMenu(i); t.push(s[i].res);
		}
	}
	// reset controls
	if(LBPlayer.$(vid+"_sources_nav").childNodes.length > 1) {LBPlayer.showEl(vid+"_sources_control");} LBPlayer.showEl(vid+"_controls"); this.addControls();
	// hide spinner
	this.setSpinner(false);	this.vars.initSources = {};
	// if autoplay - play video now
	if(this.vars.autoplay && (this.vars.playableSources.length > 1 && this.options.sourcesSwitch)) {LBPlayer.focusVideo(true, this.options.vid); this.setVideoToFocus(this.options.vid); this.onPlay();}
};
// function - resize and set video
LBPlayer.prototype.resizeVideo = function() {
	var vid = this.options.vid;
	if(this.vars.videoHeight === null && this.vars.videoWidth === null) {
		this.vars.videoHeight = this.vObj.height;
		this.vars.videoWidth = this.vObj.width;
	}
	if((!LBPlayer.isIPad() && this.playlist.length > 0) || ((this.vars.videoHeight <= this.vObj.videoHeight || this.vars.videoHeight > this.vObj.videoHeight || this.vObj.videoHeight === 0) || (this.vars.videoWidth <= this.vObj.videoWidth || this.vars.videoWidth > this.vObj.videoWidth || this.vObj.videoWidth === 0))) {
		this.vObj.height = this.vars.videoHeight; this.vObj.width = this.vars.videoWidth;
	} else if(this.vObj.videoHeight > 0 || this.vObj.videoWidth > 0) {
		this.vObj.height = this.vObj.videoHeight; this.vObj.width = this.vObj.videoWidth;
	}
	LBPlayer.$(vid).style.height = parseInt(this.vObj.height, 10)+"px"; LBPlayer.$(vid).style.width = parseInt(this.vObj.width, 10)+"px";
	(LBPlayer.$(vid).parentNode).style.height = this.vObj.offsetHeight+"px"; (LBPlayer.$(vid).parentNode).style.width = this.vObj.offsetWidth+"px";
};
// function - add controls
LBPlayer.prototype.addControls = function() {
	var vid = this.options.vid;
	var self = this;
	// create controls
	if(!this.vars.hasControls) {
		var pid = (LBPlayer.$(vid).parentNode).id;
		// if poster, create img element
		if(this.vObj.poster) {this.vars.poster = LBPlayer.createHTMLEl(pid, "img", {id: vid+"_poster", className: "poster", src: this.vObj.poster}); this.setPoster();}
		// if watermark/logo, create img element
		if(this.options.watermark) {LBPlayer.createHTMLEl(pid, "img", {id: vid+"_watermark", className: "watermark", src: this.options.watermark});}
		// create spinner element
		LBPlayer.createHTMLEl(pid, "div", {id: vid+"_spinner", className: "h5_lb_spinner"});
		this.setSpinner(false);
		// create Embed-Code element
		if(!LBPlayer.isIPad()) {
			LBPlayer.createHTMLEl(pid, "div", {id: vid+"_embed", className: "h5_lb_embed"});
			LBPlayer.createHTMLEl(vid+"_embed", "span", {id: vid+"_embed_info", className: "h5_lb_embed_inner", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].EmbedInfo, title: LBPlayer.Lang[this.vars.browserLanguage].EmbedInfoTitle});
			LBPlayer.createHTMLEl(pid, "div", {id: vid+"_embed_code", className: "h5_lb_embed_code"});
			// create textarea
			LBPlayer.createHTMLEl(vid+"_embed_code", "textarea", {id: vid+"_embed_code_user", className: "h5_lb_embed_code_user"});
			// create hint div
			LBPlayer.createHTMLEl(vid+"_embed_code", "div", {id: vid+"_embed_code_txt", className: "h5_lb_embed_code_txt", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].EmbedCodeTxt});
			// create close button
			LBPlayer.createHTMLEl(vid+"_embed_code", "button", {id: vid+"_embed_code_btn", className: "h5_lb_embed_code_btn", onclick: function() {LBPlayer.hideEl(vid+"_embed_code");}, innerHTML: LBPlayer.Lang[self.vars.browserLanguage].EmbedBtn, title: LBPlayer.Lang[self.vars.browserLanguage].EmbedBtn});
			// add events to Embed-Code element
			LBPlayer.mergeObjs(LBPlayer.$(vid+"_embed"), {onmousemove: function() {
				clearInterval(self.vars.embedTimeout);
				if(LBPlayer.$(vid+"_embed_video") === null) {
					while (LBPlayer.$(vid+"_embed").hasChildNodes()) { LBPlayer.$(vid+"_embed").removeChild(LBPlayer.$(vid+"_embed").firstChild); }
					LBPlayer.createHTMLEl(vid+"_embed", "div", {id: vid+"_embed_video", className: "h5_lb_embed_inner", onclick: function() {self.createEmbedCode("video");}, innerHTML: LBPlayer.Lang[self.vars.browserLanguage].EmbedVideo, title: LBPlayer.Lang[self.vars.browserLanguage].EmbedVideoTitle});
					LBPlayer.createHTMLEl(vid+"_embed", "div", {id: vid+"_embed_url", className: "h5_lb_embed_inner", onclick: function() {self.createEmbedCode("url");}, innerHTML: LBPlayer.Lang[self.vars.browserLanguage].EmbedURL, title: LBPlayer.Lang[self.vars.browserLanguage].EmbedURLTitle});
				}}});
			LBPlayer.mergeObjs(LBPlayer.$(vid+"_embed"), {onmouseout: function() {
					self.vars.embedTimeout = setInterval(function(){
						while (LBPlayer.$(vid+"_embed").hasChildNodes()) { LBPlayer.$(vid+"_embed").removeChild(LBPlayer.$(vid+"_embed").firstChild); }
						LBPlayer.createHTMLEl(vid+"_embed", "span", {id: vid+"_embed_info", className: "h5_lb_embed_inner", innerHTML: LBPlayer.Lang[self.vars.browserLanguage].EmbedInfo, title: LBPlayer.Lang[self.vars.browserLanguage].EmbedInfoTitle});
						clearInterval(self.vars.embedTimeout);
					}, 2000);
				}});
		}
		// create controls parent
		LBPlayer.createHTMLEl(pid, "div", {id: vid+"_controls", className: "h5_lb_controls"});
		// create play-button
		LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_play_control", className: "h5_lb_play_control", title: LBPlayer.Lang[this.vars.browserLanguage].Play});
		LBPlayer.createHTMLEl(vid+"_play_control", "div", {id: vid+"_play_inner0"});
		// create big play button
		LBPlayer.createHTMLEl(pid, "div", {id: vid+"_big_play_button", className: "big_play_button", title: LBPlayer.Lang[this.vars.browserLanguage].Play});
		LBPlayer.createHTMLEl(vid+"_big_play_button", "div", {id: vid+"_big_play_button_inner"});
		// create pause-button
		LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_pause_control", className: "h5_lb_pause_control", title: LBPlayer.Lang[this.vars.browserLanguage].Pause});
		LBPlayer.createHTMLEl(vid+"_pause_control", "div", {id: vid+"_pause_inner0"});
		LBPlayer.createHTMLEl(vid+"_pause_control", "div", {id: vid+"_pause_inner1"});
		// create stop button
		LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_stop_control", className: "h5_lb_stop_control", title: LBPlayer.Lang[this.vars.browserLanguage].Stop});
		LBPlayer.createHTMLEl(vid+"_stop_control", "div", {id: vid+"_stop_control_inner"});
		// create progress bar
		LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_progress_control", className: "h5_lb_progress_control"});
		LBPlayer.createHTMLEl(vid+"_progress_control", "div", {id: vid+"_progress_bar_bg", className: "progress_bar_bg"});
		LBPlayer.createHTMLEl(vid+"_progress_control", "div", {id: vid+"_progress_bar_played", className: "progress_bar_played"});
		LBPlayer.createHTMLEl(vid+"_progress_control", "div", {id: vid+"_progress_bar_buffered", className: "progress_bar_buffered"});
		LBPlayer.createHTMLEl(vid+"_progress_control", "div", {id: vid+"_progress_bar_time", className: "progress_bar_time"});
		LBPlayer.createHTMLEl(vid+"_progress_bar_time", "div", {id: vid+"_progress_bar_time_line", className: "progress_bar_time_line"});
		LBPlayer.createHTMLEl(vid+"_progress_bar_time", "div", {id: vid+"_progress_bar_time_txt", className: "progress_bar_time_txt"});
		// create timer
		LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_timer_control", className: "h5_lb_timer_control"});
		LBPlayer.createHTMLEl(vid+"_timer_control", "div", {id: vid+"_timer_control_inner"});
		// create mute-elements
		LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_volume_control", className: "h5_lb_volume_control"});
		LBPlayer.createHTMLEl(vid+"_volume_control", "div", {id: vid+"_mute", className: "h5_lb_mute", title: LBPlayer.Lang[this.vars.browserLanguage].Mute});
		LBPlayer.createHTMLEl(vid+"_mute", "div", {id: vid+"_mute0"});
		LBPlayer.createHTMLEl(vid+"_mute", "div", {id: vid+"_mute1"});
		LBPlayer.createHTMLEl(vid+"_mute", "div", {id: vid+"_mute2"});
		LBPlayer.createHTMLEl(vid+"_mute", "div", {id: vid+"_mute3"});
		LBPlayer.createHTMLEl(vid+"_mute", "div", {id: vid+"_mute4"});
		LBPlayer.createHTMLEl(vid+"_mute", "div", {id: vid+"_mute5"});
		LBPlayer.createHTMLEl(vid+"_mute", "div", {id: vid+"_mute6"});
		// create volume-elements
		LBPlayer.createHTMLEl(vid+"_volume_control", "div", {id: vid+"_volume", className: "h5_lb_volume"});
		for(var i=1; i<=8; i++) {LBPlayer.createHTMLEl(vid+"_volume", "div", {id: vid+"_vol"+i, title: LBPlayer.Lang[this.vars.browserLanguage].Volume});}
		
		// create playbackRate
		if(this.options.showPlaybackRate && this.vObj.playbackRate) {
			LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_playback_control", className: "h5_lb_playback_control", title: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_title});
			LBPlayer.createHTMLEl(vid+"_playback_control", "div", {id: vid+"_playback_control_inner", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_inner});
			LBPlayer.createHTMLEl(vid+"_playback_control_inner", "div", {id: vid+"_playback_nav", className: "playback_nav"});
			LBPlayer.createHTMLEl(vid+"_playback_nav", "div", {id: vid+"_pbr2", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_2, title: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_to+""+LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_2, onclick: function() {self.setPlaybackRate(2, LBPlayer.Lang[self.vars.browserLanguage].PlaybackRate_2);}});
			LBPlayer.createHTMLEl(vid+"_playback_nav", "div", {id: vid+"_pbr1", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_1, title: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_to+""+LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_1, onclick: function() {self.setPlaybackRate(1, LBPlayer.Lang[self.vars.browserLanguage].PlaybackRate_1);}});
			LBPlayer.createHTMLEl(vid+"_playback_nav", "div", {id: vid+"_pbr05", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_05, title: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_to+""+LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_05, onclick: function() {self.setPlaybackRate(0.5, LBPlayer.Lang[self.vars.browserLanguage].PlaybackRate_05);}});
			LBPlayer.createHTMLEl(vid+"_playback_nav", "div", {id: vid+"_pbr025", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_025, title: LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_to+""+LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_025, onclick: function() {self.setPlaybackRate(0.25, LBPlayer.Lang[self.vars.browserLanguage].PlaybackRate_025);}});
			switch(this.vObj.playbackRate) {
				case 1: this.setPlaybackRate(1, LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_1); break;
				case 2: this.setPlaybackRate(2, LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_2); break;
				case 0.5: this.setPlaybackRate(0.5, LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_05); break;
				case 0.25: this.setPlaybackRate(0.25, LBPlayer.Lang[this.vars.browserLanguage].PlaybackRate_025); break;
			}
		}
		// create subtitle-element
		LBPlayer.createHTMLEl(pid, "div", {id: vid+"_subtitles", className: "h5_lb_subtitles"});
		if(this.options.showSubtitle && this.vars.activeSub !== null) {
			LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_subtitle_control", className: "h5_lb_subtitle_control", title: LBPlayer.Lang[this.vars.browserLanguage].Subtitle_title});
			LBPlayer.createHTMLEl(vid+"_subtitle_control", "div", {id: vid+"_subtitle_control_inner", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].Subtitle_inner});
			// draw subtitle menu items
			if(this.options.showSubtitle && this.vars.activeSub !== null) {this.drawSubsMenu();}
		}
		// create sources-element
		if(this.vars.playableSources.length > 1 && this.options.sourcesSwitch) {
			LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_sources_control", className: "h5_lb_sources_control", title: LBPlayer.Lang[this.vars.browserLanguage].Sources_title});
			LBPlayer.createHTMLEl(vid+"_sources_control", "div", {id: vid+"_sources_control_inner", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].Sources_inner});
			LBPlayer.hideEl(vid+"_sources_control");
		}
		// create playlist element
		if(!LBPlayer.isIPad() && this.playlist.length > 0) {
			LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_playlist_control", className: "h5_lb_playlist_control", title: LBPlayer.Lang[this.vars.browserLanguage].Playlist_title});
			LBPlayer.createHTMLEl(vid+"_playlist_control", "div", {id: vid+"_playlist_control_inner", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].Playlist_inner});
		}
		// create fullscreen-button
		LBPlayer.createHTMLEl(vid+"_controls", "div", {id: vid+"_fullscreen_control", className: "h5_lb_fullscreen_control", title: LBPlayer.Lang[this.vars.browserLanguage].Fullscreen});
		LBPlayer.createHTMLEl(vid+"_fullscreen_control", "div", {id: vid+"_fullscreen_control_fs1", className: "h5_lb_fullscreen_control_fs1"});
		LBPlayer.createHTMLEl(vid+"_fullscreen_control", "div", {id: vid+"_fullscreen_control_fs2", className: "h5_lb_fullscreen_control_fs2"});
		
		// draw progress timer
		this.drawProgressTimer();
		
		// add events
		LBPlayer.addEvent(this.vObj, "ended", function() {if(self.vObj.loop) {self.onPlay();} else {self.onEnded();}});
		LBPlayer.addEvent(this.vObj, "progress", function(e) { self.onProgress(e);});
		LBPlayer.addEvent(this.vObj, "timeupdate", function() {self.drawProgressTimer(); if(self.options.showSubtitle) {self.drawSubtitles();}});
		LBPlayer.addEvent(this.vObj, "seeked", function() {self.onSeeked();});
		LBPlayer.addEvent(this.vObj, "waiting", function() {self.setSpinner(true);});
		LBPlayer.addEvent(this.vObj, "play", function() {self.setSpinner(false);});
		LBPlayer.addEvent(this.vObj, "playing", function() {self.setSpinner(false);});

		LBPlayer.mergeObjs(this.vObj, {onclick: function() {self.onPlay();}});
		LBPlayer.mergeObjs(this.vObj, {ondblclick: function() {self.setScreen(!self.vars.fullscreen);}});
		LBPlayer.mergeObjs(this.vObj, {onmousemove: function() {if(LBPlayer.$(vid).focused){self.setControlsTask();}}});
		LBPlayer.mergeObjs((LBPlayer.$(vid).parentNode), {onmouseover: function() {
				if(!self.vars.fullscreen) {
					var cssClass = "h5_lb_player h5_lb_smallscreen";
					(LBPlayer.$(vid).parentNode).removeAttribute("class");
					(LBPlayer.$(vid).parentNode).setAttribute("class", cssClass);
				}
			}});
		LBPlayer.mergeObjs((LBPlayer.$(vid).parentNode), {onmouseout: function() {
				if(!self.vars.fullscreen) {
					if(!LBPlayer.$(vid).focused) {
						var cssClass = "h5_lb_player h5_lb_smallscreen h5_lb_unfocused";
						(LBPlayer.$(vid).parentNode).removeAttribute("class");
						(LBPlayer.$(vid).parentNode).setAttribute("class", cssClass);
					}
				}
			}});
		
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_controls"), {onmousemove: function() {clearInterval(self.vars.mouseMoveTimeout);}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_controls"), {onmouseout: function() {self.setControlsTask();}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_big_play_button"), {onclick: function() {clearInterval(self.vars.mouseMoveTimeout);self.onPlay();}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_play_control"), {onclick: function() {self.onPlay();}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_pause_control"), {onclick: function() {self.onPlay();}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_stop_control"), {onclick: function() {self.vObj.pause(); self.onStop();}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_progress_control"), {onclick: function(e) {self.setSubtitle(false); self.onSeeking(e);}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_progress_control"), {onmouseover: function(e) {self.getProgressPosition(e);}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_progress_control"), {onmousemove: function(e) {self.getProgressPosition(e);}});
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_mute_control"), {onclick: function() {self.setVolume(0);}});
		for(var j=1; j<=8; j++) {
			LBPlayer.mergeObjs(LBPlayer.$(vid+"_vol"+j), {onclick: function() {self.setVolume(this.id);}});
		}
		LBPlayer.mergeObjs(LBPlayer.$(vid+"_fullscreen_control"), {onclick: function() {self.setScreen(!self.vars.fullscreen);}});
		this.vars.hasControls = true;
	}
	// (re-)calculate controls elements
	var elementsWidth = parseInt(LBPlayer.getElemStyleWidth(vid+"_play_control") + LBPlayer.getElemStyleWidth(vid+"_pause_control") + LBPlayer.getElemStyleWidth(vid+"_stop_control") + LBPlayer.getElemStyleWidth(vid+"_timer_control")  + LBPlayer.getElemStyleWidth(vid+"_volume_control") + LBPlayer.getElemStyleWidth(vid+"_fullscreen_control"), 10);
	if(this.options.showPlaybackRate && this.vObj.playbackRate) { elementsWidth += LBPlayer.getElemStyleWidth(vid+"_playback_control"); }
	if(this.options.showSubtitle && this.vars.activeSub !== null) { elementsWidth += LBPlayer.getElemStyleWidth(vid+"_subtitle_control"); }
	if(this.vars.playableSources.length > 1 && this.options.sourcesSwitch) {elementsWidth += LBPlayer.getElemStyleWidth(vid+"_sources_control");}
	if(!LBPlayer.isIPad() && this.playlist.length > 0) {elementsWidth += LBPlayer.getElemStyleWidth(vid+"_playlist_control");}
	// calculate (video-offsetWidth - controls-width) to get width for progress element
	var calcControlsWidth = parseInt(parseInt(this.vObj.offsetWidth, 10) - elementsWidth, 10);
	var calcWidth = parseInt(calcControlsWidth + elementsWidth, 10);
	calcWidth = parseInt(parseInt(this.vObj.width, 10) - calcWidth, 10); // if there is a border (offsetWidth) than recalculate
	// calculate progress control element
	LBPlayer.$(vid+"_progress_control").style.width = parseInt(calcControlsWidth + calcWidth - 1, 10)+"px";
	// calculate progress-seeking and -loading bar
	LBPlayer.$(vid+"_progress_bar_bg").style.width = parseInt(parseInt(LBPlayer.$(vid+"_progress_control").style.width, 10)-22, 10)+"px";
	LBPlayer.$(vid+"_progress_bar_time").style.width = parseInt(parseInt(LBPlayer.$(vid+"_progress_bar_bg").style.width, 10), 10)+"px";
	// set volume
	this.setVolume(this.options.volume);
	// hide controls
	this.setControls(false);
	// hide default controls on iPad
	if(LBPlayer.isIPad()) {
		this.vObj.controls = false;
	}
	// draw playlist items
	if(!LBPlayer.isIPad() && this.playlist.length > 0) {this.drawPlaylistMenu();}
	// if autoplay - play video now
	if(this.vars.autoplay && (this.vars.playableSources.length === 1 || !this.options.sourcesSwitch)) {LBPlayer.focusVideo(true, this.options.vid); this.setVideoToFocus(this.options.vid); this.onPlay();}
};
// function - show/hide controls and embed-code elements
LBPlayer.prototype.setControls = function(b) {
	var vid = this.options.vid;
	if(b) {
		// clear delayed hiding task
		clearInterval(this.vars.mouseMoveTimeout);
		// show controls
		this.vars.showControls = true; LBPlayer.showEl(vid+"_controls");
		// show embedding info
		LBPlayer.showEl(vid+"_embed");
	} else {
		// hide controls
		this.vars.showControls = false; LBPlayer.hideEl(vid+"_controls");
		// hide embedding info
		LBPlayer.hideEl(vid+"_embed");
	}
};
// function - reset controls to redraw
LBPlayer.prototype.resetControls = function() {
	var vid = this.options.vid, pid = (LBPlayer.$(vid).parentNode).id;
	// elements to be removed
	var el_vid = ["_poster", "_watermark", "_spinner", "_embed", "_embed_code", "_controls", "_big_play_button", "_subtitles"];
	// remove elements from vid
	for(var i=0; i<el_vid.length; i++) {
		if(LBPlayer.$(vid+el_vid[i])){(LBPlayer.$(vid+el_vid[i]).parentNode).removeChild(LBPlayer.$(vid+el_vid[i]));}
	}
	this.vars.hasControls = false;
};
// function - force source loading
LBPlayer.prototype.fixLoadingSource = function(a, e, src) {
	var self = this, ex;
	// set up fixLoadingSource var
	LBPlayer.mergeObjs(this.vars.fixLoadingSource, {action: a, event: e, fct: function() {self.onCanPlay();}});
	// show spinner
	this.setSpinner(true);
	// force loading
	if(src !== null ) {if(!this.vObj.paused){this.vars.initSources.playing=true; this.onPlay();}LBPlayer.mergeObjs(this.vars.fixLoadingSource,{event:parseFloat(this.vObj.currentTime)}); this.vObj.src = src;} else {this.vObj.src = this.vars.playableVideo;}
	try{this.vObj.load();}catch(ex){/*IE9 doesn't like "load()" here*/}
	// wait until video is ready to play
	LBPlayer.addEvent(this.vObj, "canplay", this.vars.fixLoadingSource.fct);
};
// function - create loading/waiting spinner
LBPlayer.prototype.createSpinner = function(){
	var vid = this.options.vid, p = LBPlayer.$(vid+"_spinner"), sp = [];
	// remove old childs from spinner
	while(p.hasChildNodes()){p.removeChild(p.firstChild);}
	// create 9 new child div's
	for(var i = 0; i<9; i++) {var c = document.createElement("div"); p.appendChild(c); sp.push(c);}
	return sp;
};
// function - calculate spinner
LBPlayer.prototype.loadSpinner = function(sp){
	for(var i = 1; i <= sp.length; i++) {
		// e.g.: 0.628 = 2*Pi/div's per circles = 2*Pi/10
		sp[(i-1)].style.top = parseFloat(18*Math.cos(this.vars.spinnerAlpha+0.689132*i))+"px";
		sp[(i-1)].style.left = parseFloat(18*Math.sin(this.vars.spinnerAlpha+0.689132*i))+"px";
		sp[(i-1)].style.opacity = parseFloat((10-(i-1))/10).toFixed(2);
	}
	// set new angular velocity for next interval
	this.vars.spinnerAlpha=this.vars.spinnerAlpha-0.35;
};
// function - show/hide spinner (bool)
LBPlayer.prototype.setSpinner = function(b) {
	if(LBPlayer.isIPad()){return;}
	var vid = this.options.vid, self = this;
	// create and load spinner if not already done
	if(b){if(this.vars.spinnerProc === null){LBPlayer.showEl(vid+"_spinner"); this.vars.spinnerProc = window.setInterval(function() {self.loadSpinner(self.createSpinner());}, 90);}}
	// clear and hide spinner
	else if(!b){window.clearInterval(this.vars.spinnerProc); this.vars.spinnerProc = null; LBPlayer.hideEl(vid+"_spinner");}
};
// function - onCanPlay
LBPlayer.prototype.onCanPlay = function() {
	var self = this, vid = this.options.vid; 
	// remove canplay event
	LBPlayer.removeEvent(this.vObj, "canplay", this.vars.fixLoadingSource.fct);
	// hide spinner
	this.setSpinner(false);
	// create preloading-bar
	this.vars.proc = window.setInterval(function() {self.onBuffering();}, 250);
	switch(this.vars.fixLoadingSource.action) {
		case "onPlay": window.setTimeout(function() {self.setControls(true); self.onPlay(); self.vars.fixLoadingSource = {};}, 450); break;
		case "onSeeking": window.setTimeout(function() {self.setControls(true); self.onSeeking(self.vars.fixLoadingSource.event); self.vars.fixLoadingSource = {};}, 450); break;
		case "onSrcSwitch": window.setTimeout(function() {self.setControls(true); self.vObj.currentTime = self.vars.fixLoadingSource.event; if(self.vars.initSources.playing){self.onPlay();self.vars.initSources.playing=false;}; self.vars.fixLoadingSource = {};}, 450); break;
	}
};
// function - if play-/pause-button clicked
LBPlayer.prototype.onPlay = function() {
	var vid = this.options.vid;
	// fix source loading
	if(!(this.vars.canPlayType[this.vars.isBrowser]).test(this.vObj.currentSrc)) {LBPlayer.hideEl(vid+"_big_play_button"); this.fixLoadingSource("onPlay", null, null); return;}
	if(parseFloat(this.vObj.currentTime) >= parseFloat(this.vObj.duration)) {this.vObj.currentTime = 0.00;}
	if(this.vObj.paused || this.vars.autoplay) {LBPlayer.hideEl(vid+"_big_play_button"); LBPlayer.hideEl(vid+"_play_control"); LBPlayer.showEl(vid+"_pause_control"); LBPlayer.hideEl(vid+"_poster"); this.setControls(true); this.vars.autoplay = false; this.vObj.play();} 
	else {LBPlayer.showEl(vid+"_play_control"); LBPlayer.hideEl(vid+"_pause_control"); this.vObj.pause();}
	if(this.vars.activeSub !== null && this.vars.activeSubId == -1) {this.setSubtitle(true);}
};
// function - if stop-button clicked
LBPlayer.prototype.onStop = function() {
	var vid = this.options.vid;
	// hide controls
	this.setControls(false);
	// 
	if(parseFloat(this.vObj.currentTime) > 0) {
		this.vars.stoped = true; this.vObj.currentTime = 0.00; this.vObj.pause(); LBPlayer.showEl(vid+"_big_play_button"); LBPlayer.showEl(vid+"_play_control"); LBPlayer.hideEl(vid+"_pause_control");
	}	
	// hide subtitle
	this.setSubtitle(false);
	this.setPoster();
};
// function - if video ended
LBPlayer.prototype.onEnded = function() {
	var vid = this.options.vid;
	this.vObj.pause(); LBPlayer.showEl(vid+"_big_play_button"); LBPlayer.showEl(vid+"_play_control"); LBPlayer.hideEl(vid+"_pause_control");
	// show controls to get playlist feature active
	if(this.playlist.length > 0) {
		// show controls
		this.setControls(true);
		// add controls
		this.addControls();
	} else {
		// hide controls
		this.setControls(false);
	}
	// hide subtitle
	this.setSubtitle(false);
	this.setPoster();
};
// function - add video, poster, all sources and subs to playlist
LBPlayer.prototype.addToPlaylist = function(pos, p, src, srcs, subs) {
	// create object
	var o = {poster: p, source: [src], sources: srcs, subs: subs};
	// add object to playlist
	if(pos === 0) {this.playlist.reverse();}
	this.playlist.push(o);
	if(pos === 0) {this.playlist.reverse();}
};
// function - draw playlist content window
LBPlayer.prototype.drawPlaylistMenu = function() {
	var vid = this.options.vid, self = this;
	// create controls popup, only one time
	if(LBPlayer.$(vid+"_playlist_nav")){while(LBPlayer.$(vid+"_playlist_nav").hasChildNodes()) {LBPlayer.$(vid+"_playlist_nav").removeChild(LBPlayer.$(vid+"_playlist_nav").firstChild);}}
	else {LBPlayer.createHTMLEl(vid+"_playlist_control_inner", "div", {id: vid+"_playlist_nav", className: "playlist_nav"});}
	var items = this.playlist, items_l = parseInt(LBPlayer.getElemStyle(vid+"_fullscreen_control", "width"),10), video_w = parseInt(parseInt(LBPlayer.getElemStyle(vid, "width"),10)-(2*items_l),10), items_w = 0, items_r = 1, items_c = 0;
	var c = 1;
	for(var i=0; i<items.length; i++) {
		var source = items[i].source;
		for(var j=0; j<items.length; j++) {
			if((this.vars.canPlayType[this.vars.isBrowser]).test(source[j])) {
				var new_w = 88, new_h = 50;
				LBPlayer.createHTMLEl(vid+"_playlist_nav", "img", {id: vid+"_playlist_item_"+i, src: items[i].poster,  height: new_h, width: new_w, onclick: function() {self.playPlaylistItem(this.id)}, title: LBPlayer.Lang[this.vars.browserLanguage].Playlist_to+c+" ("+source[j]+")"});
				if(this.vars.playableVideo.indexOf(source[j].substr(1, source[j].length)) !== -1) {
					LBPlayer.$(vid+"_playlist_item_"+i).style.backgroundColor = "red";
				}
				if(parseInt(items_w+new_w+parseInt(items_c*4),10) > parseInt(video_w-new_w, 10)) {
					items_w += 0;
					if(items_c === 0) {items_c = LBPlayer.$(vid+"_playlist_nav").childNodes.length-1;}
				} else {
					items_w += new_w+4;
				}
				if(((LBPlayer.$(vid+"_playlist_nav").childNodes.length-1) % items_c) == 0) {
					items_r++;
				}
				c++;
				break;
			}
		}
	}
	// fix playlist position and width
	LBPlayer.$(vid+"_playlist_nav").style.width = items_w+"px";
	LBPlayer.$(vid+"_playlist_nav").style.height = parseInt((items_r*new_h+(items_c*4)),10)+"px";
	LBPlayer.$(vid+"_playlist_nav").style.top = "-"+parseInt(LBPlayer.getElemOffsetHeight(vid+"_playlist_nav")+10,10)+"px";
	LBPlayer.$(vid+"_playlist_nav").style.right = parseInt(items_l+1,10)+"px";
};
// function - play a playlist item
LBPlayer.prototype.playPlaylistItem = function(i) {
	var vid = this.options.vid;
	if(i == "+") {if((this.playlist.length-1) > this.vars.playlistItem) {this.vars.playlistItem++} else {return;}}
	else if(i == "-") {if(this.vars.playlistItem > 0) {this.vars.playlistItem--;} else {return;}}
	else {
		i = i.toString().replace(vid+"_playlist_item_", "");
		this.vars.playlistItem = parseInt(i, 10);
	}
	// pause active video
	if(!this.vObj.paused) {this.vObj.pause();}
	// reset subs
	this.setSubtitle(false);
	this.vars.activeSub = null;
	this.vars.subs = null;
	// load selected playlist item
	this.nextPlaylistItem();
};
// function - add video, poster and all sources to playlist
LBPlayer.prototype.nextPlaylistItem = function() {
	var vid = this.options.vid;
	var item = this.playlist[this.vars.playlistItem], sources = [];
	// get sources
	for(var i=0; i<item.source.length; i++) {
		if((this.vars.canPlayType[this.vars.isBrowser]).test(item.source[i])) {
			// set source
			this.vars.playableVideo = item.source[i];
			var src = ((this.vObj.autoplay) ? item.source[i] : "null");
			LBPlayer.mergeObjs(this.vObj, {src: src}); try{this.vObj.load();}catch(ex){/*IE9 doesn't like "load()" here*/}
			// set poster
			this.vObj.poster = item.poster;
			this.vars.poster.src = item.poster;
			// resize poster to video window
			this.setPoster();
			// reset loaded + buffered-bar
			this.vars.loaded = 0;
			LBPlayer.$(vid+"_progress_bar_buffered").style.width = "0px";
			// add source to sources
			sources.push({src: item.source[i]});
			break;
		}
	}
	for(var j=0; j<item.sources.length; j++) {
		if(!LBPlayer.inArray(sources, item.sources[j].src) && (this.vars.canPlayType[this.vars.isBrowser]).test(item.sources[j].src)) {
			sources.push({src: item.sources[j].src});
		}
	}
	if(sources.length > 1) {this.vars.playableSources = sources;}
	/*-----------------------*/
	// function - fix "preload" attribute issue
	this.fixPreloading();
	// get subs if necessary
	if(!this.playlist[this.vars.playlistItem].subs && this.playlist[this.vars.playlistItem].subtitles){this.getSubs(this.playlist[this.vars.playlistItem].subtitles);}
	else if(this.playlist[this.vars.playlistItem].subs !== null) {this.vars.activeSub = -1; this.vars.subs = this.playlist[this.vars.playlistItem].subs; this.setActiveSubs();}
	/*-----------------------*/
	// reset autoplay var
	if(this.vObj.autoplay) {this.vars.autoplay = true;}
	/*-----------------------*/
	// redraw controls
	this.resetControls(); this.addControls();
	/*-----------------------*/
	// function - init sources
	if(!LBPlayer.isIPad() && this.vars.playableSources.length > 1 && this.options.sourcesSwitch) {this.initializeSources();}
};
// function - if seeking in video
LBPlayer.prototype.onSeeking = function(e) {
	var vid = this.options.vid, self = this;
	if(!(this.vars.canPlayType[this.vars.isBrowser]).test(this.vObj.currentSrc)) {LBPlayer.hideEl(vid+"_big_play_button"); this.fixLoadingSource("onSeeking", e, null); return;}
	// show spinner
	this.setSpinner(true);
	// calculate seeking position
	var o = LBPlayer.$(vid+"_progress_bar_bg"); var pLeft = o.offsetLeft;
	while(o = o.offsetParent) {pLeft += o.offsetLeft;}
	var pos = Math.max(0, Math.min(1, (e.clientX - pLeft) / LBPlayer.$(vid+"_progress_bar_bg").offsetWidth));
	if(this.vObj.ended) {this.vObj.play(); this.vObj.pause();}
	try{
		this.vObj.currentTime = parseFloat(this.vObj.duration * pos);
		// following of try and catch blocks only for safari when seeking to prevent "INDEX_SIZE_ERROR" and hiding spinner too early
		if(this.vars.seeking.proc !== null) {
			if(this.vars.seeking.playing){this.vObj.play();this.vars.seeking.playing=false;}
			clearInterval(this.vars.seeking.proc);this.vars.seeking.proc=null;this.onSeeked();
		}
	}catch(ex){
		if(this.vObj.buffered && (parseFloat(this.vObj.duration * pos) > parseFloat(this.vObj.buffered.end(0)/this.vObj.duration))) {
			if(this.vars.seeking.proc === null) {if(!this.vObj.paused){this.vars.seeking.playing=true;this.vObj.pause();}}
			clearInterval(this.vars.seeking.proc); this.vars.seeking.proc = window.setInterval(function() {self.onSeeking(e);}, 350);
		}
	}
};
// function - if seeked to position
LBPlayer.prototype.onSeeked = function() {
	this.setPoster();
	// hide spinner
	this.setSpinner(false);
	// show/hide subtitle
	this.setSubtitle(this.vars.hideSubtitle);
};
// function - seek with jump (+/-) x sec.
LBPlayer.prototype.seekTo = function(s, sec) {
	// show spinner
	this.setSpinner(true);
	// calculate seek to in sec or percent
	var seek = ((sec) ? this.options.seekSkipSec : parseFloat((this.vObj.duration*(this.options.seekSkipPerc/100))));
	this.vObj.currentTime = ((s == "+") ? parseFloat(this.vObj.currentTime + seek) : parseFloat(this.vObj.currentTime - seek));
	// show/hide subtitle
	this.setSubtitle(this.vars.hideSubtitle);
};
// function - set volume and draw volume-controls
LBPlayer.prototype.setVolume = function(v) {
	var vid = this.options.vid;
	if(v == "+" && this.options.volume <= 8) {v = parseInt(this.options.volume+1, 10);}
	else if(v == "-" && this.options.volume > 0) {v = parseInt(this.options.volume-1, 10);}
	else if(v === null) {if(this.options.volume === 0) {v = 8;} else {v = 0;}}
	else if(isNaN(v)) {
		if(v.length > 1) { v = parseInt(v.charAt(v.length-1), 10); }
		else { v = this.options.volume; }
	}
	// set css classes
	for(var i=1; i<=8; i++) {LBPlayer.$(vid+"_vol"+i).setAttribute("class", "isnot");}
	for(var j = 1; j <= v; j++) {LBPlayer.$(vid+"_vol"+j).setAttribute("class", "is");}
	// 
	if(v === 0) {for(var k = 0; k <= 3; k++) {LBPlayer.$(vid+"_mute"+k).setAttribute("class", "isnot");}}
	else {for(var l = 0; l <= 3; l++) {LBPlayer.$(vid+"_mute"+l).setAttribute("class", "is");}}
	LBPlayer.showEl(vid+"_mute5"); LBPlayer.showEl(vid+"_mute6");
	switch(v) {
		case 0: this.vObj.volume = 0; LBPlayer.hideEl(vid+"_mute5"); LBPlayer.hideEl(vid+"_mute6"); break;
		case 1: this.vObj.volume = 0.125; LBPlayer.hideEl(vid+"_mute5"); LBPlayer.hideEl(vid+"_mute6"); break;
		case 2: this.vObj.volume = 0.25; LBPlayer.hideEl(vid+"_mute5"); LBPlayer.hideEl(vid+"_mute6"); break;
		case 3: this.vObj.volume = 0.375; LBPlayer.hideEl(vid+"_mute5"); LBPlayer.hideEl(vid+"_mute6"); break;
		case 4: this.vObj.volume = 0.5; LBPlayer.hideEl(vid+"_mute6"); break;
		case 5: this.vObj.volume = 0.625; LBPlayer.hideEl(vid+"_mute6"); break;
		case 6: this.vObj.volume = 0.75; LBPlayer.hideEl(vid+"_mute6"); break;
		case 7: this.vObj.volume = 0.875; break;
		case 8: this.vObj.volume = 1; break;
	}
	this.options.volume = v;
	var self = this;
	if(v === 0) { LBPlayer.mergeObjs(LBPlayer.$(vid+"_mute"), {onclick: function() {self.setVolume(8);}}); LBPlayer.$(vid+"_mute").setAttribute("title", LBPlayer.Lang[this.vars.browserLanguage].UnMute); }
	else { LBPlayer.mergeObjs(LBPlayer.$(vid+"_mute"), {onclick: function() {self.setVolume(0);}}); LBPlayer.$(vid+"_mute").setAttribute("title", LBPlayer.Lang[this.vars.browserLanguage].Mute); }
};
// function - set playback-rate; HINT: not supported by Opera 10.60+ (http://dev.opera.com/articles/view/everything-you-need-to-know-about-html5-video-and-audio/)
LBPlayer.prototype.setPlaybackRate = function(pbr, txt) {
	var vid = this.options.vid;
	this.vObj.playbackRate = pbr;
	LBPlayer.$(vid+"_playback_control_inner").childNodes[0].textContent = txt;
};
// function - check if enterFullscreen possible (Webkit??) - Only a placeholder at the moment
LBPlayer.prototype.onFullscreen = function() {
	if(this.vObj.webkitSupportsFullscreen && (typeof(this.vObj.webkitEnterFullscreen) !== "undefined")) {
		// to be implemented if ready in browser(s)
		this.vObj.webkitEnterFullscreen();
	}
};
// function - switch between smallscreen- and window-fullscreen-video
LBPlayer.prototype.setScreen = function(fs) {
	var vid = this.options.vid;
	// if webkit-Fullscreen is supported
	if(this.vars.activeSub === null && (this.vObj.webkitSupportsFullscreen && (typeof(this.vObj.webkitEnterFullscreen) !== "undefined"))) { this.onFullscreen(); return;}
	if(fs) {
		// go to window position 0,0
		window.scrollTo(0,0);
		// remove css class and reset to fullscreen
		(LBPlayer.$(vid).parentNode).removeAttribute("class");
		(LBPlayer.$(vid).parentNode).setAttribute("class", "h5_lb_player h5_lb_fullscreen");
		// get browser dimensions
		var bsXY = LBPlayer.getBrowserSizeXY();
		var pXY = LBPlayer.getPageSizeXY();
		// set video element dimensions
		LBPlayer.$(vid).style.width = parseInt(pXY.width, 10)+"px"; LBPlayer.$(vid).style.height = parseInt(bsXY.height, 10)+"px";
		// set player div
		(LBPlayer.$(vid).parentNode).style.height = LBPlayer.$(vid).offsetHeight+"px"; (LBPlayer.$(vid).parentNode).style.width = LBPlayer.$(vid).offsetWidth+"px";
		// set video to in-browser fullscreen
		this.vObj.width = parseInt(pXY.width, 10); this.vObj.height = parseInt(bsXY.height, 10);
		// video is fullscreen
		this.vars.fullscreen = true;
	} else {
		// resize and set Video
		this.resizeVideo();
		// set video in browser-focus
		if(LBPlayer.$(vid).focused) {this.setVideoToFocus(vid);}
		// style outer html5_player div
		(LBPlayer.$(vid).parentNode).removeAttribute("class");
		(LBPlayer.$(vid).parentNode).setAttribute("class", "h5_lb_player h5_lb_smallscreen");
		// video is not fullscreen
		this.vars.fullscreen = false;
		// set video focused
		this.setVideoToFocus(vid);
	}
	if(this.vars.showControls && this.vars.hasControls) {
		// add controls
		this.addControls();
		// redraw progress bar and timer
		this.drawProgressBar();this.drawProgressTimer();
		// redraw fullscreen icon
		this.drawFullscreenIcon();
	}
	// show controls to get playlist feature active
	if(this.playlist.length > 0) {
		// show controls
		this.setControls(true);
		// add controls
		this.addControls();
	} else {
		// hide controls
		this.setControls(false);
	}
	// set poster if available
	this.setPoster();
};
// function - set up poster if available
LBPlayer.prototype.setPoster = function() {
	var vid = this.options.vid;
	if(!this.vars.poster) {return;}
	// on playing hide poster
	if(!this.vObj.paused || parseFloat(this.vObj.currentTime) > 0 && parseFloat(this.vObj.currentTime) < parseFloat(this.vObj.duration)) {LBPlayer.hideEl(vid+"_poster");}
	// on ended reappear poster
	else if(this.options.posterRestore && parseFloat(this.vObj.currentTime) >= parseFloat(this.vObj.duration)) {LBPlayer.showEl(vid+"_poster");}
	// on stoped reappear poster
	else if(this.options.posterRestore && (this.vars.stoped || parseInt(this.vObj.currentTime, 10) === 0)) {LBPlayer.showEl(vid+"_poster");}
	// fit poster size to video size
	this.sizePoster();
	// add attributes
	var self = this;
	LBPlayer.mergeObjs(this.vars.poster, {onclick: function() {self.onPlay();}});
	LBPlayer.mergeObjs(this.vars.poster, {onmousemove: function() {self.setControlsTask();}});
};
// function - fit poster size to video size, if poster available
LBPlayer.prototype.sizePoster = function() {
    if(this.vars.poster === false || this.vars.poster.style.display == 'none') {return;}
    this.vars.poster.style.height = parseInt(parseInt(this.vObj.height, 10), 10) + "px";
    this.vars.poster.style.width = parseInt(parseInt(this.vObj.width, 10), 10) + "px";
};
// function - draw fullscreen-icon
LBPlayer.prototype.drawFullscreenIcon = function() {
	var vid = this.options.vid;
	if(this.vars.fullscreen) {
		LBPlayer.hideEl(vid+"_fullscreen_control_fs1"); LBPlayer.showEl(vid+"_fullscreen_control_fs2");
		LBPlayer.$(vid+"_fullscreen_control").onmouseover = function() { LBPlayer.showEl(vid+"_fullscreen_control_fs1"); LBPlayer.hideEl(vid+"_fullscreen_control_fs2"); };
		LBPlayer.$(vid+"_fullscreen_control").onmouseout = function() { LBPlayer.hideEl(vid+"_fullscreen_control_fs1"); LBPlayer.showEl(vid+"_fullscreen_control_fs2"); };
		LBPlayer.$(vid+"_fullscreen_control").setAttribute("title", LBPlayer.Lang[this.vars.browserLanguage].Smallscreen);
	} else {
		LBPlayer.showEl(vid+"_fullscreen_control_fs1"); LBPlayer.hideEl(vid+"_fullscreen_control_fs2");
		LBPlayer.$(vid+"_fullscreen_control").onmouseover = function() { LBPlayer.hideEl(vid+"_fullscreen_control_fs1"); LBPlayer.showEl(vid+"_fullscreen_control_fs2"); };
		LBPlayer.$(vid+"_fullscreen_control").onmouseout = function() { LBPlayer.showEl(vid+"_fullscreen_control_fs1");	LBPlayer.hideEl(vid+"_fullscreen_control_fs2"); };
		LBPlayer.$(vid+"_fullscreen_control").setAttribute("title", LBPlayer.Lang[this.vars.browserLanguage].Fullscreen);
	}
};
// function - hide controls after x ms  (set through options)
LBPlayer.prototype.setControlsTask = function() {
	if(!(this.vars.canPlayType[this.vars.isBrowser]).test(this.vObj.currentSrc) || (parseInt(this.vObj.currentTime, 10) === 0 || parseFloat(this.vObj.currentTime) >= parseFloat(this.vObj.duration))) {return;}
	var vid = this.options.vid;
	// show controls
	this.setControls(true);
	// hide controls delayed
	if(this.options.hideControls) {
		clearInterval(this.vars.mouseMoveTimeout);
		var self = this; this.vars.mouseMoveTimeout = setInterval(function(){ 
			// hide controls
			self.setControls(false);
			clearInterval(self.vars.mouseMoveTimeout); }, parseInt(self.options.hideControlsTimeout*1000, 10));
	}
};
// function - helper for seeking, sets also the timer-bar to the progress-bar
LBPlayer.prototype.getProgressPosition = function(e) {
	var vid = this.options.vid;
	var o = LBPlayer.$(vid+"_progress_bar_bg");
	var pLeft = o.offsetLeft;
	while(o = o.offsetParent) {pLeft += o.offsetLeft;}
	// calculate mousedown-position
	var pos = Math.max(0, Math.min(1, (e.clientX - pLeft) / parseInt(LBPlayer.$(vid+"_progress_bar_bg").style.width, 10)));
	// timer-bar in progress-bar
	if(!isNaN(this.vObj.duration) && parseFloat(this.vObj.duration) > 0.00) {
		LBPlayer.showEl(vid+"_progress_bar_time");
		LBPlayer.$(vid+"_progress_bar_time_txt").innerHTML = this.parseTimer(parseFloat(this.vObj.duration * pos));
		LBPlayer.$(vid+"_progress_bar_time_txt").style.left = parseInt(parseInt(LBPlayer.$(vid+"_progress_bar_bg").style.width, 10) * pos - 18, 10)+"px";
		LBPlayer.$(vid+"_progress_bar_time_line").style.left = parseInt(parseInt(LBPlayer.$(vid+"_progress_bar_bg").style.width, 10) * pos - 2, 10)+"px";
	}
};
// function - if browser supports progress-event (Firefox)
LBPlayer.prototype.onProgress = function(e) {
	if(this.vObj.buffered) {this.onBuffering(); return;}
	if(e.total > 0) { this.vars.loaded = e.loaded/e.total; this.drawProgressBar(); }
};
// function - if browsers not support the progress-event (Opera, Google Chrome, Safari)
LBPlayer.prototype.onBuffering = function(){
	if(this.vObj.buffered) {
		if((this.vars.canPlayType[this.vars.isBrowser]).test(this.vObj.currentSrc)) {
			// fix: if streaming media buffering.end(0)=0
			if(this.vObj.buffered.length >= 1 && this.vObj.buffered.end(0) > 0) {
				this.vars.loaded = parseFloat(this.vObj.buffered.end(0)/this.vObj.duration); this.drawProgressBar();
				if (this.vObj.buffered.end(0) == this.vObj.duration) {clearInterval(this.vars.proc);}
			} else if(this.vObj.buffered.length >= 1 && this.vObj.buffered.end(0) === this.vObj.duration) {this.vars.loaded = 1; this.drawProgressBar(); clearInterval(this.vars.proc);}
		} else {return;}
    } else {clearInterval(this.vars.proc);}
};
// function - draw progress-bar
LBPlayer.prototype.drawProgressBar = function() {
	var vid = this.options.vid;
	LBPlayer.$(vid+"_progress_bar_buffered").style.width = parseInt(parseInt(parseInt(LBPlayer.$(vid+"_progress_control").style.width, 10)*parseFloat(this.vars.loaded), 10)-22, 10)+"px";
};
// function - draw progress-timer
LBPlayer.prototype.drawProgressTimer = function() {
	var vid = this.options.vid;
	LBPlayer.$(vid+"_progress_bar_played").style.width = parseInt(parseFloat(parseInt(LBPlayer.$(vid+"_progress_bar_bg").style.width, 10)*parseFloat(this.vObj.currentTime)).toFixed(2)/parseFloat(this.vObj.duration).toFixed(2), 10)+"px";
	LBPlayer.$(vid+"_timer_control_inner").innerHTML = "00:00 / 00:00";
	if((this.vars.canPlayType[this.vars.isBrowser]).test(this.vObj.currentSrc)) {
		LBPlayer.$(vid+"_timer_control_inner").innerHTML = ((parseFloat(this.vObj.currentTime).toFixed(2) === 0.00) ? "00:00 / "+(isNaN(this.vObj.duration) ? "00:00" : this.parseTimer(this.vObj.duration)) : this.parseTimer(this.vObj.currentTime)+" / "+(isNaN(this.vObj.duration) ? "00:00" : this.parseTimer(this.vObj.duration)));
	}
};
// function - parse time to correct output-format
LBPlayer.prototype.parseTimer = function(t) {
	var e;
	if(parseInt(t/60, 10) >= 0 && parseInt(t/60, 10) < 10) {e = "0"+this.getTimer(t);} else {e = this.getTimer(t);}
	return e;
};
// function - calculate correct time-format mm:ss
LBPlayer.prototype.getTimer = function(sec) {
    return Math.floor(sec/60)+":"+((parseInt(sec % 60, 10) < 10) ? "0"+parseInt(sec % 60, 10) : parseInt(sec % 60, 10));
};
// function - show/hide subtitle if available
LBPlayer.prototype.setSubtitle = function(v) {
	var vid = this.options.vid;
	if(v && this.vars.activeSub !== null) { LBPlayer.$(vid+"_subtitles").innerHTML = ""; LBPlayer.showEl(vid+"_subtitles"); this.vars.hideSubtitle = false; }
	else if(!v && this.vars.activeSub !== null){ LBPlayer.$(vid+"_subtitles").innerHTML = ""; LBPlayer.hideEl(vid+"_subtitles"); this.vars.hideSubtitle = true; this.vars.activeSubId = -1; }
};
// function - get next available subtitle
LBPlayer.prototype.nextSubtitle = function() {
	var subs = [], i = 0, al = null, nl = 0;
	for(var t in this.vars.subs) {if(typeof(this.vars.subs[t]) === "function"){continue;} if(t === this.vars.activeSubLang) { al = i; } subs[i] = t; i++;}
	for(var j=0, k=subs.length; j<k;j++) {if(subs[j+1] === null) { nl = 0; break; } else if(j > al) { nl = j; break; }}
	i = 0;
	for(var u in this.vars.subs) {if(typeof(this.vars.subs[u]) === "function"){continue;} if(i === nl) { al = u; } i++;}
	this.vars.activeSubLang = al;
	i = 0;
	for(var v in this.vars.subs[this.vars.activeSubLang].track) {
		if(typeof(this.vars.subs[this.vars.activeSubLang].track[v]) === "function"){continue;}
		this.vars.activeSub[i] = this.vars.subs[this.vars.activeSubLang].track[v];
		i++;
	}
};
// function - draw subtitle
LBPlayer.prototype.drawSubtitles = function() {
	var vid = this.options.vid;
	if(this.vars.hideSubtitle || (this.vars.activeSub !== null && (this.vObj.currentTime > this.vars.activeSub[parseInt(this.vars.activeSub.length-1, 10)].to || parseFloat(this.vObj.currentTime) >= parseFloat(this.vObj.duration)))) {
		this.setSubtitle(false);
	} else if(this.vars.activeSub !== null) {
		for(var s in this.vars.activeSub) {
			if(typeof(this.vars.activeSub[s]) === "function"){continue;}
			// get current subtitle
			if(this.vars.activeSub[s].from >= this.vObj.currentTime && this.vObj.currentTime <= this.vars.activeSub[s].to) {
				break;
			}
			// show current subtitle
			if(parseFloat(this.vars.activeSubId) <= parseFloat(s)) {
				LBPlayer.showEl(vid+"_subtitles");
				this.vars.activeSubId = s;
				LBPlayer.$(vid+"_subtitles").innerHTML = this.vars.activeSub[s].txt;
			}
			// don't show subtitles in times where no subtitle is set
			if(this.vars.activeSubId >= 0 && this.vObj.currentTime > this.vars.activeSub[this.vars.activeSubId].to) {
				LBPlayer.$(vid+"_subtitles").innerHTML = "";
			}
		}
	}
};
// function - load subtitle
LBPlayer.prototype.getSubs = function(tr) {
	var vid = this.options.vid;
	// get all track-elements
	var tracks = [];
	if(!tr){
		tracks = LBPlayer.$(vid).getElementsByTagName("track");
	} else {
		// create tracks from tr
		for(var s=0; s<tr.length; s++) {
			var track = document.createElement("track");
			track.setAttribute("kind", tr[s].kind); track.setAttribute("label", tr[s].label); track.setAttribute("srclang", tr[s].srclang); track.setAttribute("type", tr[s].type); track.setAttribute("src", tr[s].src);
			tracks.push(track);
		}
	}
	if(tracks.length > 0){this.vars.subs = [];}
	for(var i = 0; i < tracks.length; i++) {
		// check if track has kind-attribute of value "subtitles"
		if(tracks[i].hasAttribute("kind") && tracks[i].getAttribute("kind").toLowerCase() === "subtitles") {
			// only one track/caption per language at the moment
			var src = tracks[i].getAttribute("src");
			var srclang = tracks[i].getAttribute("srclang");
			var label = tracks[i].getAttribute("label");
			if(!this.vars.subs[srclang]) {
				switch(tracks[i].getAttribute("type")) {
					case "text/plain":
					case "text/x-srt":
					case "application/x-subrip": this.resolveTextPlainSubs(src, srclang, label); break;
					case "application/vobsub": this.resolveTextPlainSubs(src, srclang, label); break;
					case "application/xml": this.resolveXMLSubs(src, srclang, label); break;
					case "application/ttaf+xml": this.resolveXMLTTSubs(src, srclang, label); break;
				}
			}
		}
	}
	if(tr){this.playlist[this.vars.playlistItem].subs = this.vars.subs; this.vars.activeSub = -1; delete(this.playlist[this.vars.playlistItem].subtitles);}
	if(tracks.length > 0){this.setActiveSubs();}
};
// function - set activ subtitle
LBPlayer.prototype.setActiveSubs = function() {
	var j = 0, l = "";
	for(var t in this.vars.subs) {if(typeof(this.vars.subs[t]) === "function"){continue;} j++; if(l===""){l=t; break;}}
	if(this.vars.subs[this.vars.browserLanguage]) {
		this.vars.activeSubLang = this.vars.browserLanguage;
		this.vars.hideSubtitle = false;
		var k = 0;
		for(var u in this.vars.subs[this.vars.activeSubLang].track) {
			if(typeof(this.vars.subs[this.vars.activeSubLang].track[u]) === "function"){continue;}
			if(k === 0) {this.vars.activeSub = [];}
			this.vars.activeSub[k] = this.vars.subs[this.vars.activeSubLang].track[u];
			k++;
		}
		return;
	} else if(this.vars.subs[this.options.defaultLanguage]) {
		this.vars.activeSubLang = this.options.defaultLanguage;
		this.vars.hideSubtitle = false;
		var m = 0;
		for(var v in this.vars.subs[this.vars.activeSubLang].track) {
			if(typeof(this.vars.subs[this.vars.activeSubLang].track[v]) === "function"){continue;}
			if(m === 0) {this.vars.activeSub = [];}
			this.vars.activeSub[m] = this.vars.subs[this.vars.activeSubLang].track[v];
			m++;
		}
		return;
	} else if(j > 0) {
		this.vars.hideSubtitle = false;
		var n = 0;
		this.vars.activeSubLang = l;
		for(var w in this.vars.subs[this.vars.activeSubLang].track) {
			if(typeof(this.vars.subs[this.vars.activeSubLang].track[w]) === "function"){continue;}
			if(n === 0) {this.vars.activeSub = [];}
			this.vars.activeSub[n] = this.vars.subs[this.vars.activeSubLang].track[w];
			n++;
		}
		return;
	}
};
// function - draw subtitle menu items
LBPlayer.prototype.drawSubsMenu = function() {
	var vid = this.options.vid;
	var self = this; 
	LBPlayer.createHTMLEl(vid+"_subtitle_control_inner", "div", {id: vid+"_subtitle_nav", className: "subtitle_nav"});
	LBPlayer.$(vid+"_subtitle_nav").style.top = "-12px";
	
	var i = 1;
	for(var t in this.vars.subs) {
		if(typeof(this.vars.subs[t]) === "function"){continue;}
		if(LBPlayer.$("subs_"+t) === null) {
			LBPlayer.createHTMLEl(vid+"_subtitle_nav", "div", {id: vid+"_subs_"+t, innerHTML: this.vars.subs[t].label});
			LBPlayer.mergeObjs(LBPlayer.$(vid+"_subs_"+t+""), {title: LBPlayer.Lang[this.vars.browserLanguage].Subtitle_to+self.vars.subs[t].label, onclick: function() {self.vars.hideSubtitle = false; LBPlayer.showEl(vid+"_subtitles"); self.resetSubs(this.id);}});
		}
		i++;
	}
	LBPlayer.createHTMLEl(vid+"_subtitle_nav", "div", {id: vid+"_subs_off", innerHTML: LBPlayer.Lang[this.vars.browserLanguage].Subtitle_set, title: LBPlayer.Lang[this.vars.browserLanguage].Subtitle_onoff, onclick: function() {self.setSubtitle(false);}});
	LBPlayer.$(vid+"_subtitle_nav").style.top = "-"+parseInt(parseInt(i*parseInt(LBPlayer.getElemStyle(vid+"_subs_off", "height"), 10), 10)+5, 10)+"px";
};
// function - reset subtitle on user-click
LBPlayer.prototype.resetSubs = function(lang) {
	var vid = this.options.vid;
	lang = lang.replace(vid+"_subs_", "");
	if(this.vars.subs[lang]) {
		this.vars.activeSubLang = lang;
		var i = 0;
		for(var t in this.vars.subs[this.vars.activeSubLang].track) {
			if(typeof(this.vars.subs[this.vars.activeSubLang].track[t]) === "function"){continue;}
			this.vars.activeSub[i] = this.vars.subs[this.vars.activeSubLang].track[t];
			i++;
		}
	}
};
// function - resolve srt/vobsub-subtitle
LBPlayer.prototype.resolveTextPlainSubs = function(src, lang, label) {
	var xhr = LBPlayer.XHR(src);
	if(xhr.status == 404) {return;}
	var srt = xhr.responseText;
	srt = this.trimSubs(srt.replace(/\r\n|\r|\n/g, '\n'));
	srt = srt.split('\n\n');
	var i = 0; var isSub = false;
	this.vars.subs[lang] = {};
	this.vars.subs[lang].label = {};
	this.vars.subs[lang].label = label;
	this.vars.subs[lang].track = {};
	for(var s in srt) {
		if(typeof(srt[s]) === "function"){continue;}
		var st = srt[s].split('\n');
		var time; var j;
		if(st.length >= 2) {
			var t = "";
			var regex_srt = /^(\d{2}:\d{2}:\d{2},\d{3}) --> (\d{2}:\d{2}:\d{2},\d{3})$/;
			var regex_sbv_sub = /^(\d{1,2}:\d{2}:\d{2}.\d{3}),(\d{1,2}:\d{2}:\d{2}.\d{3})$/;
			if(regex_srt.test(st[1])) {	// .srt
				time = regex_srt.exec(st[1]);
				j = 2;
				isSub = true;
			} else if(regex_sbv_sub.test(st[0])) { // .sbv + .sub
				time = regex_sbv_sub.exec(st[0]);
				j = 1;
				isSub = true;
			}
			if(isSub) {
				for(j; j < st.length; j++) { t += st[j]+'\n'; }
				if(t !== "") {
					this.vars.subs[lang].track[i] = {};
					LBPlayer.mergeObjs(this.vars.subs[lang].track[i], {from: this.toSecSubs(time[1]), to: this.toSecSubs(time[2]), txt: this.wrapSubs(t)});
					i++;
				}
			}
		}
	}
};
// function - resolve xml-subtitle
LBPlayer.prototype.resolveXMLSubs = function(src, lang, label){
	var xhr = LBPlayer.XHR(src);
	if(xhr.status == 404) {return;}
	var srt = (new DOMParser()).parseFromString(xhr.responseText, "text/xml");
	var s, st, id, tf, tt, t = "";
	this.vars.subs[lang] = {};
	this.vars.subs[lang].label = {};
	this.vars.subs[lang].label = label;
	this.vars.subs[lang].track = {};
	for(s in srt.childNodes[0].childNodes) {
		if(typeof(srt.childNodes[0].childNodes[s]) === "function"){continue;}
		if(!isNaN(s)) {
			for(st in srt.childNodes[0].childNodes[s].childNodes) {
				if(typeof(srt.childNodes[0].childNodes[s].childNodes[st]) === "function"){continue;}
				if(!isNaN(st)) {
					switch(srt.childNodes[0].childNodes[s].childNodes[st].tagName) {
						case "id": id = parseInt(srt.childNodes[0].childNodes[s].childNodes[st].textContent, 10); break;
						case "from": tf = this.toSecSubs(srt.childNodes[0].childNodes[s].childNodes[st].textContent); break;
						case "to": tt = this.toSecSubs(srt.childNodes[0].childNodes[s].childNodes[st].textContent); break;
						case "text": t = this.wrapSubs(this.trimSubs(srt.childNodes[0].childNodes[s].childNodes[st].textContent)); break;
					}
				}
			}
			if(id !== undefined) {
				this.vars.subs[lang].track[id] = {};
				LBPlayer.mergeObjs(this.vars.subs[lang].track[id], {from: tf, to: tt, txt: t});
			}
		}
	}
};
// function - resolve xml_ttai1-subtitle
LBPlayer.prototype.resolveXMLTTSubs = function(src, lang, label){
	var xhr = LBPlayer.XHR(src);
	if(xhr.status == 404) {return;}
	var srt = (new DOMParser()).parseFromString(xhr.responseText, "text/xml");
	var i = 0, s, st, stp, tf, tt, t = "";
	this.vars.subs[lang] = {};
	this.vars.subs[lang].label = {};
	this.vars.subs[lang].label = label;
	this.vars.subs[lang].track = {};
	for(s in srt.childNodes[0].childNodes) {
		if(typeof(srt.childNodes[0].childNodes[s]) === "function"){continue;}
		if(!isNaN(s) && srt.childNodes[0].childNodes[s].tagName == "body") {
			for(st in srt.childNodes[0].childNodes[s].childNodes) {
				if(typeof(srt.childNodes[0].childNodes[s].childNodes[st]) === "function"){continue;}
				if(!isNaN(st) && srt.childNodes[0].childNodes[s].childNodes[st].tagName == "div") {
					for(stp in srt.childNodes[0].childNodes[s].childNodes[st].childNodes) {
						if(typeof(srt.childNodes[0].childNodes[s].childNodes[st].childNodes[stp]) === "function"){continue;}
						if(!isNaN(st) && srt.childNodes[0].childNodes[s].childNodes[st].childNodes[stp].tagName == "p") {
							tf = this.toSecSubs(srt.childNodes[0].childNodes[s].childNodes[st].childNodes[stp].getAttribute("begin"));
							tt = this.toSecSubs(srt.childNodes[0].childNodes[s].childNodes[st].childNodes[stp].getAttribute("end"));
							t = this.wrapSubs(this.trimSubs(srt.childNodes[0].childNodes[s].childNodes[st].childNodes[stp].textContent));

							this.vars.subs[lang].track[i] = {};
							LBPlayer.mergeObjs(this.vars.subs[lang].track[i], {from: tf, to: tt, txt: t});
							i++;
						}
					}
				}
			}
		}
	}
};
// function - trim srt-subtitle, replace whitespace at begin/end
LBPlayer.prototype.trimSubs = function(txt) {
	return txt.replace(/(^\s+|\s+$)/g, "");
};
// function - wrap srt-subtitle
LBPlayer.prototype.wrapSubs = function(txt) {
	return txt.replace("\n", "<br/>");
};
// function - get subtitle-time in seconds
LBPlayer.prototype.toSecSubs = function(t) {
    var s = 0.0;
    if(t) {
		var p = t.split(':');
		for(var i = 0; i < p.length; i++) {s = s * 60 + parseFloat(p[i].replace(',', '.'));}
    }
    return s;
};
// function - do something if special keys pressed
LBPlayer.prototype.onKeydown = function(e) {
	LBPlayer.onKeyAction = false;
	var vid = this.options.vid;
	
	if(LBPlayer.videoFocused == LBPlayer.$(vid)) {LBPlayer.isVideoEvent = true;}

	var kc  = ((window.event) ? event.keyCode : e.keyCode);	// MSIE or Firefox?
	var kTAB = ((window.event) ? 9 : e.DOM_VK_TAB);			// for TAB
	var kCRTL = ((window.event) ? 17 : e.DOM_VK_CONTROL);	// for CRTL & x
	var kALT = ((window.event) ? 18 : e.DOM_VK_ALT);		// for ALT & x
	var kESC = ((window.event) ? 27 : e.DOM_VK_ESCAPE);		// leave fullscreen
	var kSPACE = ((window.event) ? 32 : e.DOM_VK_SPACE);	// play
	var kEND = ((window.event) ? 35 : e.DOM_VK_END);		// END key
	var kHOME = ((window.event) ? 36 : e.DOM_VK_HOME);		// POS1 key
	var kLEFT = ((window.event) ? 37 : e.DOM_VK_LEFT);		// left, jump-
	var kUP = ((window.event) ? 38 : e.DOM_VK_UP);			// unmute
	var kRIGHT = ((window.event) ? 39 : e.DOM_VK_RIGHT);	// right, jump+
	var kDOWN = ((window.event) ? 40 : e.DOM_VK_DOWN);		// mute
	var kF = ((window.event) ? 70 : e.DOM_VK_F);			// window fullscreen
	var kN = ((window.event) ? 78 : e.DOM_VK_N);			// next video (from playlist)
	var kP = ((window.event) ? 80 : e.DOM_VK_P);			// next video from playlist
	var kS = ((window.event) ? 83 : e.DOM_VK_S);			// stop
	var kV = ((window.event) ? 86 : e.DOM_VK_V);			// show/hide subtitle; with CTRL: cycle through the available subtitles
	var kF11 = ((window.event) ? 122 : e.DOM_VK_F11);		// on Browser-fullscreen

	switch(kc) {
		case kTAB: if(!this.vars.fullscreen) {LBPlayer.onKeyAction = true; LBPlayer.isVideoEvent = false;} this.vars.keyHolderTAB = true; break;
		case kCRTL: this.vars.keyHolderCRTL = true; break;
		case kALT: this.vars.keyHolderALT = true; break;
		case kESC: this.setScreen(false); break;
		case kSPACE: this.onPlay(); break;
		case kEND: this.vObj.play(); this.vObj.currentTime = this.vObj.duration; break;
		case kHOME: this.vObj.pause(); this.onStop(); break;
		case kLEFT: if(this.vars.keyHolderCRTL) {this.seekTo("-", false);} else {this.seekTo("-", true);} break;
		case kRIGHT: if(this.vars.keyHolderCRTL) {this.seekTo("+", false);} else {this.seekTo("+", true);} break;
		case kUP: if(this.vars.keyHolderCRTL) {this.setVolume(8);} else {this.setVolume("+");} break;
		case kDOWN: if(this.vars.keyHolderCRTL) {this.setVolume(0);} else {this.setVolume("-");} break;
		case kF: this.setScreen(!this.vars.fullscreen); break;
		case kN: if(this.vars.keyHolderALT && !this.vars.fullscreen) {this.getNextVideo();} else {this.playPlaylistItem("+");} break;
		case kP: this.playPlaylistItem("-"); break;
		case kS: this.onStop(); break;
		case kV: if(this.vars.activeSub !== null) {if(this.vars.keyHolderCRTL) {this.nextSubtitle();} else {this.vars.hideSubtitle = !!this.vars.hideSubtitle; this.setSubtitle(this.vars.hideSubtitle);} } break;
		case kF11: LBPlayer.onKeyAction = true; LBPlayer.isVideoEvent = true; break;
		default: LBPlayer.onKeyAction = true; if(!this.vars.fullscreen){LBPlayer.isVideoEvent = false;} break;
	}
};
// function - do something if special keys released
LBPlayer.prototype.onKeyup = function(e) {
	var kc  = ((window.event) ? event.keyCode : e.keyCode);		// MSIE or Firefox?
	var kCRTL = ((window.event) ? 17 : e.DOM_VK_CONTROL);		// for CRTL & x
	var kALT = ((window.event) ? 18 : e.DOM_VK_ALT);			// for ALT & x
	switch(kc) {
		case kCRTL: this.vars.keyHolderCRTL = false; break;
		case kALT: this.vars.keyHolderALT = false; break;
	}
};
// function - try to find next suitable video element
LBPlayer.prototype.getNextVideo = function() {
	if(LBPlayer.videoFocused !== null) {
		var vid = LBPlayer.videoFocused.id;
		for(var i = 0, j=LBPlayers.length; i<j; i++) {
			if(vid === LBPlayers[i].options.vid && LBPlayers[parseInt(i+1, 10)] != "undefined") {
				this.setVideoToFocus(LBPlayers[parseInt(i+1, 10)].options.vid); return;
			} else {
				this.setVideoToFocus(LBPlayers[0].options.vid); return;
			}
		}
	}
};
// function - set video element in window focus
LBPlayer.prototype.setVideoToFocus = function(vid) {
	// if fullscreen
	if(this.vars.fullscreen) {return;}
	var el = LBPlayer.$(vid);
	if(el !== null) {
		if(LBPlayer.videoFocused !== null) {
			var ovid = LBPlayer.videoFocused.id;
			if(ovid !== vid) {
				// blur old video element
				LBPlayer.focusVideo(false, ovid);
				// focus new video element
				LBPlayer.focusVideo(true, vid);
			}
		} else {
			// focus new video element
			LBPlayer.focusVideo(true, vid);
		}
		// get position of focused video
		var selectedPosX = 0, selectedPosY = 0, top = 50;
		while(el !== null) {
			selectedPosX += el.offsetLeft;
			selectedPosY += el.offsetTop;
			el = el.offsetParent;
		}
		// scroll to focused video
		window.scrollTo(selectedPosX, selectedPosY - top);
	}
};
// function - create and set embed code
LBPlayer.prototype.createEmbedCode = function(type) {
	var vid = this.options.vid, isEmbedded = false;
	LBPlayer.$(vid+"_embed_code_user").innerHTML = "";
	// get domain url
	var url = self.location.href; // TODO: maybe document.URL??
	var pos_url = url.lastIndexOf('/');
	url = url.substring(0, pos_url+1);
	// create embed code for video
	var lbp = "";
	var jsCode = document.getElementsByTagName("script");
	for(var i=0, j=jsCode.length; i<j; i++) { if((jsCode[i].src).toLowerCase().indexOf('leanbackplayer') > -1) { 
		if ((jsCode[i].src).match(/(\?embed\s*)/)) {isEmbedded = true;}
		var pos_js = (jsCode[i].src).lastIndexOf('?');  // check for "?" when they are cached or embedded
		pos_js = ((pos_js > 0) ? pos_js : (jsCode[i].src).length);
		var jsSrc = (jsCode[i].src).substring(0, pos_js);
		var js = document.createElement("script");
		LBPlayer.mergeObjs(js, {type: "text/javascript", src: jsSrc+"?embed"});
		var p_js = document.createElement("div"); p_js.appendChild(js);
		if(!isEmbedded) {
			lbp += (p_js.innerHTML).replace(url, "");
		}
	}}
	var cssStyles = document.getElementsByTagName("link");
	for(var k=0, l=cssStyles.length; k<l; k++) { if((cssStyles[k].href).toLowerCase().indexOf('leanbackplayer') > -1) { 
		var pos_css = (cssStyles[k].href).lastIndexOf('?'); // check for "?" when they are cached
		pos_css = ((pos_css > 0) ? pos_css : (cssStyles[k].href).length);
		var cssHref = (cssStyles[k].href).substring(0, pos_css);
		var css = document.createElement("link");
		LBPlayer.mergeObjs(css, {rel: "stylesheet", media: "screen", type: "text/css", title: "theme", href: cssHref});
		var p_css = document.createElement("div"); p_css.appendChild(css);
		if(!isEmbedded) {
			lbp += (p_css.innerHTML).replace(url, "");
		}
	}}
	var txt = lbp+this.vars.embedCode;
	// change sources (href,src,poster)
	if(!isEmbedded) {
		txt = txt.replace(/(poster|src|href\s*)="/g, '$1="'+url);
		txt = txt.replace(/\/.\//g, '/');
		txt = txt.replace(/(\s)\s+/g, "$1");
		var re = new RegExp(url+""+url,"g");
		txt = txt.replace(re, url);
	}
	LBPlayer.showEl(vid+"_embed_code");
	switch(type) {
		case "video": LBPlayer.$(vid+"_embed_code_user").value = "<div>"+txt+"</div>"; LBPlayer.$(vid+"_embed_code_user").select(); break;
		case "url": LBPlayer.$(vid+"_embed_code_user").value = self.location.href; LBPlayer.$(vid+"_embed_code_user").select(); break;
	}
};
/** ------------------------------ */
// function - add event to given object
LBPlayer.addEvent = function(obj, type, fn) {
	if (obj.attachEvent) {
		obj['e'+type+fn] = fn;
		obj[type+fn] = function(){obj['e'+type+fn](window.event);};
		obj.attachEvent('on'+type, obj[type+fn]);
	} else {obj.addEventListener(type, fn, false);}
};
// function - remove event from given object
LBPlayer.removeEvent = function(obj, type, fn) {
	if(obj.detachEvent) {
		obj.detachEvent('on'+type, obj[type+fn]);
		obj[type+fn] = null;
	} else {obj.removeEventListener(type, fn, false);}
};
// function - create element and append element as child to object
LBPlayer.createHTMLEl = function(objId, tagName, attr){
	var el = document.createElement(tagName); el = LBPlayer.mergeObjs(el, attr);
	if(objId !== "" && objId !== null) {LBPlayer.$(objId).appendChild(el);}
	return el;
};
// function - merge two objects
LBPlayer.mergeObjs = function(obj1, obj2){ if(obj1 !== null) {for(var attrname in obj2) {obj1[attrname] = obj2[attrname];}} return obj1; };
// function - blur/focus video element
LBPlayer.focusVideo = function(f, vid) {
	// if fullscreen
	var o = LBPlayer.getObj(LBPlayers, vid);
	if(typeof o !== "undefined" && o.vars.fullscreen) {return;}
	var cssClass = "h5_lb_player h5_lb_smallscreen";
	if(f) {
		// focus video
		LBPlayer.$(vid).focused = true;
		(LBPlayer.$(vid).parentNode).removeAttribute("class");
		LBPlayer.mergeObjs((LBPlayer.$(vid).parentNode), {className: cssClass});
		LBPlayer.videoFocused = LBPlayer.$(vid);
	} else {
		// blur video
		LBPlayer.$(vid).focused = false;
		(LBPlayer.$(vid).parentNode).removeAttribute("class");
		LBPlayer.mergeObjs((LBPlayer.$(vid).parentNode), {className: cssClass+" h5_lb_unfocused"});
		LBPlayer.showEl(vid+"_big_play_button");
		// pause video when focused lost
		if(!o.vObj.paused) {o.onPlay();}
		// hide controls
		o.setControls(false);
		// hide subtitles
		o.setSubtitle(false);
		LBPlayer.videoFocused = null;
	}
};
// function - maybe used by IFrame embedding page
LBPlayer.scrollToVideo = function(vid) {
	var el = LBPlayer.$(vid);
	// get position of focused video
	var selectedPosX = 0, selectedPosY = 0, top = 50;
	while(el !== null) {
		selectedPosX += el.offsetLeft;
		selectedPosY += el.offsetTop;
		el = el.offsetParent;
	}
	// scroll to focused video
	window.scrollTo(selectedPosX, selectedPosY - top);
};
// function - get player by id from players-list
LBPlayer.getObj = function(parent, id) {
	if(id === null) {return;}
    for(var i = 0, j = LBPlayers.length; i<j; i++) {if(id.indexOf(LBPlayers[i].options.vid) !== -1) { return LBPlayers[i]; }}
};
// function - check if element e in array a
LBPlayer.inArray = function(ar, e) {
    for (var i=0; i<ar.length; i++) {
		if (ar[i] == e) {return true};
	}
	return false;
};
// function - get language of browsers
LBPlayer.getBrowserLanguage = function() {
	var bl = null;
	if(typeof(navigator.language) != "undefined") {
		bl = navigator.language;
		bl = (bl).substring(0, ((((bl).lastIndexOf('-')) > 0) ? ((bl).lastIndexOf('-')) : (bl).length));
	} else if(typeof(navigator.browserLanguage) != "undefined") {
		bl = navigator.browserLanguage;
		bl = (bl).substring(0, ((((bl).lastIndexOf('-')) > 0) ? ((bl).lastIndexOf('-')) : (bl).length));
	}
	return bl;
};
// function - get size of browser
LBPlayer.getBrowserSizeXY = function() {
	var intH = 0, intW = 0;
	if(typeof window.innerWidth  === 'number' ) { //Non-IE
		intH = window.innerHeight; intW = window.innerWidth;
	} else if(document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) { //IE 6+ in 'standards compliant mode'
		intH = document.documentElement.clientHeight; intW = document.documentElement.clientWidth;
	} else if(document.body && (document.body.clientWidth || document.body.clientHeight)) { //IE 4 compatible
		intH = document.body.clientHeight;	intW = document.body.clientWidth;
	}
	return { width: parseInt(intW, 10), height: parseInt(intH, 10) };
};
// function - get size of visible page
LBPlayer.getPageSizeXY = function() {
	var intH = 0, intW = 0;
	intH = document.documentElement.scrollHeight; intW = document.documentElement.scrollWidth;
	if(window.innerWidth<intW) {intW=window.innerWidth;}
	if(window.innerHeight<intH) {intH=window.innerHeight;}
	return { width: parseInt(intW, 10), height: parseInt(intH, 10) };
};
// function - get css-style attribute of element
LBPlayer.getElemStyle = function(el, styleProp) {
	if(!LBPlayer.$(el)) {return 0;}
	var y;
	if(LBPlayer.$(el).currentStyle) {y = LBPlayer.$(el).currentStyle[styleProp];}
	else if(window.getComputedStyle){y = document.defaultView.getComputedStyle(LBPlayer.$(el),null).getPropertyValue(styleProp);}
	return y;
};
// function - get style width with margins
LBPlayer.getElemStyleWidth = function(el) {
	// check if el has status "display: none"
	if(parseInt(LBPlayer.$(el).offsetWidth, 10) === 0) {return 0;}
	// otherwise calculate the whole width with all margins
	var marginLeft = (!isNaN(parseInt(LBPlayer.getElemStyle(el, "marginLeft"), 10)) ? parseInt(LBPlayer.getElemStyle(el, "marginLeft"), 10) : parseInt(LBPlayer.getElemStyle(el, "margin-left"), 10));
	var marginRight = (!isNaN(parseInt(LBPlayer.getElemStyle(el, "marginRight"), 10)) ? parseInt(LBPlayer.getElemStyle(el, "marginRight"), 10) : parseInt(LBPlayer.getElemStyle(el, "margin-right"), 10));
	var offsetWidth = parseInt(LBPlayer.$(el).offsetWidth, 10);
	return parseInt(marginLeft + marginRight + offsetWidth, 10);
};
// function - get element offset height
LBPlayer.getElemOffsetHeight = function(el) {
	// calculate the whole height with all paddings and borders
	var paddingTop = (!isNaN(parseInt(LBPlayer.getElemStyle(el, "paddingTop"), 10)) ? parseInt(LBPlayer.getElemStyle(el, "paddingTop"), 10) : parseInt(LBPlayer.getElemStyle(el, "padding-top"), 10));
	var paddingBottom = (!isNaN(parseInt(LBPlayer.getElemStyle(el, "paddingBottom"), 10)) ? parseInt(LBPlayer.getElemStyle(el, "paddingBottom"), 10) : parseInt(LBPlayer.getElemStyle(el, "padding-bottom"), 10));
	var borderTop = (!isNaN(parseInt(LBPlayer.getElemStyle(el, "borderTopWidth"), 10)) ? parseInt(LBPlayer.getElemStyle(el, "borderTopWidth"), 10) : parseInt(LBPlayer.getElemStyle(el, "border-top-width"), 10));
	var borderBottom = (!isNaN(parseInt(LBPlayer.getElemStyle(el, "borderBottomWidth"), 10)) ? parseInt(LBPlayer.getElemStyle(el, "borderBottomWidth"), 10) : parseInt(LBPlayer.getElemStyle(el, "border-bottom-width"), 10));
	var height = parseInt(LBPlayer.$(el).style.height, 10);
	return parseInt(paddingTop + borderTop + paddingBottom + borderBottom + height, 10);
};
// function - log to console
LBPlayer.log = function(o) {
	if(typeof opera == 'object' && typeof opera.postError == 'function') {	// Opera console
		opera.postError(o);
	} else if(typeof console == 'object' && typeof console.log == 'function') {	// IE+Safari console
		console.log(o);
	} else if(typeof window.console == 'object' && typeof window.console.log == 'function') {	// Gecko+Webkit+??? console
		window.console.log(o);
	}
};
// function - show element
LBPlayer.showEl = function(el) {if(LBPlayer.$(el) !== null) {LBPlayer.$(el).style.display = "block";}};
// function - hide element
LBPlayer.hideEl = function(el) {if(LBPlayer.$(el) !== null) {LBPlayer.$(el).style.display = "none";}};
// function - get an element by given "id"
LBPlayer.$ = function(id) {
	if(typeof(document.getElementById(id)) != "object" && document.getElementById(id).tagName.toUpperCase() != "OBJECT") {return null;}
	else {return document.getElementById(id);}
};
// function - create XML Http Request
LBPlayer.XHR = function(src) {
	var xhr;
	try {xhr = new XMLHttpRequest();}
	catch(ms) {
		try {xhr = new ActiveXObject("Msxml2.XMLHTTP");} 
		catch (nonms) {try {xhr = new ActiveXObject("Microsoft.XMLHTTP");} catch (failed) {xhr = null;}}			
	}
	if(xhr !== null) {xhr.open("GET", src, false); try{xhr.overrideMimeType("text/html; charset=UTF-8");}catch(ex){/*do nothing*/} xhr.send();}
	return xhr;
};
// function - todo if Android
LBPlayer.onAndroid = function(v, source) {
	var hasID = true;
	var pid = null;
	if((v.parentNode).getAttribute("id") !== null && (v.parentNode).getAttribute("id") !== "") {
		pid = (v.parentNode).getAttribute("id");
	} else {
		pid = "h5vp_id_android";
		hasID = false;
	}
	LBPlayer.mergeObjs(v.parentNode, {id: pid});
	// add css class to video element and video parent
	LBPlayer.mergeObjs(LBPlayer.$(pid), {className: "h5_lb_player h5_lb_smallscreen"});
	LBPlayer.mergeObjs(v, {className: "h5_lb_video"});
	// create and add big play button
	var bid = "android_play"+LBPlayer.videoCount;
	LBPlayer.createHTMLEl(pid, "div", {id: bid, className: "big_play_button", onclick: function() {v.play();}, title: LBPlayer.Lang[navigator.language].Play});
	LBPlayer.createHTMLEl(bid, "div");
	if(!hasID) {(v.parentNode).removeAttribute("id");}
	/*-----------------------*/
	// force source to load
	v.src = source; // forcing first playable source
	return;
};
// function - todo if iOS 3.x (for the poster-bug)
LBPlayer.onIOS = function(v, source) {
	/*-----------------------*/
	// prepare
	var hasID = true;
	var pid = null;
	if((v.parentNode).getAttribute("id") !== null && (v.parentNode).getAttribute("id") !== "") {
		pid = (v.parentNode).getAttribute("id");
	} else {
		pid = "h5vp_id_android";
		hasID = false;
	}
	LBPlayer.mergeObjs(v.parentNode, {id: pid});
	/*-----------------------*/
	// add css classes to video element and video parent
	LBPlayer.mergeObjs(LBPlayer.$(pid), {className: "h5_lb_player h5_lb_smallscreen"});
	LBPlayer.mergeObjs(v, {className: "h5_lb_video"});
	/*-----------------------*/
	// clean up
	if(!hasID) {(v.parentNode).removeAttribute("id");}
	/*-----------------------*/
	// force source to load
	v.src = source; // forcing first playable source
	// as explained in http://developer.apple.com/library/safari/#documentation/AudioVideo/Conceptual/Using_HTML5_Audio_Video/AudioandVideoTagBasics/AudioandVideoTagBasics.html
	// video.load() has no effect on iOS (TODO: test without it!!)
	v.load(); // forcing the source on this devices
	if(LBPlayer.iOSVersion < 4.2) {v.controls = true;} //forcing controls because of poster bug on iOS < 4.2
	/*-----------------------*/
	return;
};
// functions - OS & Device Checks
LBPlayer.isAndroid = function() {return ((navigator.userAgent.toLowerCase().indexOf('android') > -1) ? true : false);};
LBPlayer.isIPad = function() {return ((navigator.userAgent.toLowerCase().indexOf('ipad') > -1) ? true : false);};
LBPlayer.isIPhone = function() {return ((navigator.userAgent.toLowerCase().indexOf('iphone') > -1) ? true : false);};
LBPlayer.isIPod = function() {return ((navigator.userAgent.toLowerCase().indexOf('ipod') > -1) ? true : false);};
// function - return iOS Version of format x.y
LBPlayer.iOSVersion = function() { if(/os[\s](\d+\_\d+)/.test(navigator.userAgent.toLowerCase())){var iOSv = new Number((RegExp.$1).replace("_", ".")); return iOSv;} return 0;};
LBPlayer.firstPlayable = null;
LBPlayer.playableSources = [];
LBPlayer.playlist = {};
LBPlayer.videoCount = 0;
// function - check if video has subtitle(s)
LBPlayer.hasSubtitle = function(v) {
	var c = v.children;
    for (var i=0, j = c.length; i<j; i++) {if (c[i].tagName !== null && c[i].tagName.toLowerCase() == "track" && (c[i].hasAttribute("kind") && c[i].getAttribute("kind").toLowerCase() == "subtitles")) {return true;}}
	return false;
};
// function - check if video is available and sources playable
LBPlayer.checkVideoSource = function(v) {
	var c = v.children, r = false;
	LBPlayer.firstPlayable = null; LBPlayer.playableSources = [];
    for(var i=0, j = c.length; i<j; i++) {
		if (c[i].tagName !== null && c[i].tagName.toLowerCase() == "source") {
			var playType = v.canPlayType(c[i].type);
			if (LBPlayer.isAndroid() && (c[i].src.match(/mp4/) || c[i].src.match(/m4v/))) { // check for android
				// @video, @playableSource
				LBPlayer.onAndroid(v, c[i].src);
				LBPlayer.videoCount++;
				return false;
			} else if((LBPlayer.isIPad() && (!LBPlayer.hasSubtitle(v) || (LBPlayer.hasSubtitle(v) && LBPlayer.iOSVersion() < 4.2))) || LBPlayer.isIPhone() || LBPlayer.isIPod()) { // check for iPhone, iPod
				// @video, @playableSource
				LBPlayer.onIOS(v, c[i].src);
				return false;
			} else if(playType == "probably" || playType == "maybe" || (LBPlayer.isIPad() && LBPlayer.hasSubtitle(v))) { // check for other browsers and devices
				// .m3u8 streaming media only on iPad
				if(c[i].src.match(/.m3u8/) && !LBPlayer.isIPad()) {continue;}
				var l = ((LBPlayer.playableSources.length !== "undefined") ? LBPlayer.playableSources.length : 0);
				if(LBPlayer.firstPlayable === null) {LBPlayer.firstPlayable = c[i].src;}
				if(!LBPlayer.isIPad()){LBPlayer.playableSources[l] = {}; LBPlayer.playableSources[l].src = c[i].src;}
				r=true;
			}
		}
    }
    return r;
};
/** VARIABLES and ATTRIBUTES definition */
// to store video that has focus
LBPlayer.videoFocused = null;
// to store if (key)event is a video interaction
LBPlayer.isVideoEvent = false;
// if key pressed that supports feature in browser
LBPlayer.onKeyAction = false;
// language object
LBPlayer.Lang = {};
/** LeanBack player setup */
// function - setup searches for video elements on page
LBPlayer.setup = function() {
	var vars = {}, options = LBPlayer.options, playlist = null;
	var elements = document.getElementsByTagName("video");
	for(var i=0,j=elements.length; i<j; i++) {
		var p = elements[i].parentNode;
		if(!p.hasAttribute("class") || (p.hasAttribute("class") && p.getAttribute("class") !== "leanback-player-video")) {continue;}
		if(LBPlayer.checkVideoSource(elements[i])) {
			LBPlayer.mergeObjs(vars, {embedCode: p.innerHTML});
			var pid = ((p.getAttribute("id") !== null) ? p.id : "h5vp_id"+i);
			LBPlayer.mergeObjs(p, {id: pid});
			var vid = ((elements[i].getAttribute("id") !== null) ? elements[i].id : "h5v_id"+i);
			LBPlayer.mergeObjs(elements[i], {id: vid, tabIndex: "0"});
			// add video-id to options-vars
			LBPlayer.mergeObjs(options, {vid: vid});
			/*-----------------------*/
			// Hide default video-controls
			if(!options.useStandardControls && !LBPlayer.isIPad()) {
				// hide standard controls
				elements[i].controls = false;
			}
			// save first playable source
			LBPlayer.mergeObjs(vars, {playableVideo: LBPlayer.firstPlayable});
			// save first playable source
			LBPlayer.mergeObjs(vars, {playableSources: LBPlayer.playableSources});
			// save playlist items
			if(typeof LBPlayer.playlist !== "undefined" && typeof LBPlayer.playlist[vid] !== "undefined") {playlist = LBPlayer.playlist[vid].items;}
			// create reference for video-tag elements to handle
			LBPlayers.push(new LBPlayer(options, vars, playlist));
		}
	}
	// add tabindex to body - not an attribute, but it works to tab (opera fix for the second tab-round in page)
	if(navigator.userAgent.toLowerCase().indexOf('opera') > -1) {LBPlayer.mergeObjs(document.body, {tabIndex: "0"});}
};
// function - check if css ready
LBPlayer.setupCheck = function() {
	var cssTest = document.createElement("div");
	LBPlayer.mergeObjs(cssTest, {id: "cssTest", className: "h5_lb_css_loaded_test"}); document.body.appendChild(cssTest);
	if(LBPlayer.getElemStyle("cssTest", "display") === "none") {cssTest.parentNode.removeChild(cssTest); LBPlayer.setup();}
	// short delay to test again
	else {cssTest.parentNode.removeChild(cssTest); window.setTimeout(LBPlayer.setupCheck, 20);}
};
// function - on DOM ready call fct.fn
LBPlayer.onDOMinitPlayer = function(fn) {
	// W3C-compliant browser
	if(document.addEventListener) { // Opera 10.x+, FF 3.x+, Chrome, Safari, IE9
		document.addEventListener("DOMContentLoaded", fn, false);
	} else if(document.readyState == "interactive" || document.readyState == "complete") { //IE
		fn();
	}
};
// call fct.setupCheck on DOM ready
LBPlayer.onDOMinitPlayer(LBPlayer.setupCheck);
/**---------------------------------------------------------------*/
/**-------------------- LEANBACK PLAYER ABOVE --------------------*/
/**---------------------------------------------------------------*/
/** 
	HERE YOU CAN CHANGE and SETUP YOUR PLAYER by CHANGING OPTIONS
 */
// Options - to be changed
LBPlayer.options = {
	useStandardControls: false, // use standard browser controls
	hideControls: true,			// delayed hiding of (new) controls
	hideControlsTimeout: 2,		// delayed hiding of (new) controls after x seconds
	fixPreload: "metadata",		// "none","metadata", "auto"; "preload" attribute to fix in firefox 3.x
	showPlaybackRate: false,		// if browser supports playbackrate, show controls element
	showSubtitle: true,			// if there are subtitles, show controls element to change
	posterRestore: true,		// if poster-image should reappear once video ended
	sourcesSwitch: true,		// if switch between available video qualities should be possible
	volume: 4,					// set up start-volume (0 - 8)
	seekSkipSec: 3,				// set up seek-skip in sec., to jump back or forward x sec.
	seekSkipPerc: 10,			// set up seek-skip in percent., to jump back or forward x percent.
	defaultLanguage: "en",		// set up default language, en = english, de = german, fr = french, ...
	setToBrowserLanguage: true,	// change to browser language if available
	watermark: null		// watermark/logo; set up position with CSS
};