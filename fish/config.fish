set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv no
set -g theme_display_ruby no
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date yes
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%Y/%m/%d(%a) %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user your_normal_user
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes

## Set prompt
function fish_prompt
  if [ $status -eq 0 ]
    set status_face (set_color green)"q(≧∇≦*)(*≧∇≦)p << "
  else
    set status_face (set_color purple)"(;>_<;) << "
  end
  set prompt (set_color red)(prompt_pwd)
  set time (set_color red)(date "+[%Y/%m/%d %H:%M]")

  echo \n
#  echo $time $prompt
  echo $prompt
  echo $status_face
end

##Set of alias in "fish"
balias icrar 'cd ~/Dropbox/M1/research/ICRAR/'
balias jn 'Jupyter notebook'
balias lmk 'latexmk -pvc'
balias lmkc 'latexmk -c'
balias ls 'gls --color -Fa'
balias neovim 'vi ~/.config/nvim/init.vim'
balias paper 'cd ~/Documents/Overleaf/'
balias py python
balias tp 'open -a topcat'
balias vi nvim

## Set ls_colors information(http://linux-sxs.org/housekeeping/lscolors.html)
export LS_COLORS='*.tex=04;92:*.py=04;93:*.html=04;95:*.ipynb=04;92:no=01;37:fi=00:di=01;34:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31'

## To use conda activate ##
#source (conda info --root)/etc/fish/conf.d/conda.fish
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#export PATH="$HOME/.pyenv/shims:$PATH"

## "ls" after "cd" (https://qiita.com/Riliumph/items/15245ef37ffd850385e7)
function cd
  if test (count $argv) -eq 0
      return 0
  else if test (count $argv) -gt 1
      printf "%s\n" (_ "Too many args for cd command")
      return 1
  end
  # Avoid set completions.
  set -l previous $PWD

  if test "$argv" = "-"
      if test "$__fish_cd_direction" = "next"
          nextd
      else
          prevd
      end
      return $status
  end
  builtin cd $argv
  set -l cd_status $status
  # Log history
  if test $cd_status -eq 0 -a "$PWD" != "$previous"
      set -q dirprev[$MAX_DIR_HIST]
      and set -e dirprev[1]
      set -g dirprev $dirprev $previous
      set -e dirnext
      set -g __fish_cd_direction prev
  end

  if test $cd_status -ne 0
      return 1
  end
  ls
  return $status
end


## For PRIISM
set -xg PYTHONPATH $PYTHONPATH /Users/syoshida/PRIISM
set -xg PYTHONPATH $PYTHONPATH /Users/syoshida/PRIISM/lib

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/syoshida/.pyenv/versions/miniconda3-latest/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

