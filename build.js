var scrape = require('website-scraper');
var options = {
  urls: ['http://moztw.mcuisc.club/'],
  directory: './dist/',
  urlFilter: (url) => url.startsWith('http://moztw.mcuisc.club'),
  filenameGenerator: 'bySiteStructure',
  recursive: true
};

// with promise
scrape(options).then(console.log).catch(console.log);
