function o --wraps=open --description 'alias o open'
  set -f open_args "."
  if test (count $argv) -gt 0
      set -f open_args $argv
  end
  open $open_args
end
