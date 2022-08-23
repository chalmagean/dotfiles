" let mapleader = "\<Space>"
" Command mode mappings
"""""""""""""""""""""""
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
" cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
" cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" center search results
cnoremap <expr> <CR> getcmdtype() =~ '[/?]' ? '<CR>zz' : '<CR>'

" Visual mode mappings
""""""""""""""""""""""
vnoremap <D-h> <Esc><c-w>h
vnoremap <D-j> <Esc><c-w>j
vnoremap <D-k> <Esc><c-w>k
vnoremap <D-l> <Esc><c-w>l
" keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Expand to current path
cabbr %% <C-R>=expand('%:p:h')<CR>

" Normal mode mappings
""""""""""""""""""""""


nmap <silent> tt :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> tl :TestLast<CR>

nnoremap <C-p> <cmd>Telescope find_files<CR>

" Open the definition in a new vsplit
nnoremap g] :sp<CR>:exec("tjump ".expand("<cword>"))<CR>

" vinegar
nmap - <Plug>VinegarUp
nmap \| :vs<CR>
nmap _ :sp<CR>

" backspace to go to the alternate buffer
nnoremap <bs> <c-^>

" Repeat last macro if in a normal buffer.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" Avoid unintentional switches to Ex mode.
nnoremap Q q

" Multi-mode mappings (Normal, Visual, Operating-pending modes).
noremap Y y$

nnoremap <silent> <Right> :vertical resize +5<CR>
nnoremap <silent> <Left> :vertical resize -5<CR>
nnoremap <silent> <Down> :resize -5<CR>
nnoremap <silent> <Up> :resize +5<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search for the word under cursor in the whole project
" nnoremap K :tag <c-r>=expand("<cword>")<CR><CR>
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <C-q> :qall<CR>
" Leader mappings
"""""""""""""""""

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" Coc.nvim
" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
" Use K to show documentation in preview window.
nnoremap <silent> gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>a :Ack!<Space>

" Insert mode mappings
""""""""""""""""""""""

xnoremap <D-h> <C-w>h
xnoremap <D-j> <C-w>j
xnoremap <D-k> <C-w>k
xnoremap <D-l> <C-w>l

" Disable backspace so I am forced to use C-h
inoremap <BS> <Nop>

" Disable <C-Space>
" http://shallowsky.com/blog/linux/editors/vim-ctrl-space.html
inoremap <Nul> <Space>
inoremap <C-@> <Space>
noremap  <Nul> <Nop>
vnoremap <Nul> <Nop>
cnoremap <Nul> <Nop>
nnoremap <Nul> <Nop>

" Terminal mode mappings
""""""""""""""""""""""""
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  " tnoremap <C-c> <C-\><C-n>

  " Terminal mode:
  tnoremap <D-h> <c-\><c-n><c-w>h
  tnoremap <D-j> <c-\><c-n><c-w>j
  tnoremap <D-k> <c-\><c-n><c-w>k
  tnoremap <D-l> <c-\><c-n><c-w>l

  tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif
