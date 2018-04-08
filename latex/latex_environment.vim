
function SetEnvironment(...)
	if (a:0)
		let env	= a:1
		let opt = ''
		for token in a:000[1:a:0]
			let opt = opt.token.', '
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
	execute "normal! x\<up>o \<bs>"
	execute "startinsert!"
endfunction

function SetEnvironment_Enumerate(...)
	if (a:0)
		let label = a:1
	else
		let label = Get('Label')
	end

	if label == '(1)'
		let label = '(\arabic*)'
	elseif label == '1)'
		let label = '\arabic*)'
	elseif label == '(a)'
		let label = '(\alph*)'
	elseif label == 'a)'
		let label = '\alph*)'
	elseif label == '(i)'
		let label = '(\roman*)'
	elseif label == 'i)'
		let label = '\roman*)'
	endif

	call SetEnvironment('enumerate', 'label='.label)
endfunction
