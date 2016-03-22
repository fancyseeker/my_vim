" 设置vi兼容性，设置为不兼容以避免vi限制
set nocompatible

" 默认显示行号
set nu

" 使用空格代替tab
set expandtab
" 设置（软）制表符宽度为4, 即空格数为4
set tabstop=4
set softtabstop=4
" 设置（自动）缩进的空格数为4
set shiftwidth=4

" 设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
set autoindent

" 设置 使用 C/C++ 语言的自动缩进方式：
set cindent

" 智能缩进
set smartindent

" 语法高亮
syntax enable
syntax on

" vim皮肤
colorscheme torte
" 配色方案调整, 颜色编码参见:Xter_256color
function s:SetCursorLine()
	set cursorline
	" 高亮当前行, 设置ctermbg(当前行背景色)
	hi cursorline cterm=none ctermbg=234 ctermfg=NONE
	" 设置行号颜色
	hi LineNr ctermfg=240
	" 设置当前行行号颜色
	hi CursorLineNr ctermfg=none ctermbg=234
endfunction
autocmd VimEnter * call s:SetCursorLine()

"在状态栏显示正在输入的命令
set showcmd

"用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>

" 为了方便复制, 将paste模式开关指定为<F3>
set pastetoggle=<F3>

" :set foldcolumn=0<CR>

" 在终端下打开256色
set t_Co=256

" 搜索的时候实时显示结果
set incsearch

" 高亮搜索结果
set hlsearch

" 禁止循环查找
set nowrapscan

"  设置匹配模式，显示匹配的括号
set showmatch

" 文件类型自动识别, Vundle要求必须为off
" filetype on
filetype plugin on
filetype plugin indent on

" 智能补全
set completeopt=longest,menu

" 设置历史记录为50条
set history=50

" 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
" set laststatus=2

" 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
set ruler

" 括号引号补全
" :inoremap ( ()<ESC>i
" :inoremap { {<CR>}<ESC>O
" :inoremap [ []<ESC>i

" 折叠设置
set foldmethod=syntax " 用语法高亮来定义折叠
set foldlevel=100 " 启动vim时不要自动折叠代码
" set foldcolumn=5 " 设置折叠栏宽度

" 映射ctrl+j为向下滚动一行, ctrl+k为向上滚动一行
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>

" 映射ctrl+n为取消高亮
nnoremap <C-N> :nohl<CR>

" 映射m为移动到当前行的中部
" nnoremap m :call cursor(0, len(getline('.'))/2)<CR>

" 映射m为移动到当前光标与行尾的中部, 行内二分跳转
nnoremap m :call cursor(0 , col('.')+(len(getline('.'))- col('.'))/2)<CR>

" High light trailing whitespace 高亮多余的尾空格
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufWritePre * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufWritePre * if &ft == 'help' | match none /\s\+$/ | endif

" 删除行尾多余空格
nnoremap tw :%s/\s\+$//e<CR>

" makeprg设置
autocmd FileType c set makeprg=gcc\ -Wall\ -o\ %<\ %
autocmd FileType cpp set makeprg=g++\ -Wall\ -o\ %<\ %

" 将ejs文件高亮当做html来处理
au BufNewFile,BufRead *.ejs set filetype=html

" 每行80字符提示线
" VIM 7.3+ has support for highlighting a specified column.
if exists('+colorcolumn')
"    set colorcolumn=80
    set colorcolumn=72
else
    " Emulate
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif
" 80字符提示线颜色, 需要在colorscheme后面
hi ColorColumn ctermbg=black guibg=NONE


"-------------------------plugin setting-------------------------------------
" leader键
let mapleader=","
let g:mapleader=","

" Vundle设置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/a.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'moll/vim-bbye'
"Plugin 'scrooloose/syntastic'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'shime/vim-livedown'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" WinManager设置
" NERD_Tree集成到WinManager
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
" 设置winmanager的宽度，默认为25
let g:winManagerWidth=30
" 窗口布局
let g:winManagerWindowLayout='NERDTree|TagList'
" 如果所有编辑文件都关闭了，退出vim
let g:persistentBehaviour=0


" nerdtree设置
" 让Tree把自己给装饰得多姿多彩漂亮
" let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
" let NERDTreeMouseMode=2
" 是否默认显示书签列表
" let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示隐藏文件
" let NERDTreeShowHidden=1
" 是否默认显示行号
" let NERDTreeShowLineNumbers=1
" 窗口位置（'left' or 'right'）
" let NERDTreeWinPos='left'
" 窗口宽
let NERDTreeWinSize=31

" nerdcommenter设置
" 注释符号与内容间留有１个空格
let g:NERDSpaceDelims = 1


" taglist设置
let Tlist_Show_One_File=1 " 0为同时显示多个文件函数列表,1则只显示当前文件函数列表
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1 " 非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "如果taglist是最后一个窗口，则退出vim
let Tlist_Auto_Update=1            "Automatically update the taglist to include newly edited files.
"把taglist窗口放在屏幕的右侧，缺省在左侧
"let Tlist_Use_Right_Window=1
"显示taglist菜单
"let Tlist_Show_Menu=1
"启动vim自动打开taglist
"let Tlist_Auto_Open=1
" ctags, 指定tags文件的位置,让vim自动在当前或者上层文件夹中寻找tags文件
set tags=tags
" 添加系统调用路径
set tags+=/home/linux/tags
"键绑定，刷新tags
nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR> :set tags+=./tags<CR>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR>





" omnicppcomplete 设置
" 按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
" imap <F3> <C-X><C-O>
" 按下F2根据头文件内关键字补全
" imap <F2> <C-X><C-I>
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 "autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 "search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 "Class scope completion mode: always show all members
let OmniCpp_DefaultNamespaces=["std"]
let mniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1




" Cscope 设置
if has("cscope")
	set csprg=/usr/bin/cscope	"指定用来执行cscope的命令
	set csto=0                  " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库"
	set cst                     " 同时搜索cscope数据库和标签文件"
	set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口来显示cscope查找结果"
	set nocsverb
	if filereadable("cscope.out")    " 若当前目录下存在cscope数据库，添加该数据库到vim
		cs add cscope.out
	elseif $CSCOPE_DB != ""            " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
		cs add $CSCOPE_DB
	endif
	set csverb
endif
" 设置快捷键<F4>, 添加当前目录下的cscope.out文件
map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
"对:cs find c等Cscope查找命令进行映射
nmap <leader>css :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>csc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>cse :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>csi :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
" 设定是否使用 quickfix 窗口来显示 cscope 结果
set cscopequickfix=s-,c-,d-,i-,t-,e-



" airline设置
set laststatus=2
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前高亮buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap <C-H> :bp<CR>
nnoremap <C-L> :bn<CR>

" Bbye设置
" 由于原生的:bd在删除当前buffer时会将整个窗口关闭，故使用Bbye的:Bd
nnoremap bd :Bd<CR>

" ctrlp 设置
let g:ctrlp_open_multiple_files = 'ijr'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|bmp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_max_files=0

" syntastic 设置
let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'


" Livedown 设置
" 打开preview窗口, 需要先设置<ctrl-g>为打开浏览器快捷键, 否则去掉<C-g>
nmap md <C-g>:LivedownPreview<CR>
" 关闭preview窗口
nmap cm :LivedownKill<CR>
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
