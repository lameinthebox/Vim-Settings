" Fonts

au FileType tex imap \bf<CR>			\textbf{<CR>
au FileType tex imap \bold<CR>			\textbf{<CR>
au FileType tex imap \textbf<CR>		\textbf{<CR>

au FileType tex imap \tt<CR>			\texttt{<CR>
au FileType tex imap \texttt<CR>		\texttt{<CR>

au FileType tex imap \mb<CR>			\mbox{<CR>
au FileType tex imap \mbox<CR>			\mbox{<CR>

au FileType tex imap \set<CR>			\mathbb{<CR>
au FileType tex imap \bb<CR>			\mathbb{<CR>
au FileType tex imap \mathbb<CR>		\mathbb{<CR>

au FileType tex imap \mc<CR>			\mathcal{<CR>
au FileType tex imap \mcal<CR>			\mathcal{<CR>
au FileType tex imap \mathcal<CR>		\mathcal{<CR>

au FileType tex imap \em<CR>			\emph{<CR>
au FileType tex imap \emph<CR>			\emph{<CR>

au FileType tex imap "<CR>				\lq\lq <ESC>:call Set(Get())<CR>A\rq\rq\

