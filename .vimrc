" Enconding rule
set encoding=utf-8

" Display the number of the lines
set number
"set relativenumber

" Highlight the syntax for each language
syntax on

"           Indentations

" Use spaces instead of tabs
set expandtab
autocmd Filetype make setlocal noexpandtab

set smartindent
set autoindent
set smarttab
set tabstop=8

" 1 tab = 4 spaces
set shiftwidth=4
set softtabstop=4

" Set a line to see the limit
set colorcolumn=80

"Show the line and column number of the cursor position
set ruler

" Allow the use of the mouse
set mouse=a

" Display some characters
set list
set listchars=eol:$,tab:»·,trail:.,extends:>,precedes:<,nbsp:.

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"set syntax=whitespace


" Show the matching braces and parentheses
set showmatch

set showmode

" Auto write when exiting the file
set autowriteall

" Put a line under the line we are currently writting on
" set cursorline

" Use the clipboard of the computer
set clipboard=unnamedplus

set ignorecase


" Mapping

" Indent correctly the all file
nnoremap <F2> gg=G <CR>

" Open a terminal in vim
nnoremap <F3> :rightb terminal ++rows=12<CR>

"nnoremap <S-Tab> <Tab> <CR>

nnoremap <F4> :!clang-format -i --style=file %:p<CR>

nnoremap <F6> :!make -B all check <CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre     *.[ch] :call TrimWhiteSpace()


" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

