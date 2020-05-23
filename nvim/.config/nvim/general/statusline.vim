function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#MoreMsg#
set statusline+=\ %f\                
set statusline+=[%M%H]
set statusline+=%=
set statusline+=Ln\ 
set statusline+=%l,
set statusline+=Col\ 
set statusline+=%c\  
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ 
set statusline+=%y
