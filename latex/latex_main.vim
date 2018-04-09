function Compile()
	let cmd		= "!pdflatex %"
	execute cmd
endfunction

function OpenPDF()
	let name	= split(expand('%'), ".tex")[0].".pdf"
	let cmd		= "!gnome-terminal -x sh -c 'gnome-open ".name." && read continue && exit; exec bash'"
	execute cmd
endfunction

" Compile and Open
au FileType tex nmap <F3>		:call Compile()<CR>
au FileType tex nmap <F4>		:call OpenPDF()<CR>

" Environments
source ~/Vim-Settings/latex/latex_environment.vim

au FileType tex imap \env<CR>	<ESC>:call SetEnvironment()<CR>
au FileType tex imap \docu<CR>	<ESC>:call SetEnvironment('document')<CR>
au FileType tex imap \enum<CR>	<ESC>:call SetEnvironment_Enumerate()<CR>
au FileType tex imap \eqn<CR>	<ESC>:call SetEnvironment('equation')<CR>

" Math
source ~/Vim-Settings/latex/latex_math.vim

au FileType tex imap \mat<CR>    <ESC>:call Matrix()<CR>
