BASEDIR=$(dirname $0)

# keeps a list of npm packages I always want installed globally
npm install -g \
    ember-cli \
    github-labeller \
    gtop \
    instant-markdown-d \
    js-beautify \
    jshint \
    jsonlint \
    leasot \
    lodash \
    mermaid \
    metalsmith \
    nodemon \
    tern \
    tslint \
    typescript \
    uglify-js \
    vue-cli

# updates shimmed asdf path with global modules
echo "export NODE_PATH=\$NODE_PATH:$(npm config get prefix)/lib/node_modules"\
  > $BASEDIR/path_shim.sh
