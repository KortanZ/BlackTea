" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('easymotion/vim-easymotion')
  call packager#add('neovim/nvim-lsp', { 'type': 'opt'})
  call packager#add('scrooloose/nerdtree')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

packadd nvim-lsp
lua << EOF
--- local nvim_lsp = require'nvim_lsp'
--- nvim_lsp.clangd.setup{
--- 	filetypes = {"c", "cpp", "h", "hpp"}
--- }
require'nvim_lsp'.clangd.setup{}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>

" Use LSP omni-completion in c files.
autocmd FileType c setlocal omnifunc=v:lua.vim.lsp.omnifunc


