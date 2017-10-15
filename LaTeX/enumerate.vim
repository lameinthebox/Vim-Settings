" Enumerate
source ~/vimset/LaTeX/basic.vim

function! Enumerate(...)
	if (a:0)
		let label = a:1
	else
		let label = Get('Label')
	end

	call SetScope('enumerate')
	call SetOption('label='.label)
	call append('.', '\item ')
	call append('.', '\setcounter{enumi}{0}')
	execute 'normal! jjA'
	call Tabify()

endfunction

au FileType tex imap \enum<CR>		<ESC>:call Enumerate('\arabic*)')<CR>A
au FileType tex imap \ealp<CR>		<ESC>:call Enumerate('\alph*)')<CR>A
au FileType tex imap \ebul<CR>		<ESC>:call Enumerate('$\bullet$')<CR>A
au FileType tex imap \edag<CR>		<ESC>:call Enumerate('$\dagger$')<CR>A

