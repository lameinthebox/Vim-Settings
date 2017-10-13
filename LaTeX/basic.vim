" Basic Functions

function! OpenLaTeX()
	let name = split(expand('%'), ".tex")[0].".pdf"
	let cmd = "! gnome-terminal -x sh -c 'okular ".name." && read continue && exit;exec bash'"
	execute cmd
endfunction


function! Tabify()
	:normal mzgg=G`z
endfunction


function! Get(...)
	if a:0
		let tag = a:1
	else
		let tag = "Content"
	end

	call inputsave()
	let content = input(tag.": ")
	call inputrestore()

	return content
endfunction


function! Set(token)
	let token	= a:token
	let curline	= getline('.')

	call setline('.', curline.token)
endfunction


function! Brace(open, close, ...)
	let open	= a:open
	let close	= a:close

	if (a:0)
		let content = a:1
	else
		let content = Get()
	end

	return open.content.close
endfunction


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

		call Set(Brace('[', ']', str))
		call Tabify()
	end
endfunction

