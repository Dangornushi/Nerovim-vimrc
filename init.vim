syntax enable
syntax on 
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set number
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set nocompatible

" Leader KEY
let mapleader = " "

let s:dein_path = expand('~/.vim/dein')

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)
  

  let s:toml_dir  = $HOME . '/.config/nvim/rc'
  let s:toml      = s:toml_dir . '/dein.toml'

  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/pum.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/deoplete.nvim')

  call dein#add('bluz71/vim-nightfly-guicolors')
  call dein#add('preservim/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('zchee/deoplete-clang')
  call dein#add('vim-scripts/a.vim')
  call dein#add('justmao945/vim-clang')
  call dein#add('rhysd/vim-clang-format')
  call dein#add('kana/vim-operator-user')
  call dein#add('drewtempelmeyer/palenight.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('vim-denops/denops.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('Shougo/neco-syntax')
  call dein#add('ujihisa/neco-look')
  call dein#add('baabelfish/nvim-nim')
  call dein#add('sonph/onehalf', {'rtp': '/vim/'})
  call dein#add('joshdick/onedark.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('haishanh/night-owl.vim')
  call dein#add('liuchengxu/space-vim-dark')

  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

if dein#check_install()
  call dein#install()
endif

" Terminal

if has('nvim')
  command! -nargs=* T split | terminal <args>
  command! -nargs=* Tv vsplit | terminal <args>
endif

" Nim
let g:nvim_nim_highlighter_semantics=1

" カラースキーム
syntax enable
" テキスト背景色
au ColorScheme * hi Normal ctermbg=none
" 括弧対応
au ColorScheme * hi MatchParen cterm=bold ctermfg=214 ctermbg=black
" スペルチェック
au Colorscheme * hi SpellBad ctermfg=23 cterm=none ctermbg=none

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

filetype plugin indent on
syntax enable
set background=dark
colorscheme space-vim-dark
hi Comment cterm=italic

" formaterS
" C/C++
" ========

let g:deoplete#enable_at_startup   = 1
let g:deoplete#sources#clang#libckang_path = '/usr/local/bin/clang-format'
filetype plugin indent on
autocmd FileType c ClangFormatAutoEnable
map <leader>f <Plug>(operator-clang-format)

" ========
" Rust
" ========

" 保存時に自動でrustfmt
let g:rustfmt_autosave = 1

" ========


" NERDTree
nmap <silent><C-f> :NERDTreeToggle<CR>
" 隠しファイルを設定する
let NERDTreeShowHidden = 1

" Airline
" themes
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
let g:airline_powerline_fonts = 1            " Powerline Fontsを利用
let g:airline_theme='onedark'

map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
let g:airline_mode_map = {
	\ 'n'  : 'Normal',
	\ 'i'  : 'Insert',
	\ 'R'  : 'Replace',
	\ 'c'  : 'Command',
	\ 'v'  : 'Visual',
	\ 'V'  : 'V-Line',
	\ '⌃V' : 'V-Block',
	\ }

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
 
"左側に使用されるセパレータ
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
"右側に使用されるセパレータ
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
let g:airline_symbols.linenr = '¶'			"行
let g:airline_symbols.maxlinenr = '㏑'		"最大行
let g:airline_symbols.branch = '⭠'		"gitブランチ
let g:airline_symbols.paste = 'ρ'			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)

nmap <C-n> <Plug>AirlineSelectPrevTab<CR>
nmap <C-p> <Plug>AirlineSelectNextTab<CR>

" command Mode
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" a.vim
nmap <silent> <leader>aa :A<CR> 
nmap <silent> <leader>at :AT<CR> 
nmap <silent> <leader>av :AV<CR>
