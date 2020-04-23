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
map vt <Esc>:TagbarToggle<CR>Added sponsorship option
"{{{-------------- clipboard operations-------
nnoremap <c-y> "+yy
nnoremap <c-p>  "+p
"---------------------------------------------

"{{{---------------To expands snippets--------

	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsListSnippets="<c-tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
       \   'text': '',
       \   'texthl': 'NeomakeWarningSign',
       \ }
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='material'

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

