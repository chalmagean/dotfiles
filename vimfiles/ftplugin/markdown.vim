function! HLink2Md ()
  normal /<a
endfunction

function! HImg2Md ()
  normal /<img
endfunction

:noremap <leader>ma :call HLink2Md()<cr>
:noremap <leader>mi :call HImg2Md()<cr>