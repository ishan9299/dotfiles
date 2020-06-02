# Defined in - @ line 1
function htop --wraps='htop -t' --description 'alias htop=htop -t'
 command htop -t $argv;
end
