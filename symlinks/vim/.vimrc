" Use the Solarized Dark theme "set background=dark "colorscheme monokai "colorscheme idleFingers colorscheme railscasts "let g:solarized_termtrans=1

" Make Vim more useful set nocompatible " Use the OS clipboard by default (on versions compiled with `+clipboard`) set clipboard=unnamed " Enhance command-line completion 
set wildmenu " Allow cursor keys in insert mode set esckeys " Allow backspace in insert mode set backspace=indent,eol,start " Optimize for fast terminal connections set 
ttyfast " Add the g flag to search/replace by default set gdefault " Use UTF-8 without BOM set encoding=utf-8 nobomb " Change mapleader let mapleader="," " Don’t add 
empty newlines at the end of files set binary set noeol " Centralize backups, swapfiles and undo history set backupdir=~/.vim/backups set directory=~/.vim/swaps if 
exists("&undodir")
  set undodir=~/.vim/undo endif

" Don’t create backups when editing files in certain directories set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files set modeline set modelines=4 " Enable per-directory .vimrc files and disable unsafe commands in them set exrc set secure " Enable line numbers 
set number " Enable syntax highlighting syntax on if !exists("g:syntax_on")
  syntax enable endif " Highlight current line set cursorline " Make tabs as wide as two spaces set tabstop=2 " indentation with > set shiftwidth=2 set softtabstop=2 " 
Show “invisible” characters set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ set list " Use space instead of tabs set expandtab " Highlight searches set hlsearch " Ignore case of 
searches set ignorecase " Highlight dynamically as pattern is typed set incsearch " Always show status line set laststatus=2 " Enable mouse in all modes set mouse=a " 
Disable error bells set noerrorbells " Don’t reset cursor to start of line when moving around. set nostartofline " Show the cursor position set ruler " Don’t show the 
intro message when starting Vim set shortmess=atI " Show the current mode set showmode " Show the filename in the window titlebar set title " Show the (partial) command 
as it’s being typed set showcmd " Use relative line numbers if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber endif " Start scrolling three lines before the horizontal window border set scrolloff=3

" Strip trailing whitespace (,ss) function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query) endfunction noremap <leader>ss :call StripWhitespace()<CR> " Save a file as root (,W) noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  " autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd BufNewFile,BufRead *.ipynb setlocal filetype=python
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
  autocmd Filetype r,rmd let [ b:vcm_omni_pattern,b:vcm_tab_complete ] = ['\k\+\(::\|\$\|@\)\k*$','omni']
  autocmd FileType rmd noremap <Leader>md :!Rscript -e "rmarkdown::render('%')"<cr>
  autocmd FileType r,rmd setlocal commentstring=#\ %s

endif " pathogen plugin "execute pathogen#infect() "filetype plugin indent on "Install vim-plug if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC endif " Plugins will be downloaded under the specified directory. call plug#begin('~/.vim/plugged') " Declare 
the list of plugins. Plug 'airblade/vim-gitgutter' "Plug 'jpo/vim-railscasts-theme'"do not work like that :/ "tmux nav Plug 'christoomey/vim-tmux-navigator' "vimux send 
to tmux Plug 'benmills/vimux' " better folding Plug 'tmhedberg/SimpylFold' " surround character,i.e. cs"' Plug 'tpope/vim-surround' "highlight for stan Plug 
'maverickg/stan.vim' " Comment with gcc and gcu Plug 'tpope/vim-commentary' "TODO add new file types autocmd FileType apache setlocal commentstring=#\ %s " Add repeat 
pluging that allow to repeat plug action with . Plug 'tpope/vim-repeat' "ctag made automatic Plug 'ludovicchabant/vim-gutentags' " completion Plug 'ajh17/VimCompletesMe' 
" edit history tree use :UndotreeToggle Plug 'mbbill/undotree' " vim sneak allow some cleaver jump Plug 'justinmk/vim-sneak' " target allow cool motion Plug 
'wellle/targets.vim' " tagbar :TagbarToggle Plug 'majutsushi/tagbar' " trying fzf as it should be faster.. Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' 
} Plug 'junegunn/fzf.vim' " syntax checking " Plug 'scrooloose/syntastic' Plug 'w0rp/ale' Plug 'nvie/vim-flake8' " nerdTree TODO check if i really want it Plug 
'scrooloose/nerdtree' " Plug 'jistr/vim-nerdtree-tabs' " can't make it work.. https://github.com/jistr/vim-nerdtree-tabs/issues/76 " html emmet Plug 'mattn/emmet-vim', { 
'for': ['html', 'css'] } " highlight bad whitespace Plug 'ntpeters/vim-better-whitespace' " ipython vimux Plug 'julienr/vim-cellmode', { 'for': ['python'] } Plug 
'davidhalter/jedi-vim', { 'for': ['python'] } " slack Plug 'yaasita/edit-slack.vim' " indent leading spaces " Plug 'thaerkh/vim-indentguides' " cpp completion if 
executable('clang')
  Plug 'rip-rip/clang_complete' endif "javascript better highlight "Plug 'pangloss/vim-javascript' Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } "cpp better 
highlight "Plug 'octol/vim-cpp-enhanced-highlight' "Syntax highlight for lot of languages Plug 'sheerun/vim-polyglot' "Add word motion for camel case Plug 
'chaoren/vim-wordmotion' " Better poweline Plug 'vim-airline/vim-airline' Plug 'vim-airline/vim-airline-themes' " Java completion " Plug 'artur-shaik/vim-javacomplete2', 
PlugIf(executable('mvn'), { " \ 'do': 'cd libs/javavi/ && mvn compile', " \ 'for': 'java', " \ }) " css omni completion Plug 'othree/csscomplete.vim' " r integration Plug 
'jalvesaq/Nvim-R' " better match with % Plug 'adelarsq/vim-matchit' " better rmarkdown syntax highlight Plug 'vim-pandoc/vim-pandoc-syntax' " better python syntax " Plug 
'vim-python/python-syntax' " runtime for r Plug 'jalvesaq/R-Vim-runtime' " auto format Plug 'Chiel92/vim-autoformat' " read ipynb Plug 'goerz/ipynb_notedown.vim' " List 
ends here. Plugins become visible to Vim after this call. call plug#end() "ignore files in NERDTree let NERDTreeIgnore=['\.pyc$','\.Rd$','\.o$', '\~$'] " stupid bug fix 
from https://github.com/jistr/vim-nerdtree-tabs/issues/84 " let g:nerdtree_tabs_synchronize_view = 0 " not working nvm.. " javascript plug option " let 
g:javascript_plugin_jsdoc = 1 " let g:javascript_plugin_ngdoc = 1 " let g:javascript_plugin_flow = 1 "cpp highlight " let g:cpp_class_scope_highlight = 1 " let 
g:cpp_member_variable_highlight = 1 " let g:cpp_experimental_simple_template_highlight = 1 " let g:cpp_concepts_highlight = 1

" gitgutter update rate to 250ms set updatetime=250 "change the camelcase word motion to leader let g:wordmotion_prefix = '<Leader>' "Add mapping for tmux <ctrl-h> => 
Left "<ctrl-j> => Down "<ctrl-k> => Up "<ctrl-l> => Right "<ctrl-\> => Previous split " key binding for vimux " Write all buffers before navigating from Vim to tmux pane 
"let g:tmux_navigator_save_on_switch = 2

" Run the current file with rspec " map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR> " map <Leader>r :call VimuxRunCommand(bufname("%"))<CR>

" Prompt for a command to run map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane) map <Leader>vz :call VimuxZoomRunner()<CR>

" function! VimuxSlime() " call VimuxSendText(@v) " call VimuxSendKeys("Enter") " endfunction

function! VimuxSlime()
  " Automatically register a tmux pane.
  if !exists("g:VimuxRunnerIndex")
    call VimuxOpenRunner()
  endif
  if &filetype=="python"
    silent call VimuxSendText("%cpaste\n")
    :sleep 200m
    silent call VimuxSendText(@v)
    :sleep 200m
    silent call VimuxSendText("\n--\n")
  else
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
  endif endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux vmap <Leader>vs "vy :call VimuxSlime()<CR>


" Select current paragraph and send it to tmux nmap <Leader>vs vip<Leader>vs<CR>

" source file nnoremap <Leader>sv :source $MYVIMRC<cr> " buffer nav nnoremap gb :ls<cr>:buffer<space> " Adding conf for vimrc nav tmap <C-h> <C-w>h tmap <C-j> <C-w>j tmap 
<C-k> <C-w>k tmap <C-l> <C-w>l tmap <Leader><Esc> <C-\><C-n>

" Enable folding set foldmethod=indent set foldlevel=99 " show docstring for the fold plugin let g:SimpylFold_docstring_preview=1 "add gutentag status "set 
statusline+=%{gutentags#statusline()} " commented because it delete the rest " tagbar additional mapping let g:tagbar_type_r = {
      \ 'ctagstype' : 'r',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'g:globalvariables',
      \ 'v:functionvariables',
      \ ]
      \ } " Using griprep instead of ag because faster " source: https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2 " --column: Show column 
number " --line-number: Show line number " --no-heading: Do not show file headings in results " --fixed-strings: Search term as a literal string " --ignore-case: Case 
insensitive search " --no-ignore: Do not respect .gitignore, etc... " --hidden: Search hidden files and folders " --follow: Follow symlinks " --glob: Additional 
conditions for search (in this case ignore everything in the .git/ folder) " --color: Search color options " TODO ignore tags Rd, o and other formats command! -bang 
-nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob \!.git/* --color "always" 
'.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0) " let g:airline_section_b+='{gutentags#statusline()}' " let 
g:airline_section_y='%{gutentags#statusline("[Generating...]")}' set tags=./.tags,.tags; let g:gutentags_ctags_tagfile = '.tags' let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ } let g:gutentags_generate_on_new = 1 " airline options let g:airline#extensions#tabline#enabled = 0 let g:airline_theme='minimalist' let 
g:airline_powerline_fonts = 1 let g:airline#extensions#whitespace#enabled = 0 " let g:airline_skip_empty_sections = 1 " syntetic js stuff " let 
g:syntastic_javascript_checkers = ["eslint"] " let g:syntastic_javascript_eslint_exec='/usr/local/bin/eslint' " let g:syntastic_aggregate_errors = 1 " Disable it by 
default to enable it do :SyntasticToggleMode " let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] } " clang path let 
g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib' " let g:tern_show_argument_hints = 'on_hold' " let g:tern_show_signature_in_pum = 1 let g:R_nvimpager = 
'horizontal' let g:R_assign = 0 let g:R_indent_commented = 0 let g:R_commented_lines = 1 let g:R_listmethods = 1 let g:R_specialplot = 1 let g:R_show_args = 1 let 
g:R_show_arg_help = 1 " let g:R_tmux_split = 1 let g:R_hi_fun = 1 let g:R_nvim_wd = 1 let g:R_rconsole_width = 0 let g:R_rconsole_height = 25 " R output is highlighted 
with current colorscheme let g:rout_follow_colorscheme = 1 " R commands in R output are highlighted let g:Rout_more_colors = 1



" disable polygot syntax for python " let g:polyglot_disabled = ['python'] " let g:polyglot_disabled = ['json'] "ale syntax check only call when :ALELint let 
g:ale_lint_on_text_changed = 'never' let g:ale_lint_on_enter = 0 let g:ale_lint_on_save = 0 let g:airline#extensions#ale#enabled = 1 let g:ale_fixers = {
      \ 'javascript': [
      \ 'eslint'
      \ ],
      \ 'python': [
      \ 'autopep8'
      \ ]
      \}

"auto format stuff let g:formatter_yapf_style = 'pep8' let g:ale_python_autopep8_options ='--ignore=E501'


" python syntax " let g:python_highlight_all = 1 " let g:r_syntax_fun_pattern = 1 " let R_hi_fun_paren = 1 let g:cellmode_use_tmux=1 let g:cellmode_tmux_sessionname='' 
let g:cellmode_tmux_panenumber=1

" vim slack let g:yaasita_slack_token = ""

"vim jedi " do not pop on dot automatically let g:jedi#popup_on_dot = 0

" TODO set key binding and uncomment this: " let g:R_user_maps_only = 1 " showing menu for sneak " let g:sneak#label = 1 " replacing s with Z so motion and finding at the 
same map <Leader>z <Plug>Sneak_s map <Leader>Z <Plug>Sneak_S

