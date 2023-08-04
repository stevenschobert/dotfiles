function simple_server --wraps='python -m http.server'
  python -m http.server $argv;
end
