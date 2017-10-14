source ./basic.vim


au FileType tex imap \pack<CR>	\usepackage<ESC>:call Set(Brace('{', '}', Get('Package')))<CR>A<CR>

" ##########################################################################################################
au FileType tex imap \array<CR>	\left(\begin{array}{ccc}\end{array}\right)<ESC>bbbbb<Left>i<CR><UP><End><CR>
au FileType tex imap \case<CR>	\left\{\begin{array}{ll}\end{array}\right.<ESC>bbbbb<Left>i<CR><UP><End><CR>

" Scope
" ##########################################################################################################
au FileType tex imap \scope<CR>	<ESC>:call SetScope()<CR>A

au FileType tex imap \docu<CR>		<ESC>:call SetScope('document')<CR>i
au FileType tex imap \eqn<CR>		<ESC>:call SetScope('eqnarray*')<CR>i
au FileType tex imap \tbox<CR>		<ESC>:call SetScope('tcolorbox')<CR>i

au FileType tex imap \sec<CR>		\section{<CR><CR>
au FileType tex imap \sub<CR>		\subsection{<CR><CR>
au FileType tex imap \para<CR>		\paragraph{<CR><Space>

au FileType tex imap \tabbing<CR>	<ESC>:call SetScope('tabbing')<CR>:call Set('left \=left \=left \=left \=left \kill')<CR>:call Tabify()<CR>o

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

" Sep
" ##########################################################################################################
au FileType tex imap \colsep<CR>	{\setlength\arraycolsep{2pt}}<Left><CR><Up><End><CR>
