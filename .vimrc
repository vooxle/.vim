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
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  "设置ctags命令的位置
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
set nocompatible
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set autoindent
set cindent
set nu
syntax on
set showmode
set showcmd
set encoding=utf-8 
set t_Co=256
filetype indent on
set shiftwidth=4
set showmatch
set hlsearch
set autochdir
set wildmenu
set wildmode=longest:list,full
set mouse=a

set tags=/Users/vooxle/workspace/IntelligentInfusionAlarm/tags

