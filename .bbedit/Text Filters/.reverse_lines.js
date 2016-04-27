var eol = require('os').EOL;

process.stdin.resume();
process.stdin.setEncoding('utf8');

var newLines = [];

process.stdin.on('data', function(chunk) {
  var strings   = chunk.toString();
  var lines     = strings.split(eol);

  lines.forEach(function(line) {
    newLines.unshift(line);
  });
});

process.stdin.on('end', function() {
  process.stdout.write(newLines.join(eol));
});
