" Vim syntax file
" Language:	txt2pdf configuration file
" Maintainer:	SANFACE Software <sanface@sanface.com>
" Last Change:	2004 December 30

" version 1.9
"
"Vim 6.0 installation
"
"  1. Place nsis.vim to the $VIMRUNTIME\SYNTAX\
"
"  2. Add the following two lines to your $VIMRUNTIME\filetype.vim
"
"  " txt2pdf configuration files
"  au BufNewFile,BufRead txt2pdf.cfg                setf txt2pdf
"
"  3. Start vim and enjoy.
"
"Vim 5.8 installation
"
"  1. Place nsis.vim to the $VIMRUNTIME\SYNTAX\
"
"  2. Add the following two lines to your $VIMRUNTIME\filetype.vim
"
"  " txt2pdf configuration files
"  au BufNewFile,BufRead txt2pdf.cfg                set ft=txt2pdf
"
"  3. Open $VIMRUNTIME\SYNTAX\synload.vim for edit, search for
"  'delcommand SynAu' and insert the following line before
"
"  SynAu txt2pdf
"
"  4. Start vim and enjoy.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword	txt2pdfInfo	author creator keywords subject title pdfversion
syn keyword	txt2pdfLayers	bgdesign fgdesign
syn keyword	txt2pdfGeneral	paper landscape font npage lines tab pointSize vertSpace transition pagemode pagelayout rotate typeencoding sleep ViewerPreferences fit zoom pagemark withextension pdfversion annotationtext underline prepdf
syn keyword	txt2pdfMail	mailhost mailfrom mailsubject mailbody sendmail notify mail_body_file priority
syn keyword	txt2pdfExternalFiles	list colour fontmark beginfile endfile inputmod outputmod
syn keyword	txt2pdfDir	tmpdir pdfdir txtdir
syn keyword	txt2pdfLanguage	tradchinese simplchinese japanese korean
syn keyword	txt2pdfPRO	topmargin leftmargin compress compress_level bgdesign1 bgdesign1no bgdesignlast fgdesign1 link npagex npagey annotationx annotationy performance fontfile ftphost ftpuser ftppassword ftpdirectory

syn region	txt2pdfComment	start="#" end="$"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_txt2pdf_syn_inits")
  if version < 508
    let did_txt2pdf_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink txt2pdfComment			Comment
  HiLink txt2pdfInfo			Type
  HiLink txt2pdfLayers			Type
  HiLink txt2pdfGeneral			Type
  HiLink txt2pdfMail			Type
  HiLink txt2pdfExternalFiles		Type
  HiLink txt2pdfDir			Type
  HiLink txt2pdfLanguage		Type
  HiLink txt2pdfPRO			Special

  delcommand HiLink
endif

let b:current_syntax = "txt2pdf"

