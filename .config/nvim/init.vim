filetype on
call plug#begin()
Plug 'roxma/nvim-completion-manager'
Plug 'sjl/badwolf'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neomake/neomake'
Plug 'sickill/vim-pasta'
Plug 'majutsushi/tagbar'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-airline/vim-airline'
"Plug 'lokaltog/vim-powerline'
Plug 'ryanoasis/vim-devicons'
call plug#end()


   set mouse=a
   set t_Co=256
   colorscheme desert
"{{{------------------settings for cursorline highlight----------------
   set cursorline
   hi CursorLine term=none cterm=bold ctermbg=black guibg=Grey40
"--------------------------------------------------------------------}}}
   set foldmethod=syntax
" {{{ ---------------configuration settings fro neo make -------------
	" Full config: when writing or reading a buffer, and on changes in insert and
	" normal mode (after 1s; no delay when writing).
	call neomake#configure#automake('nrwi', 500)
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

"{{{---------------------------------To expands snippets

	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsListSnippets="<c-tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"}}}

"{{{------------------------------------ tag files
"
"	set tags="./tags,tags,/home/aswin/lang_sources/ghdl/tags"
	set tags=tags;/home/aswin/esp/esp-idf/tags
	
	
	""}}}

"" Configuring status line in place of airline 
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set statusline=%<%f%h%m%r%=%{strftime(\"%l:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ %{&ff}\ %l,%c%V\ %P
"{{{--------------------airline configs---------------------

"let g:airline_section_b = '%{strftime("%H:%M")}'
"let g:airline_section_y = 'BN:%{bufnr("%")}'
"" air-line
"let g:airline_powerline_fonts = 1
"" air-line
"let g:airline_powerline_fonts = 1
"
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"
"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"
"let g:airline_theme='papercolor'
"}}}
