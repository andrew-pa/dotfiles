" tugui.vim - Vim color scheme for Unipalette
" generated from noctu.vim

" Scheme setup {{{
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "tugui"

"}}}
" Vim UI {{{
hi Normal              guifg=#fff8d8
hi Cursor              guifg=#ffffe6     guibg=#cc3307
hi CursorLine          guibg=#111111     gui=NONE
hi MatchParen          guifg=#fff8d8 guibg=#875015
hi Pmenu               guifg=#fff8d8    guibg=#000000
hi PmenuThumb          guibg=#fff8d8
hi PmenuSBar           guibg=#595959
hi PmenuSel            guifg=#000000     guibg=#a45b00
hi ColorColumn         guibg=#000000
hi SpellBad            guifg=#cc3307     ctermbg=NONE  gui=underline
hi SpellCap            guifg=#85b12d    ctermbg=NONE  gui=underline
hi SpellRare           guifg=#ffcb48    ctermbg=NONE  gui=underline
hi SpellLocal          guifg=#ed4d85    ctermbg=NONE  gui=underline
hi NonText             guifg=#595959
hi LineNr              guifg=#595959     ctermbg=NONE
hi CursorLineNr        guifg=#eb8811    guibg=#000000
hi Visual              guibg=#1f1f1f
hi IncSearch           guifg=#000000     guibg=#ffa22b    gui=NONE
hi Search              guifg=#fff8d8     guibg=#373432
hi StatusLine          guifg=#ffeac7     guibg=#200800     gui=bold
hi StatusLineNC        guifg=#68625d     guibg=#0b0b0b     gui=NONE
hi VertSplit           guifg=#000000     guibg=#000000     gui=NONE
hi TabLine             guifg=#595959     guibg=#000000     gui=NONE
hi TabLineSel          guifg=#fff8d8     guibg=#000000
hi Folded              guifg=#6d926d     guibg=#000000     gui=bold
hi Conceal             guifg=#6d926d     ctermbg=NONE
hi Directory           guifg=#964699
hi Title               guifg=#e8b032     gui=bold
hi ErrorMsg            guifg=#fffff3    guibg=#cc3307
hi DiffAdd             guifg=#000000     guibg=#6b9614
hi DiffChange          guifg=#000000     guibg=#e8b032
hi DiffDelete          guifg=#000000     guibg=#cc3307
hi DiffText            guifg=#000000     guibg=#ffcb48    gui=bold
hi User1               guifg=#cc3307     guibg=#000000
hi User2               guifg=#792e7d     guibg=#000000
hi User3               guifg=#6b9614     guibg=#000000
hi User4               guifg=#e8b032     guibg=#000000
hi User5               guifg=#cb326c     guibg=#000000
hi User6               guifg=#6d926d     guibg=#000000
hi User7               guifg=#fff8d8     guibg=#000000
hi User8               guifg=#595959     guibg=#000000
hi User9               guifg=#fffff3    guibg=#cb326c
hi! link CursorColumn  CursorLine
hi! link SignColumn    LineNr
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText

"}}}
" Generic syntax {{{
hi Delimiter       guifg=#fff8d8
hi Comment         guifg=#595959
hi Underlined      gui=underline
hi Type            guifg=#f04d1f
hi String          guifg=#ffcb48
hi Keyword         guifg=#6b9614
hi Todo            guifg=#fffff3 guibg=#111111  ctermbg=NONE     gui=bold,underline
hi Function        guifg=#a62c79
hi Identifier      guifg=#ffbfd8   gui=none
hi Statement       guifg=#6b9614   gui=bold
hi Constant        guifg=#ed4d85
hi Number          guifg=#fb8a13
hi Boolean         guifg=#cc3307
hi Special         guifg=#ed4d85
hi Ignore          guifg=#000000
hi PreProc         guifg=#595959   gui=bold
hi! link Operator  Delimiter
hi! link Error     ErrorMsg

"}}}
" HTML {{{
hi htmlTagName              guifg=#6b9614
hi htmlTag                  guifg=#6b9614
hi htmlArg                  guifg=#85b12d
hi htmlH1                   gui=bold
hi htmlBold                 gui=bold
hi htmlItalic               gui=underline
hi htmlUnderline            gui=underline
hi htmlBoldItalic           gui=bold,underline
hi htmlBoldUnderline        gui=bold,underline
hi htmlUnderlineItalic      gui=underline
hi htmlBoldUnderlineItalic  gui=bold,underline
hi! link htmlLink           Underlined
hi! link htmlEndTag         htmlTag

"}}}
" XML {{{
hi xmlTagName       guifg=#792e7d
hi xmlTag           guifg=#964699
hi! link xmlString  xmlTagName
hi! link xmlAttrib  xmlTag
hi! link xmlEndTag  xmlTag
hi! link xmlEqual   xmlTag

"}}}
" JavaScript {{{
hi! link javaScript        Normal
hi! link javaScriptBraces  Delimiter

"}}}
" PHP {{{
hi phpSpecialFunction    guifg=#cb326c
hi phpIdentifier         guifg=#ffcb48
hi phpParent             guifg=#595959
hi! link phpVarSelector  phpIdentifier
hi! link phpHereDoc      String
hi! link phpDefine       Statement

"}}}
" Markdown {{{
hi! link markdownHeadingRule        NonText
hi! link markdownHeadingDelimiter   markdownHeadingRule
hi! link markdownLinkDelimiter      Delimiter
hi! link markdownURLDelimiter       Delimiter
hi! link markdownCodeDelimiter      NonText
hi! link markdownLinkTextDelimiter  markdownLinkDelimiter
hi! link markdownUrl                markdownLinkText
hi! link markdownAutomaticLink      markdownLinkText
hi! link markdownCodeBlock          String
hi markdownCode                     gui=bold
hi markdownBold                     gui=bold
hi markdownItalic                   gui=underline

"}}}
" Ruby {{{
hi! link rubyDefine                 Statement
hi! link rubyLocalVariableOrMethod  Identifier
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Number
hi! link rubyStringDelimiter        rubyString

"}}}
" Git {{{
hi gitCommitBranch               guifg=#e8b032
hi gitCommitSelectedType         guifg=#85b12d
hi gitCommitSelectedFile         guifg=#6b9614
hi gitCommitUnmergedType         guifg=#f04d1f
hi gitCommitUnmergedFile         guifg=#cc3307
hi! link gitCommitFile           Directory
hi! link gitCommitUntrackedFile  gitCommitUnmergedFile
hi! link gitCommitDiscardedType  gitCommitUnmergedType
hi! link gitCommitDiscardedFile  gitCommitUnmergedFile

"}}}
" Vim {{{
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant

"}}}
" LESS {{{
hi lessVariable             guifg=#ffcb48
hi! link lessVariableValue  Normal

"}}}
" NERDTree {{{
hi! link NERDTreeHelp      Comment
hi! link NERDTreeExecFile  String

"}}}
" Vimwiki {{{
hi! link VimwikiHeaderChar  markdownHeadingDelimiter
hi! link VimwikiList        markdownListMarker
hi! link VimwikiCode        markdownCode
hi! link VimwikiCodeChar    markdownCodeDelimiter

"}}}
" Help {{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

"}}}
" CtrlP {{{
hi! link CtrlPMatch    String
hi! link CtrlPLinePre  Comment

"}}}
" Mustache {{{
hi mustacheSection           guifg=#85ad85  gui=bold
hi mustacheMarker            guifg=#6d926d
hi mustacheVariable          guifg=#85ad85
hi mustacheVariableUnescape  guifg=#f04d1f
hi mustachePartial           guifg=#ed4d85

"}}}
" Shell {{{
hi shDerefSimple     guifg=#ffcb48
hi! link shDerefVar  shDerefSimple

"}}}
" Syntastic {{{
hi SyntasticWarningSign       guifg=#e8b032  ctermbg=NONE
hi SyntasticErrorSign         guifg=#cc3307  ctermbg=NONE
hi SyntasticStyleWarningSign  guifg=#6b9614  ctermbg=NONE
hi SyntasticStyleErrorSign    guifg=#792e7d  ctermbg=NONE

"}}}
" Netrw {{{
hi netrwExe       guifg=#f04d1f
hi netrwClassify  guifg=#595959  gui=bold

"}}}
" Ledger {{{
hi ledgerAccount  guifg=#ffcb48
hi! link ledgerMetadata  Comment
hi! link ledgerTransactionStatus  Statement

"}}}
" Diff {{{
hi diffAdded  guifg=#6b9614
hi diffRemoved  guifg=#cc3307
hi! link diffFile  PreProc
hi! link diffLine  Title

"}}}
" Plug {{{
hi plugSha  guifg=#e8b032

"}}}
" Blade {{{
hi! link bladeStructure  PreProc
hi! link bladeParen      phpParent
hi! link bladeEchoDelim  PreProc

"}}}

hi rustModPath            guifg=#792e7d
hi Macro                  guifg=#6b9614
hi plaintexControlSequence guifg=#ed4d85
hi initexJobCommand guifg=#ed4d85
hi TreesitterContext guibg=#1b1b1b gui=italic

" vim: fdm=marker:sw=2:sts=2:et
