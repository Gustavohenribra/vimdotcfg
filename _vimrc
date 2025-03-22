"-- AUTOCLOSE NATIVE CONFIG
      "autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
      "autoclose with ; and position cursor to write text inside
inoremap '; '';<left><left>
inoremap `; ``;<left><left>
inoremap "; "";<left><left>
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap {; {};<left><left>
      "autoclose with , and position cursor to write text inside
inoremap ', '',<left><left>
inoremap `, ``,<left><left>
inoremap ", "",<left><left>
inoremap (, (),<left><left>
inoremap [, [],<left><left>
inoremap {, {},<left><left>
      "autoclose and position cursor after
inoremap '<tab> ''
inoremap `<tab> ``
inoremap "<tab> ""
inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}
      "autoclose with ; and position cursor after
inoremap ';<tab> '';
inoremap `;<tab> ``;
inoremap ";<tab> "";
inoremap (;<tab> ();
inoremap [;<tab> [];
inoremap {;<tab> {};
      "autoclose with , and position cursor after
inoremap ',<tab> '',
inoremap `,<tab> ``,
inoremap ",<tab> "",
inoremap (,<tab> (),
inoremap [,<tab> [],
inoremap {,<tab> {},
      "autoclose 2 lines below and position cursor in the middle
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
      "autoclose 2 lines below adding ; and position cursor in the middle
inoremap ';<CR> '<CR>';<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
      "autoclose 2 lines below adding , and position cursor in the middle
inoremap ',<CR> '<CR>',<ESC>O
inoremap `,<CR> `<CR>`,<ESC>O
inoremap ",<CR> "<CR>",<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O
inoremap {,<CR> {<CR>},<ESC>O

syntax on
set relativenumber
set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set scrolloff=8
set signcolumn=yes
set showcmd
set showmode
set ruler
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamed
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>:<backspace>
autocmd BufLeave * silent! write

call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()

" LSP CONFIGURAÇÃO
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
        setlocal signcolumn=yes
            if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
                nmap <buffer> gd <plug>(lsp-definition)
                    nmap <buffer> gs <plug>(lsp-document-symbol-search)
                        nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
                            nmap <buffer> gr <plug>(lsp-references)
                                nmap <buffer> gi <plug>(lsp-implementation)
                                    nmap <buffer> gt <plug>(lsp-type-definition)
                                        nmap <buffer> <leader>rn <plug>(lsp-rename)
                                            nmap <buffer> [g <plug>(lsp-previous-diagnostic)
                                                nmap <buffer> ]g <plug>(lsp-next-diagnostic)
                                                    nmap <buffer> K <plug>(lsp-hover)
                                                        nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
                                                            nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

                                                                let g:lsp_format_sync_timeout = 1000
                                                                    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
