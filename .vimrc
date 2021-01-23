" vundle setting
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree setting
execute pathogen#infect()
map <F5> :silent! NERDTreeToggle<CR> " F5 打开关闭NERDTree窗口
autocmd vimenter * NERDTree  "自动开启Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " 当NERDTree为剩下的唯一窗口时自动关闭
let g:NERDTreeHidden=1 " 显示隐藏文件
let g:NERDTreeShowLineNumbers=1  " 是否显示行号
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks

"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示

" taglist setting
let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
" 根据自己环境配置该选项
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  "设置ctags命令的位置
" let Tlist_Ctags_Cmd='/usr/bin/ctags'  "设置ctags命令的位置
let Tlist_Auto_Open = 1  " 启动vim后自动打开taglist窗口
noremap <F8> :TlistToggle<CR>  " 设置taglist打开关闭的快捷键F8
noremap <F6> :!ctags -R<CR     " 更新ctags标签文件快捷键设置

" cscope setting
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" YouCompleteMe setting
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <F4> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic

" minibufexpl setting 
"let g:miniBufExplMapWindowNavVim =1
"let g:miniBufExplMapWindowNavArrows =1   
"let g:miniBufExplMapCTabSwitchBufs =1   
"let g:miniBufExplModSelTarget =1

" vim setting
set nocompatible "不使用兼容模式
set backspace=indent,eol,start "不兼容vi的backspace和方向键
set tabstop=4 "tabstop 选项只修改 tab 字符的显示宽度，不修改按 Tab 键的行为
set softtabstop=4 "选项修改按 Tab 键的行为，不修改 tab 字符的显示宽度。具体行为跟 tabstop 选项值有关
" set expandtab "选项把插入的 tab 字符替换成特定数目的空格。具体空格数目跟 tabstop 选项值有关

set autoindent  "自动缩进
set cindent "按照 C 语言的语法，自动地调整缩进的长度
set number  "显示行号
set showmode "在屏幕底部显示当前所处的模式
set showcmd "将会在输入命令时，在屏幕底部显示出部分命令
set encoding=utf-8 "设置编码为utf-8
set t_Co=256  "启用256色
set shiftwidth=4 "在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set showmatch "光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set hlsearch "搜索时，高亮显示匹配结果
set autochdir "自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录
set wildmenu "命令模式下，底部操作指令按下 Tab 键自动补全
set wildmode=longest:list,full "第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set mouse=a "启用鼠标
set cursorline "光标所在的当前行高亮
"set spell spelllang=en_us "打开英语单词的拼写检查
set autoread "打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示
set incsearch "输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果

syntax on "语法高亮
filetype indent on "开启文件类型检查，并且载入与该类型对应的缩进规则

