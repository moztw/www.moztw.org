let fs = require('fs')
let path = require('path')
let fg = require('fast-glob')

const directiveRegex = /<!--#include([ ]+([a-z]+)="(.+?)")* -->/g

console.log('Start patch ......')
console.time('cost')

let stream = fg.stream('**/*.shtml', { cwd: process.cwd() })
let dealFilenums = 0
let patchLine = 0

stream.on('data', (element) => {
  dealFilenums++
  let file = fs.readFileSync(element, {encoding: "utf8"})
  let result = file.replace(directiveRegex, (full, include, attr, value) => {
    if (fs.existsSync(process.cwd()+value)) {
      return full
    } else {
      patchLine++
      return full.replace('.html','.shtml')
    }
  })
  if (result !== file) {
    fs.writeFileSync(element, result, {encoding: "utf8"})
  }
});
stream.once('error', console.log);
stream.once('end', () => {
  console.log("Finish about " + dealFilenums + " shtml files and then patch " + patchLine + " lines.")
  console.timeEnd('cost')
});

