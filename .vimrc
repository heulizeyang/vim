" 显示行数，设置软回车和缩进还有语法
set number
set tabstop=4
set expandtab
set autoindent

" 不加这个在OS X下面delete键用不了
set backspace=2

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 编码设置
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set termencoding=utf-8

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" vim 主题
set background=dark
colorscheme solarized

" vundle 插件管理
" set nocompatible                " be iMproved
" filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 插件
Bundle "bling/vim-airline"
Bundle "Valloric/YouCompleteMe"
Bundle "Raimondi/delimitMate"
Bundle "kien/ctrlp.vim"
Bundle "klen/python-mode"
Bundle "mattn/emmet-vim"
Bundle "hail2u/vim-css3-syntax"
Bundle "pangloss/vim-javascript"
Bundle "ap/vim-css-color"

" airline 特殊符号
let g:airline_powerline_fonts = 1


" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=White ctermbg=Black
" 选中项
highlight PmenuSel ctermfg=Blue ctermbg=White
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" " 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" " inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" " 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" " 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'


autocmd BufNewFile *.py,*.sh exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python") 
        call setline(2, "\# -*- encofing:utf-8 -*-") 
    endif
    if &filetype == 'sh'
        call setline(1, "\#!/usr/bin/sh") 
    endif
endfunc
