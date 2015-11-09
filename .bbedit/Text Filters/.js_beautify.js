var jsbeautify = require('js-beautify');

process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(chunk) {

  var s = jsbeautify(chunk, {
    indent_size: 2,
    brace_style: "end-expand"
  });

  process.stdout.write(s);
});
