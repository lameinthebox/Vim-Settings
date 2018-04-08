
function SetEnvironment(...)
	if (a:0)
		let env	= a:1
	else
		let env = Get('Environment')
	end

	call Set('\begin{'.env.'}')
	execute "normal! o "
	call Set('\end{'.env.'}')
	execute "normal! x\<up>o\<tab>"
	execute "startinsert!"
endfunction
