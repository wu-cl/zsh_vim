"if has('python3')
"  silent! python3 1
"endif
"显示行号
set nu
"显示相对行号
set relativenumber

"启动时隐去援助提示
set shortmess=atI

"语法高亮
syntax enable
syntax on

"使用vim的键盘模式
set nocompatible

"不需要备份
set nobackup
set autowrite
"没有保存或文件只读时弹出确认
set confirm

"鼠标可用
set mouse=a

"tab缩进
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"高亮查找匹配
set hlsearch

"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler

"去除vi的一致性
set nocompatible

set foldenable
set foldmethod=syntax
set foldlevelstart=99
set foldcolumn=0
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"当前目录设定为文件所在目录
set autochdir

"浅色显示当前行
se cul

"显示输入的命令
set showcmd

"被分割窗口之间显示空白
set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'auto-pairs'
Plugin 'Yggdroot/indentLine'
" 插件列表结束
call vundle#end()
filetype plugin indent on

"set background=dark
"colorscheme solarized
colorscheme molokai

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

set scrolloff=3

" 折行
set wrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" Visual模式高亮 当前行高亮
hi Visual ctermfg=15 ctermbg=202
highlight CursorLine ctermbg=237

syntax keyword cppSTLtype initializer_list


"允许用退格键删除字符
set backspace=indent,eol,start

"编码设置
set encoding=utf-8

"共享剪切板
set clipboard^=unnamed,unnamedplus

"切换粘贴模式
set pastetoggle=<F10>

