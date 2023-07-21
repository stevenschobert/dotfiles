function fserv --wraps='python -m http.server' --description 'alias fserv=python -m http.server'
  python -m http.server $argv
        
end
