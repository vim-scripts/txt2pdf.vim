This is a VIM plugin to save the current file and convert it to PDF using 
txt2pdf shareware
http://www.sanface.com/txt2pdf.html

You can also use txt2pdf PRO http://www.sanface.com/txt2pdfPRO.html and
txt2pdf PRO + crypt http://www.sanface.com/txt2pdfPROcrypt.html to
make more complex PDFs like
http://www.sanface.com/pdf/Purchase_Order.pdf
http://www.sanface.com/pdf/invoice.pdf
http://www.sanface.com/pdf/hfmus.pdf
http://www.sanface.com/pdf/heraldbill.pdf

Inside txt2pdfvim distribution you've three files:
plugin/txt2pdf.vim	: the VIM plugin
doc/txt2pdf.txt		: the plugin documentation
syntax/txt2pdf.vim	: the syntax for txt2pdf.cfg

The plugin file should be placed in a sub-directory called plugin that exists
in a directory early in your 'runtimepath', for example ~/.vim/plugin.

The help file should be placed in a directory named doc that exists at the
same level as your plugin directory, for example ~/.vim/doc.  Next run
'helptags' on this doc directory so that you can access this file with the
'help' command (:help txt2pdf).

The file with the syntax for txt2pdf.cfg should be placed in a directory named
syntax that exists at the same level as your plugin directory, for example
~/.vim/syntax. 
Add the following two lines to your $VIMRUNTIME\filetype.vim
" txt2pdf configuration files
au BufNewFile,BufRead txt2pdf.cfg                setf txt2pdf
When you edit with vim txt2pdf.cfg you can see the with different colours the syntax of txt2pdf.cfg

The simplest approach is to expand the ZIP file containing these three files
into your runtimepath directory preserving the pathnames, and then run
'helptags' and add the 2 lines to filetype.vim.

Remember to set global variables:
	txt2pdf_path	: the path of txt2pdf executable
	txt2pdfcfg_path	: the path of your configuration file (usually
			  txt2pdf.cfg)
	txt2pdf_key	: the key to start the command (deafult <F2>)
	txt2pdfconf_key	: the key to start an input dialog to enter the txt2pdf
			  configuration file path (deafult <F3>)
	in vimrc file.
for Unix and OS/2:	~/.vimrc
for Amiga:		s:.vimrc
for MS-DOS and Win32:	$VIM\_vimrc
for OpenVMS:		sys$login:.vimrc\

