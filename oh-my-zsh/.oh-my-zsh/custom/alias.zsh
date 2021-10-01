#!/hint/zsh

# personal folders
alias 2dl='cd /mnt/d/CloudStorage/DropBox/Download'
alias 2tool='cd /mnt/d/tool'
alias 2setting='cd /mnt/d/CloudStorage/DropBox/SoftwareSettings'
alias 2pic='cd /mnt/d/MyPic'
alias 2vdo='cd /mnt/d/MyVideo'
alias 2prj='cd /mnt/d/Work/Project'
alias 2wrk='cd /mnt/d/Work'

# commands
alias -g mkae='make'
alias tree='ls --tree'
alias lt='l --tree'
alias lg='l --grid'
alias llt='ll --tree'
alias llg='ll --grid'
alias ls='exa --group-directories-first'
alias cat='bat'
function catf() { tail -f "$1" | bat --paging=never --language=log; }

#alias catf='bat --pager "less +F"'
alias diffw='diff -w'
alias fd='fdfind --hidden --exclude ".clangd"'
alias fdf='fdfind --hidden --exclude ".clangd" --type f'
alias fdd='fdfind --hidden --exclude ".clangd" --type d'
alias ncdu='ncdu --color dark'
alias rgc='rg -c'
alias python='python3'

# win32 apps
alias wcode='"/mnt/c/Users/ibys/AppData/Local/Programs/Microsoft VS Code/Code.exe"'
alias widea='"/mnt/d/Tool/ideaIC-2019.1.3.win/bin/idea64.exe"'
alias potplayer='"/mnt/c/Program Files/DAUM/PotPlayer/PotPlayerMini64.exe"'
alias e='"/mnt/c/windows/explorer.exe"'
alias word='"/mnt/c/Program Files/Microsoft Office/Office15/WINWORD.EXE"'
alias excel='"/mnt/c/Program Files/Microsoft Office/Office15/EXCEL.EXE"'
alias ppt='"/mnt/c/Program Files/Microsoft Office/Office15/POWERPNT.EXE"'
alias visio='"/mnt/c/Program Files/Microsoft Office/Office15/VISIO.EXE"'
alias outlook='"/mnt/c/Program Files/Microsoft Office/Office15/OUTLOOK.EXE"'
alias svn='"/mnt/c/Program Files/TortoiseSVN/bin/svn.exe"'
alias chrome='"/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
alias psql='"/mnt/c/Program Files (x86)/pgAdmin 4/v4/runtime/psql.exe"'

export YSU_IGNORED_GLOBAL_ALIASES=(
  "mkae"
)

fun_wcode_open()
{
  if [[ $# -eq 0 ]]; then
    return
  fi

  _file=`f -R $@ | head -1`

  if [[ -z ${_file} ]]; then
    return
  fi

  wcode "$(wslpath -w ${_file})"
}

alias co='fun_wcode_open'
alias c='f -e bat'

function svnst() { svn status $@ | sed 's:\\:/:g'; }
