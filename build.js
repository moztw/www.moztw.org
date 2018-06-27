const ssi = require('ssi');
const glob = require('glob');
const fs = require('fs')
const path = require('path');
const mkdirp = require('mkdirp');

const srcDir = './';
const outDir = 'out/';
const matcher = '/**/*.shtml';

const parser = new ssi(srcDir, outDir, matcher);

glob(srcDir + matcher, (err, match) => {
    if (err) throw err;

    match.filter(i => !i.match('node_modules') && !i.match('/inc/')).forEach(file => {
            console.log('Reading:', file);

            try {
                const out = file.replace(srcDir, outDir).replace('.shtml', '.html');
                const dir = path.dirname(out);

                if (!fs.existsSync(dir)) mkdirp.sync(dir);

                fs.writeFileSync(out, parser.parse(file, fs.readFileSync(file, {encoding: "utf8"})));
            } catch (error) {
                console.error(`Error '${file}' build failed:`, error);
            }
        });
});
