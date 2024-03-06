alias zshconfig="vim ~/.zshrc"
alias zshrc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimrc="vim ~/.vimrc"
alias alacrittyrc="vim ~/.config/alacritty/alacritty.yml"
alias i3conf="vim ~/.config/i3/config"
alias ls="ls --color --group-directories-first"
alias wallpapers="ranger ~/Pictures/Wallpapers"
alias Desk="cd ~/Desktop/"
alias Down="cd ~/Downloads/"
alias UK="cd ~/Desktop/MFF-Stuff/"
alias gitpage="chromium https://github.com/Marculonis21"
alias vims="vim -S"
alias pyserver="python3 -m https.server"
alias localhost="chromium http://localhost:8000"
alias cscompile="dotnet msbuild"
alias monogameCompile="dotnet publish -c Debug -r linux-x64 --self-contained"

alias PROJ_bachelor="cd ~/Desktop/Projects/Python/SemestralWork"
alias PROJ_knowledgeboard="cd ~/Desktop/Projects/knowledgeboard.github.io"
alias knowledgeboard="chromium knowledgeboard.github.io"
alias knowledgeboard_blog="PROJ_knowledgeboard && nvim templates/blog.md && cd -"
alias knowledgeboard_publish="PROJ_knowledgeboard && make git && cd -"
alias school="cd ~/Desktop/MFF-Stuff/NMGR/ZS4/"

source ~/.config/zsh/tmux.zsh

mcscomplie () { mcs -recurse:'*.cs' -out:$1 ; } 
