"=============================================================================
" File:		txt2pdf.vim
" Author:	SANFACE Software (sanface@sanface.com) http://www.sanface.com/
" Last Change:	2004 December 30
" Version:	2.7
" Purpose:	Plugin to save the current file and convert it to PDF using
" 		txt2pdf. You need to istall txt2pdf
" 		http://www.sanface.com/txt2pdf.html
"
" Comments:	The following keys are mapped like default
"
"	    	<F2>:	Save the current file being edited and pass it to
"	    		txt2pdf to convert it into PDF.
"			You can change the key using the global variable
"			txt2pdf_key
"		<F3>:	Input dialog to enter the txt2pdf configuration
"			file path.
"			You can change the key using the global variable
"			txt2pdfconf_key
"
"		Using :Txt2pdf you can pass to txt2pdf linear parameters
"		e.g. :Txt2pdf -configure /your_path/your_txt2pdf.cfg
"
"		Remember to set global variables:
"		txt2pdf_path	: the path of txt2pdf executable
"		txt2pdfcfg_path	: the path of your configuration file (usually
"				  txt2pdf.cfg)
"		txt2pdf_key	: the key to start the command (deafult <F2>)
"		txt2pdfconf_key	: the key to start an input dialog to enter
"				  the txt2pdf configuration file path
"				  (deafult <F3>)
"		in vimrc file.
"		for Unix and OS/2:	~/.vimrc
"		for Amiga:		s:.vimrc
"		for MS-DOS and Win32:	$VIM\_vimrc
"		for OpenVMS:		sys$login:.vimrc\
"
"		e.g. let txt2pdf_path = '\your_path\txt2pdf.exe'
"
"           	Questions/Comments, feel free to e-mail us, 
"		         sanface@sanface.com
"
"		SANFACE Software is going to give you a free license for every
"		good modify to txt2pdf.vim
"
"		Thanks,
"
"		SANFACE Software http://www.sanface.com/
"		
"=============================================================================

" Has this already been loaded?
if exists('loaded_txt2pdf')
  finish
endif

let loaded_txt2pdf = 1

" g:txt2pdf: txt2pdf path
if !exists("g:txt2pdf_path")
    let g:txt2pdf_path = '\program\txt2pdf-7.6\txt2pdf.exe'
endif

" g:txt2pdfcfg_path: txt2pdf.cfg path (default '')

" g:txt2pdf_key: txt2pdf key (default <F2>)
if !exists("g:txt2pdf_key")
    let g:txt2pdf_key = '<F2>'
endif

" g:txt2pdfconf_key: txt2pdfconf key (default <F3>)
if !exists("g:txt2pdfconf_key")
    let g:txt2pdfconf_key = '<F3>'
endif

let s:filename=expand('%')

" Map the key to open the function window
exe "nnoremap <silent> " . g:txt2pdf_key . " :call Txt2pdf()<CR>"
exe "nnoremap <silent> " . g:txt2pdfconf_key . " :call SetTxt2pdfConf()<CR>"
command! -narg=* Txt2pdf :call Txt2pdf(<q-args>)

function! SetTxt2pdfConf()
  let txt2pdfconf = inputdialog("Enter your txt2pdf configuration file path")
  if (txt2pdfconf == "")
    echo "No change made .. please enter a valid txt2pdf configuration file path"
  endif
  let g:txt2pdfcfg_path = txt2pdfconf
endfunction

function! Txt2pdf(...)
	:w
	if a:0 == 0
	  let txt2pdf_options=""
	else
	  let txt2pdf_options=a:1
	endif
        if !exists("g:txt2pdfcfg_path")
          let txt2pdf_cmd = g:txt2pdf_path . " " . txt2pdf_options . " " . s:filename . ""
        endif
        if exists("g:txt2pdfcfg_path")
          let txt2pdf_cmd = g:txt2pdf_path . " " . txt2pdf_options . " " . "-configure " . g:txt2pdfcfg_path. " " . s:filename . ""
        endif	

" To see inside txt2pdf_cmd
" echo txt2pdf_cmd

        let txt2pdf_cmd_output = system(txt2pdf_cmd)

        if v:shell_error && txt2pdf_cmd_output != ""
            echohl WarningMsg | echon txt2pdf_cmd_output | echohl None
            return
        endif
endfunction

" Note:		We've developed this vim module on Windows using vim :)
" 		Then we tested it on Linux.
" 		A big surprise: it doesn't work.
" 		A vim module with <CR> <NL> EOL doesn't	work on Linux.
" 		Vim scripts saved with UNIX-style EOL characters could run on
" 		any platform. 
" 		This is the vim modline to save in Unix style
"
" vim:ff=unix
