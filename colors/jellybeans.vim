" Vim color file
"
"  "    __       _ _       _                             "
"  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
"  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
"  "  /\_/ /  __/ | | |_| | |_| |  __/ |_| | | | \__ \   "
"  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
"  "                 \___/                               "
"
"         "A colorful, dark color scheme for Vim."
"
" File:         jellybeans.vim
" URL:          github.com/nanotech/jellybeans.vim
" Scripts URL:  vim.org/scripts/script.php?script_id=2555
" Maintainer:   NanoTech (nanotech.nanotechcorp.net)
" Version:      2.0
" Last Change:  2022-04-26
" License:      MIT
" Contributors: Andrew Wong (w0ng)
"               Benjamin R. Haskell (benizi)
"               Brian Marshall (bmars)
"               Daniel Herbert (pocketninja)
"               David Liang <bmdavll at gmail dot com>
"               Filipe Silva (ninrod)
"               Henry So, Jr. <henryso@panix.com>
"               Ihor Kalnytskyi (ikalnytskyi)
"               Joe Doherty (docapotamus)
"               Karl Litterfeldt (Litterfeldt)
"               Keith Pitt (keithpitt)
"               Mike Schreifels (schreifels)
"               Philipp Rustemeier (12foo)
"               Rafael Bicalho (rbika)
"               Rich Healey (richo)
"               Siwen Yu (yusiwen)
"               Tim Willis (willist)
"               Tom McLaughlin (tmcoma)
"               Felipe Lema
"
" Copyright (c) 2009-2021 NanoTech
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation  files  (the “Software”), to deal in the Soft‐
" ware without restriction,  including  without  limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software,  and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice  and  this  permission  notice
" shall  be  included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND,  EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR  PURPOSE  AND  NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE  LIABLE  FOR  ANY  CLAIM,
" DAMAGES  OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

" Note: this ↓ is real good for playing with colors for this theme
" https://color.adobe.com/es/create/color-wheel

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jellybeans"


hi Normal  guifg=#e8e8d3 guibg=#000000
set background=dark

hi CursorLine guibg=#1c1c1c
hi CursorColumn guibg=#1c1c1c

hi MatchParen guifg=#ffffff guibg=#556779 gui=bold

hi TabLine guifg=#9098a0 guibg=#1c1c1c
hi TabLineFill guifg=#9098a0
hi TabLineSel  guifg=#ffffff guibg=#777777

" Auto-completion
hi  Pmenu guifg=#e8e8d3 guibg=#0C0038
hi PmenuSel guifg=#101010 guibg=#eeeeee

hi Visual guibg=#404040
hi Cursor guifg=#000000  guibg=#b0d0f0

hi LineNr guifg=#605958 guibg=#000000
hi CursorLineNr guifg=#ccc5c4 gui=NONE
hi Comment        gui=italic guifg=#888888
hi SpecialComment gui=italic guifg=#c6b6fe
hi Todo guifg=#c7c7c7 guibg=#000000 gui=bold

hi StatusLine guifg=#000000 guibg=#dddddd gui=italic
hi StatusLineNC guifg=#ffffff guibg=#403c41 gui=italic
hi VertSplit guifg=#777777 guibg=#403c41
hi WildMenu guifg=#f0a0c0 guibg=#302028

hi Folded guifg=#a0a8b0 guibg=#384048 gui=italic
hi FoldColumn guifg=#535D66 guibg=#1f1f1f
hi SignColumn guifg=#777777 guibg=#333333
hi ColorColumn guibg=#000000

hi Title guifg=#70b950 gui=bold

hi Constant guifg=#cf6a4c
hi Special guifg=#799d6a
hi Delimiter guifg=#668799

hi String guifg=#99ad6a
hi StringDelimiter guifg=#556633

hi Identifier guifg=#c6b6ee
hi Structure  guifg=#8fbfdc
hi Function   guifg=#fad07a
hi Statement  guifg=#8197bf
hi PreProc    guifg=#8fbfdc

hi! link Operator Structure
hi! link Conceal Operator

hi! Type guifg=#ffb964
hi NonText guifg=#606060 guibg=#000000

hi! SpecialKey guifg=#444444 guibg=#1c1c1c

hi Search guifg=#f0a0c0 guibg=#302028 gui=underline

hi Directory guifg=#dad085
hi ErrorMsg guibg=#902020
hi! link Error ErrorMsg
hi! link MoreMsg Special
hi Question guifg=#65C254


" Spell Checking

hi SpellBad guifg=#902020 gui=undercurl
hi SpellCap guifg=#808080 gui=undercurl
hi SpellRare guifg=#540063 gui=undercurl
hi SpellLocal guifg=#2D7067 gui=undercurl

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff

hi! DiffAdd guifg=#D2EBBE guibg=#437019
hi! DiffDelete guifg=#40000A guibg=#700009
hi! DiffChange guibg=#2B5B77
hi! DiffText guifg=#8fbfdc guibg=#000000

" floating windows (neovim)
hi NormalFloat guifg=#e8e8d3 guibg=#090515

" PHP

hi! link phpFunctions Function
hi! StorageClass guifg=#c59f6f
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

hi! link rubySharpBang Comment
hi! rubyClass guifg=#447799
hi! rubyIdentifier guifg=#c6b6fe
hi! link rubyConstant Type
hi! link rubyFunction Function

hi! rubyInstanceVariable guifg=#c6b6fe
hi! rubySymbol guifg=#7697d6
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
hi! rubyControl guifg=#7597c6

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

hi! rubyRegexpDelimiter guifg=#540063
hi! rubyRegexp guifg=#dd0093
hi! rubyRegexpSpecial guifg=#a40073

hi! rubyPredefinedIdentifier guifg=#de5577

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" Elixir

hi! link elixirAtom rubySymbol


" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp
hi! link javaScriptTemplateVar StringDelim
hi! link javaScriptTemplateDelim Identifier
hi! link javaScriptTemplateString String

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" HTML

hi! link htmlTag Statement
hi! link htmlEndTag htmlTag
hi! link htmlTagName htmlTag

" XML

hi! link xmlTag Statement
hi! link xmlEndTag xmlTag
hi! link xmlTagName xmlTag
hi! link xmlEqual xmlTag
hi! link xmlEntity Special
hi! link xmlEntityPunct xmlEntity
hi! link xmlDocTypeDecl PreProc
hi! link xmlDocTypeKeyword PreProc
hi! link xmlProcessingDelim xmlAttrib

" Debugger.vim

hi! DbgCurrent guifg=#DEEBFE guibg=#345FA8
hi! DbgBreakPt guibg=#4F0037

" vim-indent-guides

hi IndentGuidesOdd guibg=#232323
hi IndentGuidesEven guibg=#1b1b1b

" LSP
hi LspReferenceText  gui=underline guisp=#DEEBFE
hi LspReferenceRead  guibg=#405026
hi LspReferenceWrite guibg=#384048

" LSP, diagnostics (same colors as spell checking)
hi! link DiagnosticError SpellBad
hi! link DiagnosticHint  SpellCap
hi! link DiagnosticWarn  SpellRare
hi! link DiagnosticInfo  SpellLocal

hi DiagnosticUnderlineError gui=undercurl guisp=#f37970
hi DiagnosticUnderlineHint  gui=undercurl guisp=#808080
hi DiagnosticUnderlineWarn  gui=undercurl guisp=#540063
hi DiagnosticUnderlineInfo  gui=undercurl guisp=Green

hi DiagnosticVirtualTextError gui=italic guifg=#f37970
hi DiagnosticVirtualTextHint  gui=italic guifg=#808080
hi DiagnosticVirtualTextWarn  gui=italic guifg=#a40073
hi DiagnosticVirtualTextInfo  gui=italic guifg=Green

hi DiagnosticSignError guifg=#f37970
hi DiagnosticSignWarn  guifg=#808080
hi DiagnosticSignInfo  guifg=#a40073
hi DiagnosticSignHint  guifg=Green

" Vimwiki
hi VimwikiDelText gui=strikethrough

" indent-blankline.nvim
highlight! IndentBlanklineChar guifg=#101010 gui=nocombine

" nvim-tabline
" MatchParen.bg, bg = TabLineSel.bg
hi! TabLineSeparatorActive guifg=#556779 guibg=#f0f0f0

" Telescope
" based on «Search»
hi! TelescopeMatching guifg=#799d6a guibg=#203028 gui=underline

" vim-matchup
" I'd wish that using italic was enough, but I can barely notice
hi! MatchWord guisp=#99ad6a cterm=underline gui=underline

" Neomake
hi NeomakeVirtualtextError guifg=#902020 gui=italic
" Plugins, etc.

hi! link TagListFileName Directory
hi PreciseJumpTarget guifg=#B9ED67 guibg=#405026

"" LSP Semantic Highlight ()
"" https://github.com/theHamsta/nvim-semantic-tokens
"" https://github.com/neovim/neovim/pull/15723

"  LspNamespace
hi! link LspType Type
hi! link LspStatic StorageClass
hi! link LspOperator pythonOperator
hi! link LspRegexp rubyRegexp
hi! LspDefaultLibrary guifg=#c6b6fe gui=nocombine "rubyGlobalVariable-ish
hi! link LspTypeParameter javaScriptTemplateVar
hi! link LspAsync Special
hi! link LspParameter Identifier
hi! LspVariable gui=italic
hi! link LspMacro javaScriptTemplateVar


"" ↓ looks ok, but seems like everything else is a LspProperty in sumneko lua
"hi! LspProperty guifg=#ADCCB9


" ↓ I guess
hi! link LspStruct rubyClass
hi! link LspString String
hi! link LspComment Comment

" ↓ trying out
hi! link LspInterface PreProc
hi! link LspEvent SpecialKey
hi! link LspEnumMember Directory

"  LspMethod
"  LspModifier
"  LspNumber
"  LspDeclaration
"  LspDefinition
"  LspDeprecated
"  LspAbstract
"  LspModification
"  LspDocumentation

" ↓ based on https://github.com/DasFranck/VSC-Jellybeans
hi! LspKeyword guifg=#8197BF " different from rubyClass
hi! LspClass guifg=#cc9d3b
hi! LspEnum guifg=#a384a8
hi! LspReadonly guifg=#a384a8 " class.builtin
hi! LspDefaultLibrary guifg=#cc9d3b
hi! LspFunction guifg=#fad07a gui=italic

