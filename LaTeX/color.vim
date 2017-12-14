
au FileType tex imap \defcol<CR>			<ESC>:call DefineColor()<CR>o

function! DefineColor(...)
	let cmd = '\definecolor'

	if a:0
		let name	= a:1
		let type	= a:2
		let value	= a:3
	else
		let name	= Get('Name')
		let type	= Get('Type')
		let value	= Get('Value')
	end

	call Set(cmd.'{'.name.'}{'.type.'}{'.value.'}')

endfunction

au FileType tex imap \solarized<CR>		<ESC>:call DefineColor('base03','RGB','0,43,54')<CR>o<ESC>:call DefineColor('base02','RGB','7,54,66')<CR>o<ESC>:call DefineColor('base01','RGB','88,110,117')<CR>o<ESC>:call DefineColor('base00','RGB','101,123,131')<CR>o<ESC>:call DefineColor('base0','RGB','131,148,150')<CR>o<ESC>:call DefineColor('base1','RGB','147,161,161')<CR>o<ESC>:call DefineColor('base2','RGB','238,232,213')<CR>o<ESC>:call DefineColor('base3','RGB','253,246,227')<CR>o<ESC>:call DefineColor('yellow','RGB','181,131,0')<CR>o<ESC>:call DefineColor('orange','RGB','203,75,22')<CR>o<ESC>:call DefineColor('red','RGB','220,50,47')<CR>o<ESC>:call DefineColor('magenta','RGB','211,54,130')<CR>o<ESC>:call DefineColor('violet','RGB','108,113,196')<CR>o<ESC>:call DefineColor('blue','RGB','38,139,210')<CR>o<ESC>:call DefineColor('cyan','RGB','42,161,152')<CR>o<ESC>:call DefineColor('green','RGB','133,153,0')<CR>o
