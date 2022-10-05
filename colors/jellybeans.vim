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

" Configuration Variables:
" - g:jellybeans_overrides          (default = {})
" - g:jellybeans_use_lowcolor_black (default = 0)

let s:background_color = "#000000"
let s:foreground_color = "#e8e8d3"

if exists("g:jellybeans_overrides")
  let s:overrides = g:jellybeans_overrides
else
  let s:overrides = {}
endif

" Backwards compatibility
if exists("g:jellybeans_background_color")
  \ || exists("g:jellybeans_background_color_256")
  \ || exists("g:jellybeans_use_term_background_color")

  let s:overrides = deepcopy(s:overrides)

  if !has_key(s:overrides, "background")
    let s:overrides["background"] = {}
  endif

  if exists("g:jellybeans_background_color")
    let s:overrides["background"]["guibg"] = g:jellybeans_background_color
  endif

  if exists("g:jellybeans_background_color_256")
    let s:overrides["background"]["256ctermbg"] = g:jellybeans_background_color_256
  endif

  if exists("g:jellybeans_use_term_background_color")
    \ && g:jellybeans_use_term_background_color
    let s:overrides["background"]["ctermbg"] = "NONE"
    let s:overrides["background"]["256ctermbg"] = "NONE"
  endif
endif

let s:termBlack = "Black"

" When `termguicolors` is set, Vim[^1] ignores `hi Normal guibg=NONE`
" after Normal's `guibg` is already set to a color. See:
"
" - https://github.com/vim/vim/issues/981
" - https://github.com/nanotech/jellybeans.vim/issues/64
"
" To work around this, ensure we don't set the default background
" color before an override changes it to `NONE` by ensuring that the
" background color isn't set to a value different from its override.
"
" [^1]: Tested on 8.0.567. Does not apply to Neovim.
"
if has_key(s:overrides, "background") && has_key(s:overrides["background"], "guibg")
    let s:background_color = s:overrides["background"]["guibg"]
endif

" Color approximation functions by Henry So, Jr. and David Liang {{{
" Added to jellybeans.vim by Daniel Herbert


" returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if a:x < 14
    return 0
  else
    let l:n = (a:x - 8) / 10
    let l:m = (a:x - 8) % 10
    if l:m < 5
      return l:n
    else
      return l:n + 1
    endif
  endif
endfun

" returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if a:n == 0
    return 0
  else
    return 8 + (a:n * 10)
  endif
endfun

" returns the palette index for the given grey index
fun! s:grey_color(n)
  if a:n == 0
    return 16
  elseif a:n == 25
    return 231
  else
    return 231 + a:n
  endif
endfun

" returns an approximate color index for the given color level
fun! s:rgb_number(x)
  if a:x < 75
    return 0
  else
    let l:n = (a:x - 55) / 40
    let l:m = (a:x - 55) % 40
    if l:m < 20
      return l:n
    else
      return l:n + 1
    endif
  endif
endfun

" returns the actual color level for the given color index
fun! s:rgb_level(n)
  if a:n == 0
    return 0
  else
    return 55 + (a:n * 40)
  endif
endfun

" returns the palette index for the given R/G/B color indices
fun! s:rgb_color(x, y, z)
  return 16 + (a:x * 36) + (a:y * 6) + a:z
endfun


" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " map greys directly (see xterm's 256colres.pl)
  if &t_Co == 256 && a:r == a:g && a:g == a:b && a:r > 3 && a:r < 243
    return (a:r - 8) / 10 + 232
  endif

  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

fun! s:is_empty_or_none(str)
  return empty(a:str) || a:str ==? "NONE"
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  if s:is_empty_or_none(a:rgb)
    return "NONE"
  endif
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
  return s:color(l:r, l:g, l:b)
endfun

fun! s:prefix_highlight_value_with(prefix, color)
  if s:is_empty_or_none(a:color)
    return "NONE"
  else
    "   return a:longer[0:len(a:shorter)-1] ==# a:shorter
    if a:color[0:len(a:prefix)-1] ==# a:prefix
      return a:color
    else
      return a:prefix . a:color
    endif
  endif
endfun


" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  let l:cmd = "hi ".a:group.
        \ " guifg=".s:prefix_highlight_value_with("#", a:fg).
        \ " guibg=".s:prefix_highlight_value_with("#", a:bg)
  let l:cmd = l:cmd.
        \ " ctermfg=".s:rgb(a:fg).
        \ " ctermbg=".s:rgb(a:bg)

  let l:attr = s:prefix_highlight_value_with("", a:attr)

  let l:cterm_attr = l:attr
  let l:gui_attr = l:attr

  let l:cmd = l:cmd." gui=".l:gui_attr." cterm=".l:cterm_attr
  exec l:cmd
endfun
" }}}

exec 'hi Normal  guifg=' . s:foreground_color . ' guibg=' . s:background_color
set background=dark

call s:X("CursorLine"  ,"","#1c1c1c","","",s:termBlack)
call s:X("CursorColumn","","#1c1c1c","","",s:termBlack)

let s:matchParenGuiFg = "#ffffff"
let s:matchParenGuiBg = "#556779"

if s:termBlack != "Black"
  let s:matchParenTermFg = "Magenta"
  let s:matchParenTermBg = ""
else
  let s:matchParenTermFg = ""
  let s:matchParenTermBg = s:termBlack
endif
call s:X("MatchParen",s:matchParenGuiFg,s:matchParenGuiBg,"bold",
      \                     s:matchParenTermFg,s:matchParenTermBg)

call s:X("TabLine"    ,"#9098a0","#1c1c1c","",""   ,s:termBlack)
call s:X("TabLineFill","#9098a0",""       ,""      ,""   ,s:termBlack)
call s:X("TabLineSel" ,"#ffffff","#777777","italic",s:termBlack,"White")

" Auto-completion
exec 'hi  Pmenu guifg=' . s:foreground_color . ' guibg=#0C0038'
call s:X("PmenuSel","#101010","#eeeeee","",s:termBlack,"White")

call s:X("Visual","","#404040","","",s:termBlack)
call s:X("Cursor",s:background_color,"#b0d0f0","","","")

call s:X("LineNr","#605958",s:background_color,"NONE",s:termBlack,"")
call s:X("CursorLineNr","#ccc5c4","","NONE","White","")
hi Comment        gui=italic guifg=#888888
hi SpecialComment gui=italic guifg=#c6b6fe
call s:X("Todo","#c7c7c7","","bold","White",s:termBlack)

call s:X("StatusLine","#000000","#dddddd","italic","","White")
call s:X("StatusLineNC","#ffffff","#403c41","italic","White","Black")
call s:X("VertSplit","#777777","#403c41","",s:termBlack,s:termBlack)
call s:X("WildMenu","#f0a0c0","#302028","","Magenta","")

call s:X("Folded","#a0a8b0","#384048","italic",s:termBlack,"")
call s:X("FoldColumn","#535D66","#1f1f1f","","",s:termBlack)
hi SignColumn guifg=#777777 guibg=#333333
call s:X("ColorColumn","","#000000","","",s:termBlack)

call s:X("Title","#70b950","","bold","Green","")

call s:X("Constant","#cf6a4c","","","Red","")
call s:X("Special","#799d6a","","","Green","")
call s:X("Delimiter","#668799","","","Grey","")

call s:X("String","#99ad6a","","","Green","")
call s:X("StringDelimiter","#556633","","","DarkGreen","")

hi Identifier guifg=#c6b6ee
hi Structure  guifg=#8fbfdc
hi Function   guifg=#fad07a
hi Statement  guifg=#8197bf
hi PreProc    guifg=#8fbfdc

hi! link Operator Structure
hi! link Conceal Operator

hi! Type guifg=#ffb964
exec 'hi NonText guifg=#606060 guibg=' . s:background_color

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
exec 'hi NormalFloat guifg=' . s:foreground_color . ' guibg=#090515'

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

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","#232323","","","")
call s:X("IndentGuidesEven","","#1b1b1b","","","")

" LSP
hi LspReferenceText  gui=underline guisp=#DEEBFE
hi LspReferenceRead  guibg=#405026
hi LspReferenceWrite guibg=#384048

" LSP, diagnostics (same colors as spell checking)
hi! link SpellBad   DiagnosticError
hi! link SpellCap   DiagnosticHint
hi! link SpellRare  DiagnosticWarn
hi! link SpellLocal DiagnosticInfo

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
call s:X("PreciseJumpTarget","#B9ED67","#405026","","White","Green")

"" LSP Semantic Highlight ()
"" https://github.com/theHamsta/nvim-semantic-tokens
"" https://github.com/neovim/neovim/pull/15723

"  LspNamespace
hi! link LspType Type
hi! link LspStatic StorageClass
hi! link LspOperator pythonOperator
hi! link LspRegexp rubyRegexp
hi! link LspDefaultLibrary rubyGlobalVariable
hi! link LspStruct rubyClass
hi! link LspTypeParameter javaScriptTemplateVar
hi! link LspAsync Special
hi! link LspProperty rubySymbol
hi! link LspVariable rubySymbol
hi! link LspMacro javaScriptTemplateVar
"  LspInterface
"  LspEnumMember
"  LspEvent
"  LspMethod
"  LspModifier
"  LspComment
"  LspString
"  LspNumber
"  LspDeclaration
"  LspDefinition
"  LspDeprecated
"  LspAbstract
"  LspModification
"  LspDocumentation

" ↓ taken from https://github.com/DasFranck/VSC-Jellybeans
hi! LspKeyword guifg=#8197BF
hi! LspClass guifg=#cc9d3b " different from rubyClass
hi! LspEnum guifg=#a384a8
hi! LspReadonly guifg=#a384a8
hi! LspDefaultLibrary guifg=#cc9d3b "class.builtin
hi! LspParameter guifg=#ffb964
hi! LspFunction guifg=#fad07a

if !empty("s:overrides")
  fun! s:current_attr(group)
    let l:synid = synIDtrans(hlID(a:group))
    let l:attrs = []
    for l:attr in ["bold", "italic", "reverse", "standout", "underline", "undercurl"]
      if synIDattr(l:synid, l:attr, "gui") == 1
        call add(l:attrs, l:attr)
      endif
    endfor
    return join(l:attrs, ",")
  endfun
  fun! s:current_color(group, what, mode)
    let l:color = synIDattr(synIDtrans(hlID(a:group)), a:what, a:mode)
    if l:color == -1
      return ""
    else
      return substitute(l:color, "^#", "", "")
    endif
  endfun
  fun! s:load_color_def(group, def)
    call s:X(a:group, get(a:def, "guifg", s:current_color(a:group, "fg", "gui")),
          \                 get(a:def, "guibg", s:current_color(a:group, "bg", "gui")),
          \                 get(a:def, "attr", s:current_attr(a:group)),
          \                 get(a:def, "ctermfg", s:current_color(a:group, "fg", "cterm")),
          \                 get(a:def, "ctermbg", s:current_color(a:group, "bg", "cterm")))
    for l:prop in ["ctermfg", "ctermbg"]
      let l:override_key = "256".l:prop
      if has_key(a:def, l:override_key)
        exec "hi ".a:group." ".l:prop."=".a:def[l:override_key]
      endif
    endfor
  endfun
  fun! s:load_colors(defs)
    for [l:group, l:def] in items(a:defs)
      if l:group == "background"
        call s:load_color_def("LineNr", l:def)
        call s:load_color_def("NonText", l:def)
        call s:load_color_def("Normal", l:def)
      else
        call s:load_color_def(l:group, l:def)
      endif
      unlet l:group
      unlet l:def
    endfor
  endfun
  call s:load_colors(s:overrides)
  delf s:load_colors
  delf s:load_color_def
  delf s:current_color
  delf s:current_attr
endif

" delete functions {{{
delf s:X
delf s:prefix_highlight_value_with
delf s:rgb
delf s:is_empty_or_none
delf s:color
delf s:rgb_color
delf s:rgb_level
delf s:rgb_number
delf s:grey_color
delf s:grey_level
delf s:grey_number
" }}}
