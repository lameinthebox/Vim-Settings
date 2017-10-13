" Baisic Functions
" ##########################################################################################################
au FileType tex imap \tabify<CR>	<ESC>:call Tabify()<CR>i

function! Tabify()
	:normal mzgg=G`z
endfunction

" Paranthesis
" ##########################################################################################################

function! Brace(open, close, ...)
	let open	= a:open
	let close	= a:close

	let curline = getline('.')

	if a:0
		let content = a:1
	else
		call inputsave()
		let content = input('Content: ')
		call inputrestore()
	end
	
	call setline('.', curline.open.content.close)
endfunction

au FileType tex imap (<CR>	<ESC>:call Brace('(',')')<CR>i<End>
au FileType tex imap {<CR>	<ESC>:call Brace('{','}')<CR>i<End>
au FileType tex imap [<CR>	<ESC>:call Brace('[',']')<CR>i<End>

au FileType tex imap $<CR>	$<End>$

au FileType tex imap _<CR>	_{<CR>
au FileType tex imap ^<CR>	^{<CR>

au FileType tex imap \pack<CR>	\usepackage{<CR><CR>

" Fonts
" ##########################################################################################################
au FileType tex imap \bold<CR>		\textbf{<CR>
au FileType tex imap \textbf<CR>	\textbf{<CR>
au FileType tex imap \mbox<CR>		\mbox{<CR>
au FileType tex imap \mathbb<CR>	\mathbb{<CR>
au FileType tex imap \mathcal<CR>	\mathcal{<CR>


" Equation
" ##########################################################################################################
au FileType tex imap \array<CR>	\left(\begin{array}{ccc}\end{array}\right)<ESC>bbbbb<Left>i<CR><UP><End><CR>
au FileType tex imap \case<CR>	\left\{\begin{array}{ll}\end{array}\right.<ESC>bbbbb<Left>i<CR><UP><End><CR>

" Enumerate
" ##########################################################################################################
au FileType tex imap \enumerate<CR>	<ESC>:call HelpEnumerate()<CR>A

function! Enumerate(label)
	let label = a:label.''
	call setline('.', '\end{enumerate}')
	:normal O
	call setline('.', '\begin{enumerate}[label='.label.']')
	execute "normal! A\<ESC>o"
	call setline('.', '\setcounter{enumi}{0}')
	:normal o
	call setline('.', '\item ')
	call Tabify()
endfunction

function! HelpEnumerate(...)
	if a:0
		call Enumerate(a:1)
	else
		call inputsave()
		let label = input('Label: ')
		call inputrestore()
		call Enumerate(label)
	end
endfunction

au FileType tex imap \enum<CR>	<ESC>:call HelpEnumerate('\arabic*)')<CR>A
au FileType tex imap \ealp<CR>	<ESC>:call HelpEnumerate('\alph*)')<CR>A
au FileType tex imap \ebul<CR>	<ESC>:call HelpEnumerate('$\bullet$')<CR>A

" Scope
" ##########################################################################################################
au FileType tex imap \scope<CR>	<ESC>:call GetScope(0)<CR>i

"function! Scope(scope)
"	let scope = a:scope
"	call setline('.', '\end{'.a:scope.'}')
"	execute "normal! O"
"	call setline('.', '\begin{'.a:scope.'}')
"	execute "normal! A\<ESC>o"
"	call Tabify()
"endfunction
"
"function! HelpScope(...)
"	if a:0
"		call Scope(a:1)
"	else
"		call inputsave()
"		let scope = input('Scope: ')
"		call inputrestore()
"		call Scope(scope)
"	end
"endfunction
"
function! SetScope(scope, ...)
	let scope	= a:scope

	call setline('.', '\end{'.scope.'}')
	execute "normal! O"
	call setline('.', '\begin{'.scope.'}')

	if(a:0) 
		execute "normal! o"
		call Brace('[', ']', a:1)
	end

	execute "normal! A\<ESC>o"
	call Tabify()

endfunction

function! GetScope(opFlag, ...)
	if a:0
		let scope = a:1
	else
		call inputsave()
		let scope = input('Scope: ')
		call inputrestore()
	end

	if a:opFlag
		call SetScope(scope, a:2)
	else
		call SetScope(scope)
	end
endfunction

au FileType tex imap \docu<CR>		<ESC>:call GetScope(0, 'document')<CR>i
au FileType tex imap \eqn<CR>		<ESC>:call GetScope(0, 'eqnarray*')<CR>i
au FileType tex imap \tbox<CR>		<ESC>:call GetScope(0, 'tcolorbox')<CR>i

au FileType tex imap \sec<CR>		\section{<CR><CR>
au FileType tex imap \sub<CR>		\subsection{<CR><CR>
au FileType tex imap \para<CR>		\paragraph{<CR><Space>
au FileType tex imap \circuit<CR>	<ESC>:call GetScope(1, 'tikzpicture', 'scale=2')<CR>i\draw[color=black, thick]<CR>;<Up><End><CR>
au FileType tex imap \tabbing<CR>	<ESC>:call GetScope(0, 'tabbing')<CR>ileft<Space>\=left<Space>\=left<Space>\=left<Space>\kill<CR>\tabify<CR>
au FileType tex imap \tabular<CR>	\begin{tabular}{c<Bar>c<Right><CR>\end{tabular}<Up><End><CR>\hline\hline<CR>\hline\hline<Up><End><CR>

" Figures
function! DrawStack()
	call inputsave()
	let size = input('Stack size: ')
	call inputrestore()

	let style = "{draw, anchor=text, rectangle split, rectangle split parts=".size.", minimum width=2cm}"
	let option = "every node/.style=".style

	let index = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

	call GetScope(1, 'tikzpicture', option)
	call setline('.', '\node (R) {')
	execute "normal! ma"

	let i = 0
	while i <= size
		execute "normal! o"
		call setline('.', '\nodepart{'.index[i].'}')
		let i += 1
	endwhile

	call setline('.', '};')
	call Tabify()
	execute "normal! `a"
endfunction

au FileType tex imap \drawstack<CR>		<ESC>:call DrawStack()<CR><Down>A

au FileType tex imap \drawtree<CR>		\Tree[.]<Left>

" Summation
" ##########################################################################################################
au FileType tex imap \frac<CR>	\frac{<CR>{<CR>
au FileType tex imap \int<CR>	<ESC>:call Arith('\int')<CR>A
au FileType tex imap \sum<CR>	<ESC>:call Arith('\sum')<CR>A
au FileType tex imap \prod<CR>	<ESC>:call Arith('\prod')<CR>A

function! Arith(input)
	let type = a:input.''

	let curline = getline('.')
	call inputsave()
	let ll = input('Lower Limit: ')
	let ul = input('Upper Limit: ')
	call inputrestore()
	call setline('.', curline.type.'_{'.ll.'}^{'.ul.'}')
endfunction


" Arrows
au FileType tex imap <--><CR>	\longleftrightarrow
au FileType tex imap --><CR>	\longrightarrow
au FileType tex imap <--<CR>	\longleftarrow
au FileType tex imap <==><CR>	\Longleftrightarrow
au FileType tex imap ==><CR>	\Longrightarrow
au FileType	tex imap <==<CR>	\Longleftarrow
au FileType tex imap <-><CR>	\leftrightarrow
au FileType tex imap -><CR>		\rightarrow
au FileType tex imap <-<CR>		\leftarrow
au FileType tex imap <=><CR>	\Leftrightarrow
au FileType tex imap =><CR>		\Rightarrow
au FileType tex imap <=<CR>		\Leftarrow

" Sep
" ##########################################################################################################
au FileType tex imap \colsep<CR>	{\setlength\arraycolsep{2pt}}<Left><CR><Up><End><CR>

" Open PDF
function OpenLaTeX()
	let name = split(expand('%'), ".tex")[0].".pdf"
	let cmd = "! gnome-terminal -x sh -c 'okular ".name." && read continue && exit;exec bash'"
	execute cmd
endfunction
