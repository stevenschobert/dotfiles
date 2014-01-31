fu! s:switchToPencil()
  :silent !echo -e "\033]50;SetProfile=Writing\a"
  "kcall system("echo -e '\033]50;SetProfile=Writing\a' &>/dev/null &")
  colorscheme pencil
  set background=light
endfu

fu! s:switchToSolarized()
  :silent !echo -e "\033]50;SetProfile=Default\a"
  "call system("echo -e '\033]50;SetProfile=Default\a' &>/dev/null &")
  colorscheme solarized
  set background=dark
endfu

au BufEnter <buffer> call s:switchToPencil()
au BufWinLeave <buffer> call s:switchToSolarized()
