function e --wraps=code --description 'alias e code'
  set -f open_args "."
  if test (count $argv) -gt 0
      set -f open_args $argv
  end
  code $open_args
end
