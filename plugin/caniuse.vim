"% Preliminary validation of global variables
"  and version of the editor.

if v:version < 700
  finish
endif

" check whether this script is already loaded
if exists('g:loaded_caniuse')
  finish
endif

let g:loaded_caniuse = 1

" Function for debugging
" @param {Any} content Any type which will be converted
" to string and write to tmp file
func! s:console(content)
  let log_dir = fnameescape('/tmp/vimlog')
  call writefile([string(a:content)], log_dir)
  return 1
endfun

" Output warning message
" @param {Any} message The warning message
fun! WarningMsg(message)
  echohl WarningMsg
  echo string(a:message)
endfun

" Output error message
" @param {Any} message The error message
fun! ErrorMsg(message)
  echoerr string(a:message)
endfun


func! Caniuse(...)
  let engine = 'caniuse'
  let str = expand('<cword>')

  if executable(engine)
    let l:output = system(engine." ".str)
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=l:output
  else
    " Executable bin doesn't exist
    call ErrorMsg('The '.engine.' is not executable!')
    return 1
  endif

endfun

command!  Caniuse call Caniuse()
