function glr --wraps='git rev-parse --short HEAD' --description 'alias glr=git rev-parse --short HEAD'
  git rev-parse --short HEAD $argv; 
end
