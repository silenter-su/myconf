syntax enable
syntax on "语法高亮
set nu "行号
set t_Co=256
set background=dark

"配色方案
colorscheme molokai   

"设置匹配括号
set showmatch
"设置搜索时忽略大小写set ignorecase,取消set noic
set ic

"设置文件切换时不用每次都:w保存
set hidden

"设置vim中可以使用鼠标
set mouse=a

"设置粘贴开关
set pastetoggle=<F1>

"设置缩进为4个空格
set tabstop=4 " 设置制表符(tab键)的宽度
set softtabstop=4 " 设置软制表符的宽度
set shiftwidth=4 " (自动) 缩进使用的4个空格
set cindent " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式

"设置搜索高亮"
set hlsearch

"设置搜索跳转
set incsearch

"设置光标停在上次退出的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


set cscopequickfix=s-,c-,d-,i-,t-,e- "设置cscope
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"QuickFix快捷键设置
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

"设置自动补全
filetype plugin indent on
set completeopt=longest,menu

"--fold setting--
set foldmethod=syntax " 用语法高亮来定义折叠
set foldlevel=100 " 启动vim时不要自动折叠代码
set foldcolumn=1 " 设置折叠栏宽度

"-------------------------------------------------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

"My Plugins at here:
Plugin 'bling/vim-airline'
set laststatus=2

Plugin 'a.vim'
"设置F12为切换.c.h的快捷键
nnoremap <silent> <F12> :A<CR>

Plugin 'c.vim'

Plugin 'echofunc.vim'

Plugin 'grep.vim'
"设置F3为Grep快捷键
nnoremap <silent> <F3> :Grep<CR>

Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0
let g:miniBufExplMapCTabSwitchBufs = 1 "设备启用miniBuf
let g:miniBufExplMapWindowNavVim = 1 "设置启用hjkl移动,启用后貌似没有作用
map <F10> :MBEbp<CR>
map <F11> :MBEbn<CR>

Plugin 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                    "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口

Plugin 'winmanager'
let g:winManagerWindowLayout='FileExplorer|TagList' "设置winmanager
nmap wm :WMToggle<cr>

Plugin 'Valloric/YouCompleteMe'
"My plugin end.


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-------------------------------------------------------------------------------------------------------------------------

"高亮函数名
autocmd BufRead,BufNewFile * :syntax match my_cfunctions "[a-zA-Z_][a-zA-Z_0-9]*\s*("me=e-1
hi my_cfunctions ctermfg=yellow

