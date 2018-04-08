
function SetEnvironment(...)
	if (a:0)
		let env	= a:1
		let opt = ''
		for token in a:000[2:a:0]
			let opt = opt.', '.token
		endfor
	else
		let env = Get('Environment')
		let opt = Get('Options')
	end

	call Set('\begin{'.env.'}')
	execute "normal! o\<tab> "
	call Set('['.opt.']')
	execute "normal! xo\<bs> "
	call Set('\end{'.env.'}')
	execute "normal! x\<up>o\<tab>"
	execute "startinsert!"
endfunction
