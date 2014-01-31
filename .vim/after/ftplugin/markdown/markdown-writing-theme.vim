fu! s:switchToPencil()
  :silent !echo -e "\033]50;SetProfile=Writing\a"
  colorscheme pencil
  set background=light
endfu

fu! s:switchToSolarized()
  :silent !echo -e "\033]50;SetProfile=Default\a"
  colorscheme solarized
  set background=dark
endfu

au BufEnter <buffer> call s:switchToPencil()
au BufWinLeave <buffer> call s:switchToSolarized()
