au FileType c,cpp imap <F3>		<ESC><F3>
au FileType c,cpp imap <F4>		<ESC><F4>
au FileType c,cpp imap <F5>		<ESC><F5>
au FileType c,cpp imap <F6>		<ESC><F6>

au FileType c,cpp nmap <F3>		:! g++ -std=c++11 %<CR>
au FileType c,cpp nmap <F4>		:! ./a.out < input > output<CR>
au FileType c,cpp nmap <F5>		:! gnome-terminal -x sh -c './a.out && read continue && exit; exec bash'<CR>
au FileType c,cpp nmap <F6>		:! set guioptions+=m<CR>

au FileType c,cpp imap \inout<CR>	<ESC>:! touch input output<CR>:botright vs output<CR>:split input<CR>
