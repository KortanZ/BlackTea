" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('easymotion/vim-easymotion')
  call packager#add('neovim/nvim-lsp', { 'type': 'opt'})
  call packager#add('scrooloose/nerdtree')
  " vim-lsp
  call packager#add('prabirshrestha/vim-lsp')
  call packager#add('prabirshrestha/async.vim')
  call packager#add('prabirshrestha/asyncomplete.vim')
  call packager#add('prabirshrestha/asyncomplete-lsp.vim')
  " themes
  call packager#add('itchyny/lightline.vim')
  call packager#add('rakr/vim-one')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

" vim-lsp config
" ======================= Start =====================================
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

" key map
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" ======================= End =======================================

" apperance config
" ======================= Start =====================================
" general settings
set number
set cursorline
set cursorcolumn

" theme settings
set noshowmode
set termguicolors " open 256-color support
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

" ======================= End =======================================

" nvim-lsp config
" ======================= Start ======================================
" packadd nvim-lsp
" lua << EOF
" require'nvim_lsp'.clangd.setup{}
" EOF

" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>

" Use LSP omni-completion in c files.
" autocmd FileType c setlocal omnifunc=v:lua.vim.lsp.omnifunc
" ======================= End =========================================
