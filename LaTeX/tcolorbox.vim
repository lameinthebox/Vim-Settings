au FileType tex imap \packtbox<CR>		\usepackage<ESC>:call SetOption('most')<CR><ESC>:call Set(Brace('{','}','tcolorbox'))<CR>o

au FileType tex imap \qbox<CR>			<ESC>:call SetScope('qbox')<CR><Bs>:call Set(Brace('{','}', Get('Title')))<CR>o<Del>

au FileType tex imap \defqbox<CR>		<ESC>:call Set('\newtcolorbox{qbox}[2][]{')<CR>o<ESC>:call SetLines('%colback=white','%grow to right by=0mm','%grow to left by=0mm','boxrule=0pt','breakable', 'enhanced jigsaw', 'borderline west={4pt}{0pt}{black}','title={#2\par}','colbacktitle={gray}','coltitle={black}','fonttitle={\large\bfseries}','attach title to upper={}','#1')<CR>o<ESC>:call Set('}')<CR>o
