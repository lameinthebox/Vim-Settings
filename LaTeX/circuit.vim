" Circuit
source ./basic.vim

au FileType tex imap \circuit<CR>	<ESC>:call SetScope('tikzpicture')<CR>:call SetOption('scale=2')<CR>A<CR><ESC>:call Set('\draw')<CR>:call SetOption('color=black', 'thick')<CR>A<CR>;<Up><ESC>o

au FileType tex imap \bat<CR>			to<ESC>:call SetOption('battery', 'v>='.Brace('$', '$', Get('Voltage')))<CR>A<Space>
au FileType tex imap \avs<CR>			to<ESC>:call SetOption('american voltage source', 'v>='.Brace('$', '$', Get('Voltage')))<CR>A<Space>
au FileType tex imap \acvs<CR>			to<ESC>:call SetOption('american controlled voltage source', 'v>='.Brace('$', '$', Get('Voltage')))<CR>A<Space>
au FileType tex imap \acs<CR>			to<ESC>:call SetOption('american current source', 'i>='.Brace('$', '$', Get('Current')))<CR>A<Space>
au FileType tex imap \accs<CR>			to<ESC>:call SetOption('american controlled voltage source', 'i>='.Brace('$', '$', Get('Current')))<CR>A<Space>
au FileType tex imap \res<CR>			to<ESC>:call SetOption('resistor', 'label='.Brace('$', '$', Get('Resistance')))<CR>A<Space>
au FileType tex imap \short<CR>			to<ESC>:call SetOption('short')<CR>A<Space>

au FileType tex imap \circ<CR>			node<ESC>:call SetOption('circ', 'label='.Get('Position').':'.Brace('$', '$', Get('Label')))<CR>A{}<Space>
au FileType tex imap \gr<CR>			node<ESC>:call SetOption('ground')<CR>A{}<Space>
