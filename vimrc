set encoding=utf-8
set title
set clipboard+=unnamed
set number
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
set belloff=all
set backspace=indent,eol,start
set nobackup
set noswapfile
set viminfo=
syntax enable
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme material-theme
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

" 隣接した{}で改行したらインデント
function! IndentBraces()
    let nowletter = getline(".")[col(".")-1]    " 今いるカーソルの文字
    let beforeletter = getline(".")[col(".")-2] " 1つ前の文字

    " カーソルの位置の括弧が隣接している場合
    if nowletter == "}" && beforeletter == "{"
        return "\n\t\n\<UP>\<RIGHT>"

    elseif nowletter == "]" && beforeletter == "["
        return "\n\t\n\<UP>\<RIGHT>"
    
    elseif nowletter == ")" && beforeletter == "("
        return "\n\t\n\<UP>\<RIGHT>"
        
    else
        return "\n"
        
    endif
endfunction
" Enterに割り当て
inoremap <silent> <expr> <CR> IndentBraces()

