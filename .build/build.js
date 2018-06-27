let scrape = require('website-scraper');
let path = require('path')
let options = {
  urls: ['http://moztw.org/'],
  directory: path.resolve(__dirname, '../dist/'),
  urlFilter: (url) => url.startsWith('http://moztw.org'),
  filenameGenerator: 'bySiteStructure',
  recursive: true
};

// with promise
scrape(options).then(console.log).catch(console.log);
