source ~/Vim-Settings/LaTeX/tmp.vim

source ~/Vim-Settings/LaTeX/arrows.vim
source ~/Vim-Settings/LaTeX/circuit.vim
source ~/Vim-Settings/LaTeX/color.vim	
source ~/Vim-Settings/LaTeX/enumerate.vim
source ~/Vim-Settings/LaTeX/fonts.vim
source ~/Vim-Settings/LaTeX/init.vim
source ~/Vim-Settings/LaTeX/symbols.vim

function! OpenLaTeX()
	let name = split(expand('%'), ".tex")[0].".pdf"
	let cmd = "! gnome-terminal -x sh -c 'okular ".name." && read continue && exit;exec bash'"
	execute cmd
endfunction


au FileType tex nmap <silent> <F3>			:! pdflatex %<CR>
au FileType tex nmap <silent> <F4>			:call OpenLaTeX()<CR>

au FileType tex imap \pack<CR>			\usepackage<ESC>:call SetOption(Get('Options'))<CR>:call Set(Brace('{', '}', Get('Package')))<CR>A<CR>

au FileType tex imap \tb<CR>			<ESC>:call Tabify()<CR>i

au FileType tex imap (<CR>			<ESC>:call Set(Brace('(', ')'))<CR>A
au FileType tex imap {<CR>			<ESC>:call Set(Brace('{', '}'))<CR>A
au FileType tex imap [<CR>			<ESC>:call Set(Brace('[', ']'))<CR>A
au FileType tex imap $<CR>			<ESC>:call Set(Brace('$', '$'))<CR>A

au FileType tex imap _<CR>			_{<CR>
au FileType tex imap ^<CR>			^{<CR>

au FileType tex imap \sc<CR>			<ESC>:call SetScope()<CR>A
au FileType tex imap \scope<CR>			<ESC>:call SetScope()<CR>A
au FileType tex imap \begin<CR>			\begin<ESC>:call Set(Brace('{', '}', Get('Scope')))<CR>A<CR>
au FileType tex imap \end<CR>			\end<ESC>:call Set(Brace('{', '}', Get('Scope')))<CR>A<CR>

au FileType tex imap \en<CR>			<ESC>:call Enumerate()<CR>A


function! SetScope(...)
	if (a:0)
		let scope = Brace('{', '}', a:1)
	else
		let scope = Brace('{', '}', Get('Scope'))
	end

	call Set('\end'.scope)
	execute 'normal! O'
	call Set('\begin'.scope)
	execute 'normal! o'
	call Tabify()
endfunction


function! SetOption(...)
	if (a:0)
		let str = a:1.''

		for token in a:000[1:a:0]
			let str = str.', '.token
		endfor

"	if (a:0)
"		let str = Merge(a:000)

		call Set(Brace('[', ']', str))
		call Tabify()
	end
endfunction

