/*jslint browser: true, regexp: true, nomen: true */
/*global alert */

(function (window) {
	'use strict';
	
	var body,
	    newsRenderer,
	    rssScript;
	
	body = window.document.getElementsByTagName('body');
	body = body[0];

	rssScript = window.document.createElement('script');
	rssScript.src = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://groups.google.com/group/moztw-general/feed/atom_v1_0_msgs.xml&callback=newsRenderer&scoring=h&num=20";
	
	body.appendChild(rssScript);

	newsRenderer = function (data) {
		if (data.responseStatus !== 200) {
			return;
		}
		data = data.responseData.feed.entries;

		var news = window.document.getElementById('moztw-general-news'),
		    counter = 0,
		    content = '',
		    thread = {},
		    current,
		    tmp,
		    i;
		
		data.forEach(function (val) {
			val.title = val.title.replace(/(Re|回覆)(:|：) ?/g, '').replace(/\[(moztw-general|MozTW-Dev)\] ?/g, '');
			
			if (!thread.hasOwnProperty(val.title)) {
				thread[val.title] = current = {
					authors: [],
					link: undefined,
					date: undefined
				};
			}

			current.link = val.link;
			current.date = new Date(val.publishedDate);

			current.authors.push(val.author.replace(/\@([\w.]+)/, ''));
		});
		
		for (i in thread) {
			if (thread.hasOwnProperty(i)) {
				if (counter >= 4) {
					break;
				}
				counter += 1;

				current = thread[i];
				tmp = '<li>';
				tmp += '<p>' + (current.date.getMonth() + 1) + '/' + current.date.getDate() + ' ' + current.date.getHours() + ':' + current.date.getMinutes() + '<br />';
				tmp += '<a href="' + current.link + '">' + i + '</a><br />';
				tmp += current.authors.slice(0, 3).join(', ');
				
				if (current.authors.length > 3) {
					tmp += ' 等' + (current.authors.length - 3) + '篇';
				}

				tmp += '</p>';

				content += tmp;
			}
		}
		news.innerHTML = content;
		
	};

	window.newsRenderer = newsRenderer;

}(this));
