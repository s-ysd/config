### NOT use abbreviation for directly (https://blogenist.jp/2019/06/20/8807/#i-10)
set -g fish_prompt_pwd_dir_length 0
set -g theme_display_date no



### Setting the command to reload the fish config file
function reload
  source ~/.config/fish/config.fish
end



### Setting for peco
function fish_user_key_bindings
  bind \cq 'peco_select_history (commandline -b)'
end



##Set of alias in "fish"
balias ef 'vi ~/Dropbox/Mackup/.config/fish/config.fish'
balias icrar 'cd ~/Dropbox/M1/research/ICRAR/'
balias ls 'gls --color -Fa'
balias neovim 'vi ~/Dropbox/Mackup/.config/nvim/init.vim'
balias paper 'cd ~/Documents/Overleaf/Yoshida+19a'
balias py python
balias thesis 'cd ~/Documents/Overleaf/MasterThesisTemplate'
balias vi nvim



### Set ls_colors information(http://linux-sxs.org/housekeeping/lscolors.html)
export LS_COLORS='*.tex=04;92:*.py=04;93:*.html=04;95:*.ipynb=04;92:no=01;37:fi=00:di=01;34:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31'



### "ls" after "cd" (https://orako-column.com/fish-shell/)
function cd
  builtin cd $argv; and ls
end


### Set the fish theme as dracula
set -g theme_color_scheme dracula



### >>> conda initialize >>>
### !! Contents within this block are managed by 'conda init' !!
eval /Users/syoshida/.pyenv/versions/miniconda3-latest/bin/conda "shell.fish" "hook" $argv | source
### <<< conda initialize <<<
