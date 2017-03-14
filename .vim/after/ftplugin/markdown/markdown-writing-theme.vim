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

" macOS only
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    au BufEnter <buffer> call s:switchToPencil()
    au BufWinLeave <buffer> call s:switchToSolarized()
  endif
endif
