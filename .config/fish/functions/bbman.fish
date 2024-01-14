function bbman
  if test (count $argv) -lt 2
    set -f cmd $argv[1]
  else
    set -f cmd $argv[2]
  end

  set -f tmpfile (mktemp)

  man $argv | col -bx > $tmpfile
  set -f ret $pipestatus[1]
  if test $ret -ne 0
    rm $tmpfile
    return $ret
  end

  cat $tmpfile | bbedit --view-top --clean -t $cmd
  rm $tmpfile
end
