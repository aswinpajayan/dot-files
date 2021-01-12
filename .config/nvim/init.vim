filetype on
filetype plugin on
filetype plugin indent on
syntax enable
"install flake8 flake8-mypy flake8-bugbear flake8-comprehensions flake8-executable flake8-pyi mccabe pycodestyle pyflakes 
"for makeing klinters work porperly
"trying - pip install pylama as linter

"The below command automatically downloads and install vimplug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set showcmd

call plug#begin()
Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'
"Plug 'davidhalter/jedi-vim' alternative to ncm2-jedi
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'neomake/neomake'
Plug 'sickill/vim-pasta'
Plug 'majutsushi/tagbar'
Plug 'chrisbra/replay'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'lokaltog/vim-powerline'
Plug 'ryanoasis/vim-devicons'


Plug 'ap/vim-css-color'
Plug 'vim-scripts/latex-support.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iberianpig/ranger-explorer.vim'
"Plugin for web dev
Plug 'jaxbot/browserlink.vim'
"Plugins for ROS development
Plug 'fmauch/vim_snippets_ros'
Plug 'taketwo/vim-ros'
Plug 'https://github.com/McSinyx/vim-octave.git', {'for': 'octave'}


"Plugins for themes
"Plug 'junegunn/seoul256.vim'
Plug 'sjl/badwolf'
Plug 'kaicataldo/material.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
"Distraction free mode for vim
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}


"trying out vim lsp
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'neovim/nvim-lsp'
"use :LspInstallServer <server-name> to install a new server
"Requires npm

"Plug 'nvie/vim-flake8' pylint is better
"Plug 'dense-analysis/ale'
call plug#end()

   set mouse=a
   if (has('termguicolors'))
      set termguicolors
   endif
   set tabstop=4
   set shiftwidth=4
   set expandtab
   set t_Co=256
   "colorscheme material
   "let g:material_theme_style = 'default'
   
   " For dark version.
    set background=dark
    " Set contrast.
    " This configuration option should be placed before `colorscheme gruvbox-material`.
    " Available values: 'hard', 'medium'(default), 'soft'
    let g:gruvbox_material_background = 'medium'
    " colorscheme gruvbox-material
    colorscheme onedark
"{{{------------------settings for cursorline highlight---------------- 
set cursorline 
hi CursorLine term=none cterm=bold ctermbg=black guibg=gray18
"hi Normal ctermbg=NONE guibg=NONE
"--------------------------------------------------------------------}}}
   set foldmethod=syntax
"{{{----------------using terminal in vim , terminal mode rebinds----
tnoremap <esc><esc> <c-\><c-n>
"--------------------------------------------------------------------}}}

"{{{-----------------ale linr settings -------------------------------
"let g:ale_linters_explicit = 1
"let g:ale_linters = {'python': ['flake8']}
"let g:ale_python_flake8_executable = 'flake8-3'
"let g:flake8_quickfix_location="topleft"
"--------------------------------------------------------------------}}}
"{{{-----------------python selection -------------------------------
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
"--------------------------------------------------------------------}}}

"some tweaks to speed up vim
"https://stackoverflow.com/questions/9341768/vim-response-quite-slow/55501120#55501120
set lazyredraw   " don't redraw everytime
set synmaxcol=128  " avoid slow rendering for long lines
syntax sync minlines=64  " faster syntax hl
set regexpengine=1 "use newer regexpengine


"language server settings 
let g:lsp_highlights_enabled = 1
let g:lsp_semantic_enabled = 1

let g:lsp_settings = {
\  'pyls': {
\    'cmd': ['python', '-m', 'pyls']
\  }
\}

let g:semshi#filetypes              =	['python'] 	
let g:semshi#excluded_hl_groups     =	['local'] 
let g:semshi#mark_selected_nodes    =  	1 	
let g:semshi#no_default_builtin_highlight=v:true 	
let g:semshi#simplify_markup        =   v:true 	
let g:semshi#error_sign             =   v:true 	
let g:semshi#error_sign_delay       =   1.5 
let g:semshi#always_update_all_highlights=v:false 	
let g:semshi#tolerate_syntax_errors =   v:true 
let g:semshi#update_delay_factor    =   0.0 	
let g:semshi#self_to_attribute      =   v:true 	



"function! MyCustomHighlights()
"    hi semshiGlobal      ctermfg=red guifg=#ff0000
"endfunction
"autocmd FileType python call MyCustomHighlights()
"hi semshiLocal           ctermfg=209 guifg=#ff875f
"hi semshiGlobal          ctermfg=214 guifg=#ffaf00
"hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
"hi semshiParameter       ctermfg=75  guifg=#5fafff
"hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
"hi semshiFree            ctermfg=218 guifg=#ffafd7
"hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
"hi semshiAttribute       ctermfg=49  guifg=#00ffaf
"hi semshiSelf            ctermfg=249 guifg=#b2b2b2
"hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
"hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
"
"hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"sign define semshiError text= texthl=semshiErrorSign


" {{{ ---------------configuration settings fro neo make -------------
	" Full config: when writing or reading a buffer, and on changes in insert and
	" normal mode (after 1s; no delay when writing).

"	function! CustomExe(jobinfo) abort
"	    let self.args = [self.exe] + self.args
"	    let self.exe = 'some_custom_wrapper'
"	endfunction
"	call neomake#config#set('ft.python.InitForJob', function('CustomExe'))
"	args: ['-fsyntax-only', '-Wall', '-Wextra', '-I./', '-std=c++1z']
"
"	let g:neomake_c_clang_args = [
"	\'-fsyntax-only', '-Wall', '-Wextra',
"	\'-I/usr/local/include/opencv4',
"	\'-I/usr/local/include/opencv4/opencv',
"	\'-I/usr/include/gtk-3.0',
"	\'-I/usr/include/cairo',
"	\'-std=c++1z'
"\]

	call neomake#configure#automake('nrwi', 500)
    let g:neomake_python_enabled_makers = ['pylint']
    "let g:neomake_python_enabled_makers = ['pylama' , 'pylint']
    "let g:neomake_python_pylama_maker = {
    "    \ 'args': ['--format', 'parsable'],
    "    \ 'errorformat': '%f:%l:%c: [%t] %m',
    "    \ 'postprocess': function('neomake#makers#ft#python#PylamaEntryProcess'),
    "    \ 'output_stream': 'stdout',
    "    \ 'exe': '/home/aswin/.local/bin/pylama'
    "    \ }

    let g:neomake_highlight_lines=0
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
"}}}
"
"
"{{{-----------------configuration settings for netrw------------------
"
"
	let g:netrw_browse_split=4		"opens the file in Previous window
	let g:netrw_banner=0			"hides banner
	let g:netrw_sort_by="exten"		"sorts files based on extension
	let g:netrw_winsize=15			"set the width of Vex to 15 columns
	"let g:netrw_preview=1 			"makes splits vertically instead of horizontal
	"
"}}}
"
"
"}}}
"
"
"To toggle tagbar
map vt <Esc>:TagbarToggle<CR>
"{{{-------------- clipboard operations-------
nnoremap <c-y> "+yy
nnoremap <c-p>  "+p
"---------------------------------------------

"{{{---------------To expands snippets--------

"	let g:UltiSnipsExpandTrigger="<tab>"
"	let g:UltiSnipsListSnippets="<c-tab>"
"	let g:UltiSnipsJumpForwardTrigger="<c-j>"
"	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"
" UltiSnips+NCM function parameter expansion

" We don't really want UltiSnips to map these two, but there's no option for
" that so just make it map them to a <Plug> key.
let g:UltiSnipsExpandTrigger       = "<Plug>(ultisnips_expand_or_jump)"
let g:UltiSnipsJumpForwardTrigger  = "<Plug>(ultisnips_expand_or_jump)"
" Let UltiSnips bind the jump backward trigger as there's nothing special
" about it.
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" Try expanding snippet or jumping with UltiSnips and return <Tab> if nothing
" worked.
function! UltiSnipsExpandOrJumpOrTab()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return ""
  else
    return "\<Tab>"
  endif
endfunction

" First try expanding with ncm2_ultisnips. This does both LSP snippets and
" normal snippets when there's a completion popup visible.
inoremap <silent> <expr> <Tab> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_try_expand)")

" If that failed, try the UltiSnips expand or jump function. This handles
" short snippets when the completion popup isn't visible yet as well as
" jumping forward from the insert mode. Writes <Tab> if there is no special
" action taken.
inoremap <silent> <Plug>(ultisnips_try_expand) <C-R>=UltiSnipsExpandOrJumpOrTab()<CR>

" Select mode mapping for jumping forward with <Tab>.
snoremap <silent> <Tab> <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>

"------------------------------------------}}}

"{{{------------------------------------ tag files
"
"	set tags="./tags,tags,/home/aswin/lang_sources/ghdl/tags"
	set tags=tags;/home/aswin/esp/esp-idf/tags;
	
	
	""}}}

"" Configuring status line in place of airline 
set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
"set statusline=%<%f%h%m%r%=%{strftime(\"%l:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set foldmethod=syntax
set nofoldenable
"{{{--------------------airline configs---------------------

set encoding=UTF-8

let g:airline_section_b = '%{strftime("%a\ %b\ %e\ %I:%M\ %p")}'

let g:airline_section_y = 'BN:%{bufnr("%")}'
let g:airline_section_z = 'ﴜ:%2p%%  %l:%c'
" air-line
let g:airline_powerline_fonts = 1
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:neomake_warning_sign = {
       \   'text': '',
       \ }
"\   'texthl': 'NeomakeWarningSign',
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_theme='material' "works only with material theme
"let g:airline_theme='gruvbox_material'
let g:airline_theme='onedark'

"""{{{-------------Ranger vim settings----------
let g:ranger_explorer_keymap_edit    = '<C-o>'
let g:ranger_explorer_keymap_tabedit = '<C-t>'
let g:ranger_explorer_keymap_split   = '<C-s>'
let g:ranger_explorer_keymap_vsplit  = '<C-v>'
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
nnoremap rnc <Esc>:RangerOpenCurrentDir<CR>
nnoremap rnp <Esc>:RangerOpenProjectRootDir<CR>

"""------------------------------------------}}}
""------------Congfig for browserlink---------"""
""node needs to be installed for this to work"""
nnoremap bt <Esc>o<script src='http://127.0.0.1:9001/js/socket.js'></script><CR><Esc>

"""----------------latex autocmd----------------
autocmd BufWritePost,FileWritePost *.tex :silent !pdflatex *.tex

"""----------------cpp autocmd----------------
autocmd BufWritePost,FileWritePost *.cpp  :silent !g++ *.cpp -o runfile
let mapleader=" "
map <leader>c <Esc>0i//<Esc>


"""---distraction free mode for vim ---Goyo-----
map <leader><ENTER> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'red'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.6

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
"   these are for python 
let g:limelight_bop = '\zs:'
let g:limelight_eop = '\ze\n\n'

"   these are for C style 
autocmd FileType c,cpp,lua,json,java,javascript,css  let g:limelight_bop='\zs{' | let g:limelight_eop='\ze}'
autocmd FileType cpp  let g:limelight_bop='\zs{' | let g:limelight_eop='\ze}'
"autocmd FileType python  let g:limelight_bop='\zs:' | let g:limelight_eop='\ze\n\n'
autocmd FileType html   let g:limelight_bop='\zs<div' | let g:limelight_eop='\zediv>$'
"let g:limelight_bop = '\zs{'
"let g:limelight_eop = '\ze}'
"   these are for html 
"let g:limelight_bop = '\zs^<'
"let g:limelight_eop = '\ze>$'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
