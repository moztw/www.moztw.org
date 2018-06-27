var scrape = require('website-scraper');
var options = {
  urls: ['http://moztw.org/'],
  directory: './dist/',
  urlFilter: (url) => url.startsWith('http://moztw.org'),
  filenameGenerator: 'bySiteStructure',
  recursive: true
};

// with promise
scrape(options).then(console.log).catch(console.log);
