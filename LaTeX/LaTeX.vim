source ~/vimset/LaTeX/tmp.vim
source ~/vimset/LaTeX/basic.vim

source ~/vimset/LaTeX/arrows.vim
source ~/vimset/LaTeX/circuit.vim
source ~/vimset/LaTeX/enumerate.vim
source ~/vimset/LaTeX/fonts.vim
source ~/vimset/LaTeX/init.vim
source ~/vimset/LaTeX/symbols.vim

au FileType tex nmap <silent> <F3>			:! pdflatex %<CR>
au FileType tex nmap <silent> <F4>			:call OpenLaTeX()<CR>

au FileType tex imap \pack<CR>			\usepackage<ESC>:call Set(Brace('{', '}', Get('Package')))<CR>A<CR>

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
