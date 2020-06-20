let g:goyo_width = 140
call myfunctions#lazy#lazy({
      \   'pack': 'goyo.vim',
      \   'plugin': 'goyo.vim',
      \   'commands': {
      \     'Goyo': '-nargs=? -bar -bang'
      \   }
      \ })
