BASEDIR=$(dirname $0)

# keeps a list of npm packages I always want installed globally
npm install -g \
    eslint \
    github-labeller \
    gtop \
    js-beautify \
    jsonlint \
    leasot \
    lodash \
    mermaid \
    metalsmith \
    nodemon \
    tern \
    tslint \
    typescript \
    uglify-js

# updates shimmed asdf path with global modules
echo "export NODE_PATH=\$NODE_PATH:$(npm config get prefix)/lib/node_modules"\
  > $BASEDIR/path_shim.sh
