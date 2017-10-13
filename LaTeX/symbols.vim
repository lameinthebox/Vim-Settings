" Symbols
source ./basic.vim

au FileType tex imap \frac<CR>	\frac{<CR>{<CR>
au FileType tex imap \int<CR>	<ESC>:call Arith('\int')<CR>A
au FileType tex imap \sum<CR>	<ESC>:call Arith('\sum')<CR>A
au FileType tex imap \prod<CR>	<ESC>:call Arith('\prod')<CR>A

function! Arith(input)
	let type = a:input.''
	let ll = Brace('{', '}', Get('Lower Limit'))
	let ul = Brace('{', '}', Get('Upper Limit'))

	call Set(type.'_'.ll.'^'.ul)
endfunction

