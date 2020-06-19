if exists('g:loaded_terminal')
    finish
endif
let g:loaded_terminal = 1

command! MonkeyTerminal call myfunctions#terminal#MonkeyTerminalToggle()
