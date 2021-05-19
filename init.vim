set tabstop=2 softtabstop=22
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
" set nohlsearch
set hidden
set noerrorbells
set nu
set wrap
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set noshowmode
" set completeopt=menuone,noinsert,noselect
set completeopt=menuone,noselect
set signcolumn=yes
set cmdheight=2
set updatetime=50
set shortmess+=c
" set colorcolumn=120
set autowrite
set splitright
set splitbelow
set encoding=utf-8
set list
set background=dark
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
" set showbreak=↪\
" set showbreak=\\ " [bonus]
set termguicolors
set t_Co=256
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h16
set omnifunc=syntaxcomplete#Complete
set pumheight=10
syntax on
filetype plugin indent on

call plug#begin()
Plug 'nvim-lua/popup.nvim'
Plug 'Shatur95/neovim-cmake'
Plug 'skywind3000/asyncrun.vim'
Plug 'tyru/open-browser.vim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'vimwiki/vimwiki'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'vim-test/vim-test'
Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
Plug 'srcery-colors/srcery-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
Plug 'tpope/vim-pathogen'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'ianding1/leetcode.vim'
Plug 'folke/tokyonight.nvim'
Plug 'strager/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim'}
Plug 'hoob3rt/lualine.nvim'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'rktjmp/lush.nvim'
Plug 'elianiva/gruvy.nvim'
" Plug 'hzchirs/vim-material'
call plug#end()

" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_selection='0'
" let g:material_style='oceanic'
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'ocean'
" colorscheme gruvy
" let g:solarized_termtrans=1
" highlight LineNr cterm=NONE ctermbg=Black ctermfg=Green
" highlight! link CursorLineNr LineNr
" highlight VertSplit cterm=NONE ctermbg=Black ctermfg=Green
" highlight StatusLine cterm=NONE ctermbg=Black ctermfg=Blue
" highlight StatusLineNC cterm=NONE ctermbg=Black ctermfg=Green
" highlight SpellBad cterm=undercurl ctermfg=Red
" highlight SpecialKey cterm=NONE ctermfg=0 ctermbg=NONE
" set background=dark
" hi Normal guibg=NONE ctermbg=NONE
lua require('colorbuddy').colorscheme('gruvbuddy')
" colorscheme base16-gruvbox-dark-hard
" colorscheme gruvbox8_hard
" colorscheme srcery
lua << EOF
require('lualine').setup{
    options = {
      theme='dracula',
      -- icons_enabled = true
    },
    sections = {
      lualine_c = {"os.data('%a')", 'data', require'lsp-status'.status}
    }
}
EOF
" colorscheme tokyonight
" let g:tokyonight_style = "night"
" colorscheme nvcode
" highlight Normal guibg=none

let mapleader = " "
let maplocalleader = " "
nnoremap <leader>tt :tabnew +terminal<CR>
nnoremap <leader>ts :new +terminal<CR>
nnoremap <leader>tv :vnew +terminal<CR>
augroup neovim_terminal
  autocmd!

  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert

  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
augroup END
nnoremap Y y$
nnoremap <leader><CR> :noh<CR>
nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | end

"Vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" remove whitespace
autocmd BufWritePre * %s/\s\+$//e

" gitblame
let g:gitblame_enabled  = 0
nnoremap <leader>gb :GitBlameToggle<CR>

lua << EOF
-- require('gitsigns').setup()
EOF

noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

nnoremap <leader>y :%y+<CR>

"firenvim
if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

"vim-test
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"

if has('nvim')
 tnoremap <Esc> <C-\><C-n>
endif

let g:indentLine_char_list = ['|', '|', '|', '|']

au BufNewFile,BufRead Makefile set ts=4 sw=4 noet

nnoremap <silent><leader>m :MaximizerToggle<CR>

nnoremap <leader>f :Neoformat<CR>

let g:gist_clip_command = 'xclip -selection clipboard'

" highlight yank
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

nnoremap <leader>e :Ex<CR>

nnoremap <leader>lc :VimtexCompile<CR>

lua << EOF
require("gitsigns").setup {
    signs = {
        add = {hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil -- Use default
}
EOF

" mfussenegger/nvim-dap
lua << EOF
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
EOF

" ianding1/leetcode.vim
let g:leetcode_browser = 'firefox'
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <S-k> :lua require'dap'.step_out()<CR>
" nnoremap <S-l> :lua require'dap'.step_into()<CR>
" nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require'debugHelper'.attach()<CR>

" theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
let g:dap_virtual_text = v:true

" c++ stuff
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer><leader>k :JbzCppMan<CR>

let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'cppreference': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={query}',
\   'qt': 'https://doc.qt.io/qt-5/search-results.html?q={query}',
\ },
\ 'keep'
\)
nnoremap <silent> <leader>cpp :call openbrowser#smart_search(expand('<cword>'), "cppreference")<CR>
nnoremap <silent> <leader>osq :call openbrowser#smart_search(expand('<cword>'), "qt")<CR>

nnoremap <leader>co :copen<CR>
nnoremap <leader>cp :cnext<CR>
nnoremap <leader>cn :cprevious<CR>
nnoremap <leader>cc :cclose<CR>

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

" cmake
lua << EOF
vim.g.cmake_configure_arguments = '-G Ninja -D CMAKE_EXPORT_COMPILE_COMMANDS=1'
EOF
nnoremap <F5> :CMake build_and_debug<CR>
nnoremap <S-F5> :CMake set_target_arguments<CR>
nnoremap <A-F5> :CMake debug<CR>
nnoremap <F6> :CMake build_and_run<CR>
nnoremap <A-F6> :CMake run<CR>
nnoremap <S-F6> :Telescope cmake select_target theme=get_dropdown<CR>
nnoremap <F7> :CMake build_all<CR>
nnoremap <S-F7> :Telescope cmake select_build_type theme=get_dropdown<CR>
nnoremap <A-F7> :CMake build<CR>
nnoremap <F8> :CMake configure<CR>
nnoremap <A-F8> :CMake clean<CR>

" asyncrun
lua <<EOF
vim.g.asyncrun_open = 10
vim.g.asyncrun_rootmarks = {'.git', '.compile_commands.json'}
EOF
nnoremap <F3> <cmd>call asyncrun#quickfix_toggle(10)<CR>
nnoremap <C-BS> <cmd>AsyncStop<CR>

nnoremap <leader>nb <cmd>AsyncRun ninja -C build<CR>

command! MyFiles call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))
nnoremap <leader><leader> :MyFiles<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif
let g:fzf_layout = { 'down':  '20%'}
" let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = []
let g:fzf_buffers_jump = 1

" lsp
lua << EOF
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require('lspconfig')

-- Some arbitrary servers
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--header-insertion=iwyu",
  },
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
EOF
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <space>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <space>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

autocmd BufWritePre *.cpp,*.h,*.hpp,*.go,*.c lua vim.lsp.buf.formatting_sync(nil, 1000)

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" nvim-compe
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
highlight link CompeDocumentation NormalFloat

" nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  }
}
EOF

lua require('lspfuzzy').setup {}
nnoremap <leader>da :LspDiagnosticsAll<CR>
