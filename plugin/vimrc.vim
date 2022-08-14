scriptencoding utf-8

source $VIMRUNTIME/syntax/syntax.vim

" set cursor modes
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175


au BufReadPost if line("'\"")|execute("normal `\"")|endif
 autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \ exe "normal g`\"" |
   \ endif

"autocmd BufNewFile * set textwidth=78

" SWICH
let g:switch_mapping='-'
let g:switch_custom_definitions =
 \ [
    \   {
    \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
    \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
    \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
    \     '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
    \     '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
    \   },
    \   ['is', 'are']
 \ ]

" let g:showmarks_enable = 0
" let g:surround_indent = 1

" highlight lspReference guibg=#282c34

" set formatoptions-=a    " Auto formatting is BAD.
" set formatoptions-=t    " Don't auto format my code. I got linters for that.
" set formatoptions+=c    " In general, I like it when comments respect textwidth
" set formatoptions+=q    " Allow formatting comments w/ gq
" set formatoptions-=o    " O and o, don't continue comments
" set formatoptions+=r    " But do continue when pressing enter.
" set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
" set formatoptions+=j    " Auto-remove comments if possible.
" set formatoptions-=2    " I'm not in gradeschool anymore
" set nojoinspaces        " Two spaces and grade school, we're done
"
"verbose set formatoptions? formatoptions=croqlt
"
"
" let g:VM_maps = {}
" let g:VM_maps["Select h"]  = '<F2>'   "<S-Left>
" let g:VM_maps["Select l"]  = '<F3>'   "<S-Right>

" set modeline
" set modelines=10
" set modelineexpr
"
" syntax match OrgHeadlineStar1 /^\*\ze\s/me=e-1 conceal cchar=◉ containedin=OrgHeadlineLevel1 contained
" syntax match OrgHeadlineStar2 /^\*\{2}\ze\s/me=e-1 conceal cchar=○ containedin=OrgHeadlineLevel2 contained
" syntax match OrgHeadlineStar3 /^\*\{3}\ze\s/me=e-1 conceal cchar=✸ containedin=OrgHeadlineLevel3 contained
" syntax match OrgHeadlineStar4 /^\*{4}\ze\s/me=e-1 conceal cchar=✿ containedin=OrgHeadlineLevel4 contained
