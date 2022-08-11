" util_functions.vim - Util Functions
" Maintainer: Ivan Lopes

if exists("g:loaded_util_functions") || v:version < 700 || &cp
    finish
endif
let g:loaded_util_functions = 1

" 2017-04-29 03:12
"
" python << EOL
" import vim, StringIO,sys
" def PyExecReplace(line1,line2):
"   r          = vim.current.buffer.range(int(line1),int(line2))
"   redirected = StringIO.StringIO()
"   sys.stdout = redirected
"   exec('\n'.join(r) + '\n')
"   sys.stdout = sys.__stdout__
"   output     = redirected.getvalue().split('\n')
"   r[:]       = output[:-1] # the -1 is to remove the final blank line
"   redirected.close()
" EOL
" command -range Py python PyExecReplace(<f-line1>,<f-line2>)

" ruby <<EOF
" def RubyExecReplace(line1,line2)
"   r  = Vim::Buffer::range(Integer(line1),Integer(line2))
"   puts "something"
"   # some more ruby code
" end
" EOF
" command -range Ruby ruby RubyExecReplace(<f-line1>,<f-line2>)

" Command
" :FancyPaste [register]               | paste block onto new lines
function s:fancy_paste(register) abort
  let s = repeat(' ', virtcol('.')-1)
  call append(line('.'), map(split(getreg(a:register), '\n'), {_, v -> s . v}))
endfunction
command -register FancyPaste call s:fancy_paste('<reg>')

" Edit command output in a buffer
command -nargs=+ BufOut redir => bufout | silent <args> | redir END | new | call append(0, split(bufout, '\n'))

" :Me[ssages] as shorthand for `:BufOut :messages' (the dominant use case of
" :BufOut)
command -nargs=0 Messages :redir => bufout | silent :messages | redir END | new | call append(0, split(bufout, '\n'))

fun s:strip_trailing_whitespace()
  " " don't strip on these filetypes
  " if &ft =~ 'markdown'
  "   return
  " endif
  let m = getpos(".")
  silent! %s/\s\+$//e
  let @/ = ""
  call setpos("'H", m)
  exe "normal g`H"
  delm H
endfun
autocmd BufWritePre * call <SID>strip_trailing_whitespace()

command -nargs=* Stw call <SID>set_text_width()
function s:set_text_width()
  echohl ModeMsg
  let tw = 1 * input('set textwidth=')
  if tw > 0
    let &l:colorcolumn = tw+1
    let &l:tw = tw
  endif
  echon ' set colorcolumn='
  echohl None
  echon tw
endfunction

command -nargs=* Stab call <SID>tabstop_softtabstop_shiftwidth()
function s:tabstop_softtabstop_shiftwidth()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call <SID>summarize_tabs()
endfunction

function s:summarize_tabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" ----------------------------------------------------------------------------
" SaveMacro / LoadMacro
" ----------------------------------------------------------------------------
function s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction
command -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction
command -nargs=* LoadMacro call <SID>load_macro(<f-args>)
"Uso: após gravar a macro a
" faço, ":SaveMacro a MinhaMacro.txt"
" para recuperar faço ":LoadMacro MinhaMacro.txt a"
" a variável a contem agora a macro desejada

" Zoom
nnoremap <silent> <F4> :call <sid>zoom()<cr>
function s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction

" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
" function s:todo() abort
"   let entries = []
"   for cmd in ['git grep -n -e TODO -e FIXME -e XXX 2> /dev/null',
"             \ 'grep -rn -e TODO -e FIXME -e XXX * 2> /dev/null']
"     let lines = split(system(cmd), '\n')
"     if v:shell_error != 0 | continue | endif
"     for line in lines
"       let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
"       call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
"     endfor
"     break
"   endfor

"   if !empty(entries)
"     call setqflist(entries)
"     copen
"   endif
" endfunction
" command Todo call s:todo()

" ----------------------------------------------------------------------------
" EX | chmod +x
" ----------------------------------------------------------------------------
command Ux if !empty(expand('%'))
     \|   write
     \|   call system('chmod +x '.expand('%'))
     \|   silent e
     \| else
     \|   echohl WarningMsg
     \|   echo 'Save the file first'
     \|   echohl None
\| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:remove_fancy_characters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command RemoveFancyCharacters :call <SID>remove_fancy_characters()

" " Escape/unescape & < > HTML entities in range (default current line).
" function HtmlEntities(line1, line2, action)
"   let search = @/
"   let range = 'silent ' . a:line1 . ',' . a:line2
"   if a:action == 0  " must convert &amp; last
"     execute range . 'sno/&lt;/</eg'
"     execute range . 'sno/&gt;/>/eg'
"     execute range . 'sno/&amp;/&/eg'
"   else              " must convert & first
"     execute range . 'sno/&/&amp;/eg'
"     execute range . 'sno/</&lt;/eg'
"     execute range . 'sno/>/&gt;/eg'
"   endif
"   nohl
"   let @/ = search
" endfunction
" command -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
" noremap <silent> <Leader>h :Entities 0<CR>
" noremap <silent> <Leader>H :Entities 1<CR>
"
"
" Rename.vim  -  Rename a buffer within Vim and on the disk
"
" Copyright June 2007-2011 by Christian J. Robinson <heptite@gmail.com>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Rename[!] {newname}

command -nargs=* -complete=file -bang Rename call <SID>rename(<q-args>, '<bang>')

function s:rename(name, bang)
    let l:name    = a:name
    let l:oldfile = expand('%:p')

    if bufexists(fnamemodify(l:name, ':p'))
        if (a:bang ==# '!')
            silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
        else
            echohl ErrorMsg
            echomsg 'A buffer with that name already exists (use ! to override).'
            echohl None
            return 0
        endif
    endif

    let l:status = 1

    let v:errmsg = ''
    silent! exe 'saveas' . a:bang . ' ' . l:name

    if v:errmsg =~# '^$\|^E329'
        let l:lastbufnr = bufnr('$')

        if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
            if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
                silent exe l:lastbufnr . 'bwipe!'
            else
                echohl ErrorMsg
                echomsg 'Could not wipe out the old buffer for some reason.'
                echohl None
                let l:status = 0
            endif

            if delete(l:oldfile) != 0
                echohl ErrorMsg
                echomsg 'Could not delete the old file: ' . l:oldfile
                echohl None
                let l:status = 0
            endif
        else
            echohl ErrorMsg
            echomsg 'Rename failed for some reason.'
            echohl None
            let l:status = 0
        endif
    else
        echoerr v:errmsg
        let l:status = 0
    endif

    return l:status
endfunction

function s:execute_leader(suffix)
  let l:leader = get(g:,"mapleader","\\")

  if l:leader == ' '
    let l:leader = '1' . l:leader
  endif

  execute "normal ".l:leader.a:suffix
endfunction
command -nargs=1 NormLead call <SID>execute_leader(<f-args>)
"
" ----------------------------------------------------------------------------
" Open FILENAME:LINE:COL
" ----------------------------------------------------------------------------
" function s:goto_line()
"   let tokens = split(expand('%'), ':')
"   if len(tokens) <= 1 || !filereadable(tokens[0])
"     return
"   endif

"   let file = tokens[0]
"   let rest = map(tokens[1:], 'str2nr(v:val)')
"   let line = get(rest, 0, 1)
"   let col  = get(rest, 1, 1)
"   bd!
"   silent execute 'e' file
"   execute printf('normal! %dG%d|', line, col)
" endfunction
" autocmd vimrc BufNewFile * nested call s:goto_line()

" ----------------------------------------------------------------------------
" vim-emoji :dog: :cat: :rabbit:!
" ----------------------------------------------------------------------------
command -range EmojiReplace <line1>,<line2>s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

" ----------------------------------------------------------------------------
" List map
" ----------------------------------------------------------------------------

" func FzfListMap()
"     python3 <<PY3
" import vim
" import subprocess

" cmd_map = vim.eval("map")
" process = subprocess.popen(["fzf-tmux"], stdin=subprocess.pipe, stderr=subprocess.pipe)
" process.stdin.write(bytes(cmd_map+'\n','utf-8'))
" process.stdin.close()
" PY3
" endfunc

" function CodeBlock()
"   for lineno in range(a:firstline, a:lastline)
"     let line = getline(lineno)
"     let cleanLine = substitute(line, '\(\s\| \)\+$', '', 'e')
"     call setline(lineno, cleanLine)
"   endfor
" endfunction
" command -range=% CB  <line1>,<line2>call CodeBlock()

"fu TestFunc() range

"  " When a function is decorated with the «range» modifier,
"  " it is passed implicit a:firstline and a:lastline arguments
"  " The values of these arguments denote the line of the cursor
"  " when no visual selection is used or the first and last line
"  " of a visual selection.
"  ""'<,'>call TestFunc()

"  echo 'first line is: ' . a:firstline . ', last line is: ' . a:lastline
"endfunction

" command -range=% CB  <line1>,<line2>call CodeBlock()


" noremap <silent> <F1> :call <SID>toggle_wrap()<CR>
" function s:toggle_wrap()
"   if &wrap
"     echo "Wrap OFF"
"     setlocal nowrap
"     set virtualedit=all
"   else
"     echo "Wrap ON"
"     setlocal wrap linebreak nolist
"     set virtualedit=block
"   endif
" endfunction


" vim: fdm=marker:sw=4:sts=4:et
