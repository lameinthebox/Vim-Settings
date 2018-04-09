
function Matrix(...)
    if a:0
        let l = a:1
        let r = a:2
        let f = a:3
    else
        let l = Get('Left')
        let r = Get('Right')
        let f = Get('Align')
    endif

    if l == '{'
        let l = '\'.l
    elseif l == ''
        let l = '.'
    endif

    if r == '}'
        let r = '\'.r
    elseif r == ''
        let r = '.'
    endif

    call Set('\left'.l.'\begin{array}{'.f.'}')
    execute "normal! o "
    call Set('\end{array}\right'.r)
    execute "normal! \<up>o\<tab>"
    execute "startinsert!"
endfunction


