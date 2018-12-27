" autor: felipedacs
" A partir de vim-bootstrap b0a75e4
" motivacional: https://www.youtube.com/watch?v=XA2WjJbmmoM

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,php,python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'majutsushi/tagbar'                                            " Barra lateral com variáveis, funçoes e etc, instalar ctags: sudo apt-get install exuberant-ctags
Plug 'tpope/vim-fugitive'                                           " Comandos git
Plug 'airblade/vim-gitgutter'                                       " Marcações + - _ ~ de git
Plug 'SirVer/ultisnips'                                             " engine de snippets
Plug 'honza/vim-snippets'                                           " pacote de snippets
Plug 'gregsexton/gitv', {'on': ['Gitv']}                            " branchs
Plug 'w0rp/ale'                                                     " Lint geral do vim
Plug 'dracula/vim'                                                  " colorscheme
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                  " ferramentas com go
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " ctrl p
Plug 'junegunn/fzf.vim'                                             " ctrl p
Plug 'sheerun/vim-polyglot'                                         " Sintaxe de linguagens vim, deve ser instalado DEPOIS do vim go
Plug 'junegunn/goyo.vim'                                            " Apresentação de código com :Goyo
call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile
set autochdir
set fileformats=unix,dos,mac

"delay entre atalhos
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

set clipboard=unnamed
set showbreak=↳\
set showcmd             " Mostra os comandos no canto inferior direito

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
filetype plugin indent on
colorscheme dracula         " tema dracula instalado
set termguicolors           " libera cores para o dracula
set relativenumber          " distancias entre a linha do cursor
set number                  " numero das linhas
set autoread                " vim checar quando o texto for modificado
set showmatch               "mostra fechamento de {['']}
set ai                      "auto indentação -> ==
set cursorline              " marcação da linha de onde está o cursor
set mouse=a                 "libera uso do mouse em todos modos

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
" fechar automaticamente
:inoremap ¢ ()<left>
:inoremap { {}<left><cr><cr><up><tab>
:inoremap [ []<left>
:inoremap " ""<left>
:inoremap ' ''<left>

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"######################################################
"# Help
"######################################################
":h add-local-help
":h write-local-help
":h dacs
helptags ~/.vim/doc
command Dacs execute ":h dacs"
":dacs"
cnoreabbrev dacs Dacs
"h: local-additions

"*****************************************************************************
"" Mappings
"*****************************************************************************
"j e k mantem cursor no meio do editor
nnoremap j jzz
nnoremap k kzz

"procura por arquivos com plug fzf
nnoremap <c-f> :tabfind ./
set wildmenu
"procura por arquivos com plug fzf
nnoremap <c-n> :tabe 

"acabar com o ctrl z
nnoremap <C-Z> u
nnoremap <c-z> u

"" Split
"open the same file
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
"search an file
noremap <Leader>l :<C-u>vsp 
noremap <Leader>j :<C-u>sp 

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
"nnoremap <S-t> :tabnew 

"" Clean search (highlight) ", "
nnoremap <leader><space> :noh<cr>

"*****************************************************************************
"" Custom configs langs
"*****************************************************************************
"######################################################
"# TEX
"######################################################
augroup tex
    "" compila e abre evince ou somente compila
    au FileType tex nmap <leader>e <Esc>:w<CR>:!clear;evince '%:r'.pdf &<CR><CR>
    au FileType tex nmap <leader>E <Esc>:w<CR>:!clear;evince '%:r'.pdf &<CR><CR>
    au FileType tex inoremap <leader>e <Esc>:w<CR>:!clear;pdflatex %;evince '%:r'.pdf &<CR><CR>
    au FileType tex inoremap <leader>E <Esc>:w<CR>:!clear;pdflatex %;evince '%:r'.pdf &<CR><CR>
    au FileType tex nmap <leader>r <Esc>:w<CR>:!clear;pdflatex %<CR><CR>
    au FileType tex nmap <leader>R <Esc>:w<CR>:!clear;pdflatex %<CR><CR>
    au FileType tex inoremap <leader>r <Esc>:w<CR>:!clear;pdflatex %<CR><CR>a
    au FileType tex inoremap <leader>R <Esc>:w<CR>:!clear;pdflatex %<CR><CR>a

    au FileType tex inoremap { {}<left>
augroup END

"######################################################
"# GO
"######################################################
"" Execução
""nnoremap <leader>gr <Esc>:w<CR>:!clear;go run %<CR>

function ComentaVisual()
    execute "normal! 0i//"
endfunction

augroup go
    "" Comenta
    au FileType go vnoremap ;; :s/\/\//<cr>:noh<CR>
    au FileType go vnoremap // :call ComentaVisual()<CR>
    au FileType go nmap ;; :s/\/\/\t/<cr>:noh<CR>==
    au FileType go nmap // I//<tab><esc>

    au FileType go nmap <leader>r <Plug>(go-run)

    au FileType go nmap <leader>a :w<CR>:GoAlternate<CR>
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    au Filetype go command! -bang AI call go#alternate#Switch(<bang>0, 'split')

    au FileType go nmap <leader>tp <Plug>(go-test)
    au FileType go nmap <leader>tt :GoTest ./...<CR>
    au FileType go nmap <leader>tf <Plug>(go-test-func)
    au FileType go nmap <leader>cc <Plug>(go-coverage-toggle)
    au FileType go nmap <leader>cb :GoCoverageBrowser<CR>

    au FileType go nmap <leader>i :GoImport 
    
    au FileType go nmap <leader>dv <Plug>(go-doc)
    au FileType go nmap <leader>db <Plug>(go-doc-browser)
    au FileType go nmap <leader>gi <Plug>(go-info)

    "<- [[ 
    "-> ]]
    au FileType go nmap <leader>dc :GoDecls<CR>
    au FileType go nmap <leader>dd :GoDeclsDir<CR>
augroup END

"######################################################
"# HTML
"######################################################

"######################################################
"# CSS
"######################################################

"######################################################
"# JAVASCRIPT
"######################################################

"######################################################
"# PYTHON
"######################################################
" Execução
nnoremap <leader>py <Esc>:w<CR>:!clear;python3 %<CR>

"######################################################
"# PHP
"######################################################

"######################################################
"# C
"######################################################
nnoremap <leader>gc <Esc>:w<CR>:!clear;gcc % -o executavel ; ./executavel ; rm executavel<CR>

"*****************************************************************************
"" Plugins config
"*****************************************************************************

"" Git 
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>ga :Git add .<CR><CR>:echo "git add ."<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"######################################################
"# Tagbar
"######################################################
nmap <silent> <bs> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"######################################################
"# Polyglot
"######################################################
if exists('g:loaded_polyglot')
    let g:polyglot_disabled = ['go']
endif

"######################################################
"# fzf
"######################################################
nnoremap <c-p> :Files<CR>

"######################################################
"# Vim Go
"######################################################
let g:go_list_type = "quickfix" 
let g:go_fmt_command = "goimports" " import automatico ao salvar
let g:go_fmt_fail_silently = 1
let g:go_info_mode='guru'

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" enfeitar o editor, pode tornar vim mais lento!
let g:go_highlight_types = 1 
let g:go_highlight_fields = 1 
let g:go_highlight_functions = 1 
let g:go_highlight_methods = 1 
let g:go_highlight_operators = 1 
let g:go_highlight_build_constraints = 1 
let g:go_highlight_structs = 1 
let g:go_highlight_generate_tags = 1 
let g:go_highlight_space_tab_error = 0 
let g:go_highlight_array_whitespace_error = 0 
let g:go_highlight_trailing_whitespace_error = 0 
let g:go_highlight_extra_types = 1

"######################################################
"# UltiSnips
"######################################################
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/dacs-snippets']
let g:UltiSnipsSnippetsDir="~/.vim/dacs-snippets"
let g:tex_flavor='latex' "ultisnippets reconhecerem .tex

"" trigger com enter quano possível
"" https://github.com/Valloric/YouCompleteMe/issues/420
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

"" tab como ctrl n quando preciso
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        ""return "\<down>"
        return "\<c-n>"
    else
        return "\<Tab>"
    endif
endfun

"######################################################
"# Gitgutter
"######################################################
" [c -> previous hunk   ]c -> next hunk
set updatetime=100 "atualização mais rápida de +-

"######################################################
"# Ale
"######################################################
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error

    return l:counts.total == 0 ? '' : ',z'
endfunction

nmap <silent> <leader>z <Plug>(ale_previous_wrap)
nmap <silent> <leader>x <Plug>(ale_next_wrap)

"*****************************************************************************
"" Vim Built-in plugins config
"*****************************************************************************

"######################################################
"# File browsing
"######################################################
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" toggle para mostrar diretórios
let g:tnet = 1
fun! ToggleGerenciador()
    if(g:tnet==1)
        :vs
        :edit .
        let g:tnet = 0
    else
        :q!
        let g:tnet = 1
    endif
endfun
nnoremap <s-cr> :call ToggleGerenciador()<cr>

"######################################################
"# Tabline
"######################################################

" tabline number
" creditos: http://vim.wikia.com/wiki/Show_tab_number_in_your_tab_line
if exists("+showtabline")
    function MyTabLine()
        let s = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let s .= ' ['. i . ']'
            let file = bufname(buflist[winnr - 1])
            let file = fnamemodify(file, ':p:t')
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

"######################################################
"# statusline
"######################################################
"créditos: https://gabri.me/blog/diy-vim-statusline
"créditos: https://kadekillary.work/post/statusline/
set laststatus=2	"fixar status bar

" :h cterm
hi User1 guibg=darkred guifg=white cterm=bold
hi User2 guibg=lightgray guifg=black cterm=bold
hi User3 guibg=grey guifg=black
hi User4 guibg=darkgray guifg=black
hi User5 guibg=lightgray guifg=red cterm=bold

" plugin linter w0rp/ale
hi User6 guibg=red guifg=white cterm=bold

fun! InsertStatuslineColor()
    hi User1 guibg=darkred guifg=white cterm=bold
    hi User2 guibg=lightgray guifg=black cterm=bold
    hi User3 guibg=Green guifg=black
    hi User4 guibg=DarkGreen guifg=white
    hi User5 guibg=lightgray guifg=red cterm=bold
endfun

fun! InsertLeaveActions()
    hi User1 guibg=darkred guifg=white cterm=bold
    hi User2 guibg=lightgray guifg=black cterm=bold
    hi User3 guibg=grey guifg=black
    hi User4 guibg=darkgray guifg=black
    hi User5 guibg=lightgray guifg=red cterm=bold
endfun

au InsertEnter * call InsertStatuslineColor()
au InsertLeave * call InsertLeaveActions()

"delay entre atalhos
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

fun! CurrentGitStatus()
    let g:gitstatus =  system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfun
au BufEnter,BufWritePost * call CurrentGitStatus()

set statusline+=
set statusline+=\%1*\%{FugitiveStatusline()} 	" branch
set statusline+=\%5*\ %m\%2*\%f\ %* 	        " nome abreviado/teste readonly/modificado/
set statusline+=\%3*\ %F					    " full path
set statusline+=%=						        " Espaço
set statusline+=\%4*\ %p%%\ %l:\%c              " Rownumber/total (%)
set statusline+=\%6*\%{LinterStatus()}          " Plugin Ale
