let g:LanguageClient_serverCommands = {
    \ 'rust': ['/usr/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
    \ 'python': ['~/.local/bin/pyls'],
    \ 'c' : ['/usr/bin/ccls'],
    \ 'cpp' : ['/usr/bin/ccls'],
    \ 'java' : ['/usr/bin/jdtls'],
    \ }

nmap <F5> <Plug>(lcn-menu)
