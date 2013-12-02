if !has('python')
    echo "Jfind error: Required vim compiled with +python"
    finish
endif

function! Jfind()

python << EOF

print 'Hello'

EOF

endfunction

command! -nargs=0 Jfind call Jfind()

