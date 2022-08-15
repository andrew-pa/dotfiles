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
hi Normal              guifg=#ffeede guibg=#000000
hi Cursor              guifg=#ffefdf     guibg=#e52c00
hi CursorLine          guibg=#302315     gui=NONE
hi MatchParen          guifg=#f9f9f9 guibg=#a56400
hi Pmenu               guifg=#ffeede    guibg=#000000
hi PmenuThumb          guibg=#f9f9f9
hi PmenuSBar           guibg=#595959
hi PmenuSel            guifg=#000000     guibg=#e28700
hi ColorColumn         guibg=#000000
hi SpellBad            guifg=#e52c00     ctermbg=NONE  gui=underline
hi SpellCap            guifg=#6cd200    ctermbg=NONE  gui=underline
hi SpellRare           guifg=#ffa400    ctermbg=NONE  gui=underline
hi SpellLocal          guifg=#c906b7    ctermbg=NONE  gui=underline
hi NonText             guifg=#595959
hi LineNr              guifg=#595959     ctermbg=NONE
hi CursorLineNr        guifg=#ffac00    guibg=#000000
hi Visual              guibg=#302315
hi IncSearch           guifg=#000000     guibg=#ffb100    gui=NONE
hi Search              guifg=#f9f9f9     guibg=#373432
hi StatusLine          guifg=#ffe3ec     guibg=#280d00     gui=bold
hi StatusLineNC        guifg=#68625d     guibg=#1b0700     gui=NONE
hi VertSplit           guifg=#000000     guibg=#584530     gui=NONE
hi TabLine             guifg=#595959     guibg=#000000     gui=NONE
hi TabLineSel          guifg=#f9f9f9     guibg=#000000
hi Folded              guifg=#00e2ca     guibg=#000000     gui=bold
hi Conceal             guifg=#00e2ca     ctermbg=NONE
hi Directory           guifg=#0081fd
hi Title               guifg=#ff9d00     gui=bold
hi ErrorMsg            guifg=#fff7fa    guibg=#e52c00
hi DiffAdd             guifg=#000000     guibg=#66cb00
hi DiffChange          guifg=#000000     guibg=#ff9d00
hi DiffDelete          guifg=#000000     guibg=#e52c00
hi DiffText            guifg=#000000     guibg=#ffa400    gui=bold
hi DiagnosticHint      guifg=#53ba00
hi DiagnosticInfo      guifg=#ffefe0
hi User1               guifg=#e52c00     guibg=#000000
hi User2               guifg=#0074ea     guibg=#000000
hi User3               guifg=#66cb00     guibg=#000000
hi User4               guifg=#ff9d00     guibg=#000000
hi User5               guifg=#b600a6     guibg=#000000
hi User6               guifg=#00e2ca     guibg=#000000
hi User7               guifg=#f9f9f9     guibg=#000000
hi User8               guifg=#595959     guibg=#000000
hi User9               guifg=#fff7fa    guibg=#b600a6
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
hi Delimiter       guifg=#f9f1e9
hi Comment         guifg=#e3d3c4
hi Underlined      gui=underline
hi Type            guifg=#e52c00
hi String          guifg=#ff9d00
hi Keyword         guifg=#66cb00
hi Todo            guifg=#fff7fa guibg=#111111  ctermbg=NONE     gui=bold,underline
hi Function        guifg=#794fd5
hi Identifier      guifg=#b600a6   gui=none
hi Statement       guifg=#66cb00   gui=bold
hi Constant        guifg=#c906b7
hi Number          guifg=#ff6f00
hi Boolean         guifg=#e52c00
hi Special         guifg=#c906b7
hi Ignore          guifg=#000000
hi PreProc         guifg=#595959   gui=bold
hi! link Operator  Delimiter
hi! link Error     ErrorMsg

"}}}
" HTML {{{
hi htmlTagName              guifg=#66cb00
hi htmlTag                  guifg=#66cb00
hi htmlArg                  guifg=#6cd200
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
hi xmlTagName       guifg=#0074ea
hi xmlTag           guifg=#0081fd
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
hi phpSpecialFunction    guifg=#b600a6
hi phpIdentifier         guifg=#ffa400
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
hi gitCommitBranch               guifg=#ff9d00
hi gitCommitSelectedType         guifg=#6cd200
hi gitCommitSelectedFile         guifg=#66cb00
hi gitCommitUnmergedType         guifg=#f73c00
hi gitCommitUnmergedFile         guifg=#e52c00
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
hi lessVariable             guifg=#ffa400
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
hi mustacheSection           guifg=#00e9d1  gui=bold
hi mustacheMarker            guifg=#00e2ca
hi mustacheVariable          guifg=#00e9d1
hi mustacheVariableUnescape  guifg=#f73c00
hi mustachePartial           guifg=#c906b7

"}}}
" Shell {{{
hi shDerefSimple     guifg=#ffa400
hi! link shDerefVar  shDerefSimple

"}}}
" Syntastic {{{
hi SyntasticWarningSign       guifg=#ff9d00  ctermbg=NONE
hi SyntasticErrorSign         guifg=#e52c00  ctermbg=NONE
hi SyntasticStyleWarningSign  guifg=#66cb00  ctermbg=NONE
hi SyntasticStyleErrorSign    guifg=#0074ea  ctermbg=NONE

"}}}
" Netrw {{{
hi netrwExe       guifg=#f73c00
hi netrwClassify  guifg=#595959  gui=bold

"}}}
" Ledger {{{
hi ledgerAccount  guifg=#ffa400
hi! link ledgerMetadata  Comment
hi! link ledgerTransactionStatus  Statement

"}}}
" Diff {{{
hi diffAdded  guifg=#66cb00
hi diffRemoved  guifg=#e52c00
hi! link diffFile  PreProc
hi! link diffLine  Title

"}}}
" Plug {{{
hi plugSha  guifg=#ff9d00

"}}}
" Blade {{{
hi! link bladeStructure  PreProc
hi! link bladeParen      phpParent
hi! link bladeEchoDelim  PreProc

"}}}

hi rustModPath            guifg=#0074ea
hi Macro                  guifg=#66cb00
hi plaintexControlSequence guifg=#c906b7
hi initexJobCommand guifg=#c906b7
hi TreesitterContext guibg=#1b1b1b gui=italic

" vim: fdm=marker:sw=2:sts=2:et
