"if has('python3')
"  silent! python3 1
"endif
"显示行号
set nu

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
set mouse-=a

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

set autochdir
set tags=tags;

"浅色显示当前行
autocmd InsertLeave * se nocul

"用浅色高亮当前行
autocmd InsertEnter * se cul

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-powerline'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Yggdroot/indentLine'
" 插件列表结束
call vundle#end()
filetype plugin indent on

noremap <F2> :Autoformat<CR>
let g:autoformat_verbosemode=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
autocmd VimEnter * wincmd p
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
" 配色方案
"set background=dark
"colorscheme solarized
colorscheme molokai
map <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

set scrolloff=3

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

syntax keyword cppSTLtype initializer_list


"允许用退格键删除字符
set backspace=indent,eol,start

"编码设置
set encoding=utf-8

"共享剪切板
set clipboard=unnamed

let mapleader=','

" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR> "查找符号
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR> "查找定义
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR> "查找调用
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR> "查找字符串
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR> "查找被调用的函数

map <F12> <Esc>:call RETAG()<CR>
let g:first_flag = 1
func! RETAG()
    wall
    let g:Curr_dir=getcwd()
    let g:file_dir=expand("%:p:h")
    exec 'cd '.g:file_dir
    while 1
        if filereadable("RETAG.sh")
            break
        else
            if getcwd()=="/"
                 exec 'cd '.g:Curr_dir
                 return
            else
                cd ..
            endif
        endif
    endwhile
    silent! exec "!./RETAG.sh"
"    silent! exec "!find `pwd` -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.C' > cscope.files"
"    silent! exec "!cscope -Rbkq -i cscope.files"
    if g:first_flag
        cs add cscope.out
        let g:first_flag = 0
    endif
    exec 'cd '.g:Curr_dir
    exec "redraw!"
endfunc

if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  call RETAG()
  set csverb
endif
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_list_select_completion = ['<TAB>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
let g:ycm_auto_trigger=1
let g:ycm_goto_buffer_command='same-buffer'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_max_diagnostics_to_display =1
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
set pumheight=10

" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
