# Defined in - @ line 1
function ls --wraps='exa --long' --description 'alias ls=exa --long'
  exa --long $argv;
end
