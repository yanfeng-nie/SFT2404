"Recommended vim setting
filetype plugin indent on
set confirm
set syntax=on
set noeb

set autoindent
set cindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

set noexpandtab
set smarttab

set number
set history=1000

set nobackup
set noswapfile

set ignorecase
set hlsearch

set enc=utf-8
set langmenu=zh_CN.UTF-8
set helplang=cn

set laststatus=2
set cmdheight=2

:inoremap ( ()<left>
:inoremap [ []<left>
:inoremap { {}<left>
:inoremap " ""<left>
:inoremap ' ''<left>

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

func SetTitle()
"	if &filetype == 'sh'
		call setline(1,            "/***********************************************************")
		call append(line("."),     "    > File Name: ".expand("%") )
		call append(line(".")+1,   "    > Author: ________")
		call append(line(".")+2,   "    > Mail: __________")
		call append(line(".")+3,   "    > Created Time: ".strftime("%c"))
		call append(line(".")+4,   "    > Modified Time:".strftime("%c"))
		call append(line(".")+5,   "***********************************************************/")
		call append(line(".")+6,   "")
"	if &filetype == 'cpp'
	if expand("%:e") == 'cpp'
		call append(line(".")+7, "#include<cstdio>")
		call append(line(".")+8, "#include<iostream>")
		call append(line(".")+9, "#include<string>")
		call append(line(".")+10, "#include<cstdlib>")
		call append(line(".")+11, "")
		call append(line(".")+12, "using namespace std;")
		call append(line(".")+13, "int main(){")
		call append(line(".")+14, "")
		call append(line(".")+15, "    return 0;")
		call append(line(".")+16, "}")
		call append(line(".")+17, "")
	endif
"	if &filetype == 'c'
	if expand("%:e") == 'c'
		call append(line(".")+7, "#include<stdio.h>")
		call append(line(".")+8, "#include<stdlib.h>")
		call append(line(".")+9, "#include<string.h>")
		call append(line(".")+10, "")
		call append(line(".")+11, "int main(){")
		call append(line(".")+12, "")
		call append(line(".")+13, "    return 0;")
		call append(line(".")+14, "}")
	endif
endfunc

autocmd BufNewFile * normal G

function SetLastModifiedTime(lineno)
	let modif_time = strftime("%c")
	let line = '    > Modified Time:'.modif_time
	call setline(6, line)

endfunction

au BufNewFile *.v,*.c call SetLastModifiedTime(-1)
