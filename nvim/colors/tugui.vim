" noctu.vim - Vim color scheme for 16-color terminals
" --------------------------------------------------------------
" Author:   Noah Frederick (http://noahfrederick.com/)
" Version:  1.8.0
" --------------------------------------------------------------

" Scheme setup {{{
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "tugui"

"}}}
" Vim UI {{{
hi Normal              guifg=#fae0c0 gui=none
hi Cursor              guifg=#fae0c0     guibg=#cc360e
hi CursorLine          guibg=#090908     gui=NONE
hi MatchParen          guifg=#fae0c0     ctermbg=NONE  gui=underline
hi Pmenu               guifg=#cc360e5    guibg=#000000
hi PmenuThumb          guibg=#fae0c0
hi PmenuSBar           guibg=#595959
hi PmenuSel            guifg=#000000     guibg=#7d4380
hi ColorColumn         guibg=#000000
hi SpellBad            guifg=#cc360e     ctermbg=NONE  gui=underline
hi SpellCap            guifg=#cc360e0    ctermbg=NONE  gui=underline
hi SpellRare           guifg=#cc360e1    ctermbg=NONE  gui=underline
hi SpellLocal          guifg=#cc360e3    ctermbg=NONE  gui=underline
hi NonText             guifg=#595959
hi LineNr              guifg=#595959     ctermbg=NONE
hi CursorLineNr        guifg=#cc360e1    guibg=#000000
hi Visual              guibg=#424140     guifg=#cc360e2
hi IncSearch           guibg=#424140     guifg=#cc360e3    gui=NONE
hi Search              guibg=#424140     guifg=#cc360e0
hi StatusLine          guifg=#fae0c0     guibg=#0f0a00     gui=bold
hi StatusLineNC        guifg=#595959     guibg=#0a0100     gui=NONE
hi VertSplit           guifg=#000000     guibg=#000000     gui=NONE
hi TabLine             guifg=#595959     guibg=#000000     gui=NONE
hi TabLineSel          guifg=#fae0c0     guibg=#000000
hi Folded              guifg=#6a9270     guibg=#000000     gui=bold
hi Conceal             guifg=#6a9270     ctermbg=NONE
hi Directory           guifg=#cc360e2
hi Title               guifg=#c9950e     gui=bold
hi ErrorMsg            guifg=#cc360e5    guibg=#cc360e
hi DiffAdd             guifg=#000000     guibg=#6a9511
hi DiffChange          guifg=#000000     guibg=#c9950e
hi DiffDelete          guifg=#000000     guibg=#cc360e
hi DiffText            guifg=#000000     guibg=#cc360e1    gui=bold
hi User1               guifg=#cc360e     guibg=#000000
hi User2               guifg=#7d4380     guibg=#000000
hi User3               guifg=#6a9511     guibg=#000000
hi User4               guifg=#c9950e     guibg=#000000
hi User5               guifg=#cc336d     guibg=#000000
hi User6               guifg=#6a9270     guibg=#000000
hi User7               guifg=#fae0c0     guibg=#000000
hi User8               guifg=#595959     guibg=#000000
hi User9               guifg=#cc360e5    guibg=#cc336d
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
hi Delimiter       guifg=#fae0c0
hi Comment         guifg=#595959
hi Underlined      guifg=#7d4380   gui=underline
hi Type            guifg=#d03c14
hi String          guifg=#cc360e1
hi Keyword         guifg=#6a9511
hi Todo            guifg=#cc360e5  ctermbg=NONE     gui=bold,underline
hi Function        guifg=#7d4380
hi Identifier      guifg=#fae0c0   gui=NONE
hi Statement       guifg=#6a9511   gui=bold
hi Constant        guifg=#cc360e3
hi Number          guifg=#cc360e2
hi Boolean         guifg=#cc360e
hi Special         guifg=#cc360e3
hi Ignore          guifg=#000000
hi PreProc         guifg=#595959   gui=bold
hi! link Operator  Delimiter
hi! link Error     ErrorMsg

"}}}
" HTML {{{
hi htmlTagName              guifg=#6a9511
hi htmlTag                  guifg=#6a9511
hi htmlArg                  guifg=#cc360e0
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
hi xmlTagName       guifg=#7d4380
hi xmlTag           guifg=#cc360e2
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
hi phpSpecialFunction    guifg=#cc336d
hi phpIdentifier         guifg=#cc360e1
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
hi markdownItalic                   gui=italic

"}}}
" Ruby {{{
hi! link rubyDefine                 Statement
hi! link rubyLocalVariableOrMethod  Identifier
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Number
hi! link rubyStringDelimiter        rubyString

"}}}
" Git {{{
hi gitCommitBranch               guifg=#c9950e
hi gitCommitSelectedType         guifg=#cc360e0
hi gitCommitSelectedFile         guifg=#6a9511
hi gitCommitUnmergedType         guifg=#d03c14
hi gitCommitUnmergedFile         guifg=#cc360e
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
hi lessVariable             guifg=#cc360e1
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
hi mustacheSection           guifg=#cc360e4  gui=bold
hi mustacheMarker            guifg=#6a9270
hi mustacheVariable          guifg=#cc360e4
hi mustacheVariableUnescape  guifg=#d03c14
hi mustachePartial           guifg=#cc360e3

"}}}
" Shell {{{
hi shDerefSimple     guifg=#cc360e1
hi! link shDerefVar  shDerefSimple

"}}}
" Syntastic {{{
hi SyntasticWarningSign       guifg=#c9950e  ctermbg=NONE
hi SyntasticErrorSign         guifg=#cc360e  ctermbg=NONE
hi SyntasticStyleWarningSign  guifg=#6a9511  ctermbg=NONE
hi SyntasticStyleErrorSign    guifg=#7d4380  ctermbg=NONE

"}}}
" Netrw {{{
hi netrwExe       guifg=#d03c14
hi netrwClassify  guifg=#595959  gui=bold

"}}}
" Ledger {{{
hi ledgerAccount  guifg=#cc360e1
hi! link ledgerMetadata  Comment
hi! link ledgerTransactionStatus  Statement

"}}}
" Diff {{{
hi diffAdded  guifg=#6a9511
hi diffRemoved  guifg=#cc360e
hi! link diffFile  PreProc
hi! link diffLine  Title

"}}}
" Plug {{{
hi plugSha  guifg=#c9950e

"}}}
" Blade {{{
hi! link bladeStructure  PreProc
hi! link bladeParen      phpParent
hi! link bladeEchoDelim  PreProc

"}}}

hi rustModPath            guifg=#7d4380
hi Macro                  guifg=#6a9511
hi plaintexControlSequence guifg=#cc360e3
hi initexJobCommand guifg=#cc360e3
hi CocHintSign guifg=#595959
hi CocHighlightText guibg=#151210

" vim: fdm=marker:sw=2:sts=2:et
