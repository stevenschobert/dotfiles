function bb --wraps=bbedit --description 'alias bb bbedit'
  set -f rel_path "."
  if test -n "$argv[1]"
    set -f rel_path "$argv[1]"
  end
  set -f abs_path $(realpath "$rel_path")
  set -f proj_dir "$HOME/Documents/BBEdit Projects"
  set -f proj_file_match $(grep --include=project.bbprojectdata -rl "$proj_dir" -e "<string>file://$abs_path/</string>")
  set -f bb_open_arg "$rel_path"
  if test -n "$proj_file_match"
    set -f bb_open_arg $(dirname "$proj_file_match")
  end

  bbedit "$bb_open_arg"
end
