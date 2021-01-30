set relativenumber
syntax on

" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'} "NodeJS Auto-complete, prettier, tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier'] "list of CoC extensions
Plug 'jiangmiao/auto-pairs' " Auto closes parenthesis
Plug 'yuezk/vim-js' "Javascript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty' "JSX syntax support
Plug 'HerringtonDarkholme/yats.vim' "TypeScript Syntax
    
call plug#end()
