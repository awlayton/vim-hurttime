" Author: awlayton <alex@layton.in>
" Description: Add Pavlok support to vim-hardtime (via pavvim)

if exists('s:loaded')
    finish
endif
let s:loaded = 1

let g:hurttime#stimulus = 'shock'
let g:hurttime#intensity = 1


" Stick stuff into the middle of vim-hardtime
let s:oldTooSoon = funcref('TooSoon')
function! TooSoon(...)
    let l:key = a:0 >= 1 ? a:1 : 'some key'
    let l:mode = a:0 >= 2 ? a:2 : 'some mode'
    let l:mesg = 'hurttime: pressed ' . l:key . ' in ' . l:mode
    call pavvim#stimulus(g:hurttime#stimulus, g:hurttime#intensity, l:mesg)
    if a:0 == 2
        return s:oldTooSoon(a:1, a:2)
    elseif a:0 == 1
        return s:oldTooSoon(a:1)
    else
        return s:oldTooSoon()
    endif
endfunction
