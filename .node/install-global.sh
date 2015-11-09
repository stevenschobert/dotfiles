BASEDIR=$(dirname $0)

# keeps a list of npm packages I always want installed globally
npm install -g \
    bower \
    instant-markdown-d \
    js-beautify \
    jshint \
    jsonlint \
    knex \
    lodash \
    metalsmith \
    tern

# updates shimmed asdf path with global modules
echo "export NODE_PATH=\$NODE_PATH:$(npm config get prefix)/lib/node_modules"\
  > $BASEDIR/path_shim.sh
