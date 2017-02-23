BASEDIR=$(dirname $0)

# keeps a list of npm packages I always want installed globally
npm install -g \
    bower \
    instant-markdown-d \
    github-labeller \
    js-beautify \
    jshint \
    jsonlint \
    knex \
    leasot \
    lodash \
    mermaid \
    metalsmith \
    nodemon \
    vue-cli \
    react-native-cli \
    tern

# updates shimmed asdf path with global modules
echo "export NODE_PATH=\$NODE_PATH:$(npm config get prefix)/lib/node_modules"\
  > $BASEDIR/path_shim.sh
