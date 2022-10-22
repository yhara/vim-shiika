" Support functions {{{
function! s:setf(filetype) abort
  if &filetype !~# '\<'.a:filetype.'\>'
    let &filetype = a:filetype
  endif
endfunction

func! s:StarSetf(ft)
  if expand("<amatch>") !~ g:ft_ignore_pat
    exe 'setf ' . a:ft
  endif
endfunc
" }}}

" Shiika
au BufNewFile,BufRead *.sk					call s:setf('shiika')

" vim: nowrap sw=2 sts=2 ts=8 noet fdm=marker:
