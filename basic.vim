" Basic Functions

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


function! Merge(...)
	if a:0
		let str = a:1.''

		for token in a:000[1:a:0]
			let str = str.', '.token
		endfor

		return str
	end
endfunction


function! Refactor(...)
	if a:0
		let old	= a:1
		let new	= a:2
	else 
		let old = Get('From')
		let new = Get('To')
	end

	let cmd	= '%s/\<'.old.'\>/'.new.'/gc'
	execute cmd
endfunction
