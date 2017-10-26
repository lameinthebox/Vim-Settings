" Symbols
"source ~/Vim-Settings/LaTeX/basic.vim

function! Arith(input)
	let type = a:input.''
	let ll = Brace('{', '}', Get('Lower Limit'))
	let ul = Brace('{', '}', Get('Upper Limit'))

	call Set(type.'_'.ll.'^'.ul)

endfunction

function! Fraction()
	let numer = Brace('{', '}', Get('Numerator'))
	let denom = Brace('{', '}', Get('Denominator'))

	call Set('\frac'.numer.denom)

endfunction


au FileType tex imap \frac<CR>	<ESC>:call Fraction()<CR>A
au FileType tex imap \int<CR>	<ESC>:call Arith('\int')<CR>A
au FileType tex imap \sum<CR>	<ESC>:call Arith('\sum')<CR>A
au FileType tex imap \prod<CR>	<ESC>:call Arith('\prod')<CR>A


