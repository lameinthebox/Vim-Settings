" C

au FileType c,cpp imap <F3>				<ESC><F3>
au FileType c,cpp imap <F4>				<ESC><F4>
au FileType c,cpp imap <F5>				<ESC><F5>
au FileType c,cpp imap <F6>				<ESC><F6>

au FileType c,cpp nmap <F3>				:! g++ -std=c++11 %<CR>
au FileType c,cpp nmap <F4>				:! ./a.out < input > output<CR>
au FileType c,cpp nmap <F5>				:! gnome-terminal -x sh -c './a.out && read continue && exit; exec bash'<CR>
au FileType c,cpp nmap <F6>				:! set guioptions+=m<CR>

au FileType c,cpp imap \io<CR>			\inout<CR>
au FileType c,cpp imap \inout<CR>		<ESC>:! touch input output<CR>:botright vs output<CR>:split input<CR>

au FileType c,cpp imap \comp<CR>		\compile<CR>
au FileType c,cpp imap \compile<CR>		<F3><CR>

au FileType c,cpp imap \r<CR>			\run<CR>
au FileType c,cpp imap \run<CR>			<F4><CR>
au FileType c,cpp imap \runsh<CR>		<F5><CR>

au FileType c,cpp imap \rename<CR>		<ESC>:call Refactor()<CR>A
au FileType c,cpp imap \refactor<CR>	<ESC>:call Refactor()<CR>A

au FileType c,cpp imap \hd<CR>			<ESC>:call Header()<CR>A
au FileType c,cpp imap \head<CR>		<ESC>:call Header()<CR>A
au FileType c,cpp imap \header<CR>		<ESC>:call Header()<CR>A

au FileType c,cpp imap \dec<CR>			<ESC>:call FunctionDeclaration()<CR>o
au FileType c,cpp imap \def<CR>			<ESC>:call FunctionDefinition()<CR>o
au FileType c,cpp imap \main<CR>		<ESC>:call FunctionDefinition('int', 'main', 'void/*int argc, char* argv[]*/', 'EXIT_SUCCESS')<CR>o

au FileType c,cpp imap \for<CR>			<ESC>:call ForLoop()<CR>o

au FileType c,cpp imap \forizn<CR>		<ESC>:call ForLoop('int i = 0', 'i < n', '++i')<CR>o
au FileType c,cpp imap \forizN<CR>		<ESC>:call ForLoop('int i = 0', 'i < N', '++i')<CR>o
au FileType c,cpp imap \forjzn<CR>		<ESC>:call ForLoop('int j = 0', 'j < n', '++j')<CR>o
au FileType c,cpp imap \forjzN<CR>		<ESC>:call ForLoop('int j = 0', 'j < N', '++j')<CR>o

au FileType c,cpp imap \forinz<CR>		<ESC>:call ForLoop('int i = n', '0 < i', '--i')<CR>o
au FileType c,cpp imap \foriNZ<CR>		<ESC>:call ForLoop('int i = N', '0 < i', '--i')<CR>o
au FileType c,cpp imap \forjnz<CR>		<ESC>:call ForLoop('int j = n', '0 < j', '--j')<CR>o
au FileType c,cpp imap \forjNz<CR>		<ESC>:call ForLoog('int j = N', '0 < j', '--j')<CR>o

au FileType c,cpp imap \if<CR>			<ESC>:call IfStatement()<CR>o
au FileType c,cpp imap \ifd<CR>			<ESC>:call IfStatement('DEBUG')<CR>o


function! FunctionDeclaration(...)
	if (a:0)
		let returnType	= a:1
		let name		= a:2
		let parameter	= a:3
	else
		let returnType	= Get('Return Type')
		let name		= Get('Function Name')
		let parameter	= Get('Parameters')
	end

	call Set(returnType.' '.name.Brace('(', ')', parameter).';')
	execute "normal! maG"
	call FunctionDefinition(returnType, name, parameter, '')
	execute "normal! O"
	execute "normal! `a"
endfunction


function! FunctionDefinition(...)
	if (a:0)
		let returnType	= a:1
		let name		= a:2
		let parameter	= a:3
		let returnVal	= a:4
	else
		let returnType	= Get('Return Type')
		let name		= Get('Function Name')
		let parameter	= Get('Parameters')
		let returnVal	= Get('Return')
	end

	execute "normal! O"
	call Set('/* ----- end of function '.name.' ----- */')
	execute "normal! O"
	call Set('}')
	execute "normal! O"
	call Set('return '.returnVal.';')
	execute "normal! O"
	call Set(returnType.' '.name.Brace('(', ')', parameter).' {')
	call Tabify()
endfunction


function! ForLoop(...)
	if (a:0)
		let init	= a:1
		let cond	= a:2
		let incr	= a:3
	else
		let init	= Get('Initial')
		let cond	= Get('Condition')
		let incr	= Get('Increment')
	end

	call Set('}')
	execute "normal! O"
	call Set('for('.init.'; '.cond.'; '.incr.') {')
	call Tabify()
endfunction


function! IfStatement(...)
	if (a:0)
		let cond	= a:1
	else
		let cond	= Get('Condition')
	end

	call Set('}')
	execute "normal! O"
	call Set('if('.cond.') {')
	call Tabify()
endfunction


function! Header(...)
	if (a:0)
		let header	= a:1
	else
		let header	= Get('Header')
	end

	execute "normal! mzggo"
	call Set('#include <'.header.'>')
	execute "normal! `zA"
endfunction

