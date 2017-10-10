" LaTeX filetype
"	  Language: LaTeX (ft=tex)
"	Maintainer: Srinath Avadhanula
"		 Email: srinath@fastmail.fm


if exists('b:suppress_latex_suite') && b:suppress_latex_suite == 1
	finish
endif

let mapleader = ";"
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_GotoError=0  " this keeps the edit window fixed

let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
 
if system('uname') !~ "darwin"
  let g:Tex_ViewRule_pdf='okular'
  let g:Tex_ViewRule_ps = 'gnome-open'
  let g:Tex_ViewRule_dvi='xdvi'
else
  " mac
  "let g:Tex_ViewRule_pdf='open'
  let g:Tex_ViewRule_pdf = 'Skim'
  let g:Tex_ViewRule_ps = 'Preview'
  let g:Tex_ViewRule_dvi = 'texniscope'
endif
 
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'
 
"let g:Tex_IgnoredWarnings ='
"      \"Underfull\n".
"      \"Overfull\n".
"      \"specifier changed to\n".
"      \"You have requested\n".
"      \"Missing number, treated as zero.\n".
"      \"Marginpar on page\n".
"      \"Float too large for page by\n".
"      \"\oval, \circle, or \line size unavailable\n"' 
"      \"There were undefined references\n".
"      \"Citation %.%# undefined\n".
let g:Tex_IgnoredWarnings =
	\'Underfull'."\n".
	\'Overfull'."\n".
	\'specifier changed to'."\n".
	\'You have requested'."\n".
	\'Missing number, treated as zero.'."\n".
	\'size of graphic'."\n".
	\'not found'."\n".
	\'There were undefined references'."\n".
	\'Reference '."\n".
  \'Marginpar on page'."\n".
  \'Float too large for page by'."\n".
  \'\oval, \circle, or \line size unavailable'."\n".
	\'Citation %.%# undefined'

"let g:Tex_IgnoreLevel = 99


let g:tex_flavor = "pdflatex"
let g:Tex_flavor = "pdflatex"
let g:Tex_MultipleCompileFormats='pdf, aux'

if !exists('s:initLatexSuite')
	let s:initLatexSuite = 1
	exec 'so '.fnameescape(expand('<sfile>:p:h').'/latex-suite/main.vim')

	silent! do LatexSuite User LatexSuiteInitPost
endif

silent! do LatexSuite User LatexSuiteFileType

TCLevel 10

"let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
TCTarget pdf

"SpellSetLanguage br
"highlight SpellErrors  guifg=Red
" Infect the current buffer with <buffer>-local imaps for the IMAPs
call IMAP_infect()
