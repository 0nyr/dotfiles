" Terminal palette colors. Edit Kitty's palette to change their appearance.
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'onyr'

" Preserve the terminal's default foreground and background.
highlight Normal       cterm=NONE ctermfg=NONE ctermbg=NONE
highlight Comment      cterm=NONE ctermfg=7    ctermbg=NONE
highlight Constant     cterm=NONE ctermfg=9    ctermbg=NONE
highlight String       cterm=NONE ctermfg=2    ctermbg=NONE
highlight Character    cterm=NONE ctermfg=2    ctermbg=NONE
highlight Number       cterm=NONE ctermfg=9    ctermbg=NONE
highlight Boolean      cterm=NONE ctermfg=9    ctermbg=NONE
highlight Float        cterm=NONE ctermfg=9    ctermbg=NONE
highlight Identifier   cterm=NONE ctermfg=1    ctermbg=NONE
highlight Function     cterm=NONE ctermfg=4    ctermbg=NONE
highlight Statement    cterm=NONE ctermfg=5    ctermbg=NONE
highlight Operator     cterm=NONE ctermfg=6    ctermbg=NONE
highlight PreProc      cterm=NONE ctermfg=3    ctermbg=NONE
highlight Type         cterm=NONE ctermfg=6    ctermbg=NONE
highlight Special      cterm=NONE ctermfg=3    ctermbg=NONE
highlight Underlined   cterm=underline ctermfg=4 ctermbg=NONE
highlight Ignore       cterm=NONE ctermfg=7    ctermbg=NONE
highlight Error        cterm=bold ctermfg=15   ctermbg=1
highlight Todo         cterm=bold ctermfg=0    ctermbg=3

highlight LineNr       cterm=NONE ctermfg=7    ctermbg=NONE
highlight CursorLineNr cterm=bold ctermfg=3    ctermbg=NONE
highlight CursorLine   cterm=NONE ctermfg=NONE ctermbg=8
highlight CursorColumn cterm=NONE ctermfg=NONE ctermbg=8
highlight ColorColumn  cterm=NONE ctermfg=NONE ctermbg=8
highlight Visual       cterm=NONE ctermfg=NONE ctermbg=8
highlight Search       cterm=NONE ctermfg=0    ctermbg=3
highlight IncSearch    cterm=bold ctermfg=0    ctermbg=9
highlight CurSearch    cterm=bold ctermfg=0    ctermbg=9
highlight MatchParen   cterm=bold ctermfg=0    ctermbg=6
highlight StatusLine   cterm=bold ctermfg=0    ctermbg=4
highlight StatusLineNC cterm=NONE ctermfg=7    ctermbg=8
highlight VertSplit    cterm=NONE ctermfg=8    ctermbg=NONE
highlight Pmenu        cterm=NONE ctermfg=15   ctermbg=8
highlight PmenuSel     cterm=NONE ctermfg=0    ctermbg=4
highlight PmenuSbar    cterm=NONE ctermfg=NONE ctermbg=8
highlight PmenuThumb   cterm=NONE ctermfg=NONE ctermbg=7
highlight WildMenu     cterm=bold ctermfg=0    ctermbg=3
highlight NonText      cterm=NONE ctermfg=8    ctermbg=NONE
highlight SpecialKey   cterm=NONE ctermfg=7    ctermbg=NONE
highlight Directory    cterm=NONE ctermfg=4    ctermbg=NONE
highlight Title        cterm=bold ctermfg=4    ctermbg=NONE
highlight ErrorMsg     cterm=bold ctermfg=1    ctermbg=NONE
highlight WarningMsg   cterm=NONE ctermfg=3    ctermbg=NONE
highlight MoreMsg      cterm=NONE ctermfg=2    ctermbg=NONE
highlight Question     cterm=NONE ctermfg=6    ctermbg=NONE
highlight Folded       cterm=NONE ctermfg=7    ctermbg=8
highlight FoldColumn   cterm=NONE ctermfg=7    ctermbg=NONE
highlight SignColumn   cterm=NONE ctermfg=NONE ctermbg=NONE
highlight DiffAdd      cterm=NONE ctermfg=2    ctermbg=8
highlight DiffChange   cterm=NONE ctermfg=3    ctermbg=8
highlight DiffDelete   cterm=NONE ctermfg=1    ctermbg=8
highlight DiffText     cterm=bold ctermfg=0    ctermbg=3
highlight SpellBad    cterm=underline ctermfg=1 ctermbg=NONE
highlight SpellCap    cterm=underline ctermfg=3 ctermbg=NONE
highlight SpellRare   cterm=underline ctermfg=5 ctermbg=NONE
highlight SpellLocal  cterm=underline ctermfg=6 ctermbg=NONE

highlight markdownHeadingDelimiter cterm=bold ctermfg=4 ctermbg=NONE
highlight markdownBold cterm=bold ctermfg=NONE ctermbg=NONE
highlight markdownItalic cterm=italic ctermfg=NONE ctermbg=NONE
highlight markdownBoldItalic cterm=bold,italic ctermfg=NONE ctermbg=NONE
highlight! link markdownH1 Title
highlight! link markdownH2 Title
highlight! link markdownH3 Title
highlight! link markdownH4 Title
highlight! link markdownH5 Title
highlight! link markdownH6 Title
highlight! link markdownCode String
highlight! link markdownCodeBlock String
highlight! link markdownCodeDelimiter Special
highlight! link markdownLinkText Underlined
highlight! link markdownUrl Underlined
