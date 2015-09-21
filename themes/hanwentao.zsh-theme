function ssh_username_hostname() {
  if [[ -n "$SSH_CONNECTION" ]]; then
    if [[ -n "$USE_SOLARIZED" ]]; then
      echo "%{$fg[green]%}%n@%m%{$reset_color%} "
    else
      echo "%{$fg_bold[green]%}%n@%m%{$reset_color%} "
    fi
  fi
}

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo "%{$fg[cyan]%}{"`basename $VIRTUAL_ENV`"}%{$reset_color%} "
}

if [[ -n "$USE_SOLARIZED" ]]; then
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%})"
  ZSH_THEME_GIT_PROMPT_CLEAN=")"

  local current_dir="%{$fg[blue]%}%~%{$reset_color%} "
  local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%}%? )%#%{$reset_color%} "

  case "$(uname)" in
    Darwin)
      export LSCOLORS="exbxfxdxcxedgdbcfcdebe"
      ;;
    Linux)
      export LS_COLORS="rs=0:di=34:ln=31:mh=33;41:pi=33:so=35:do=36:bd=34;43:cd=36;43:or=36;41:su=31;42:sg=35;42:ca=31;46:tw=33;44:ow=31;44:st=36;44:ex=32:"
      ;;
    *)
      ;;
  esac
else
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}git:(%{$fg_bold[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX=" "
  ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}X%{$fg_bold[cyan]%})"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%})"

  local current_dir="%{$fg_bold[blue]%}%~%{$reset_color%} "
  local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}%? )%#%{$reset_color%} "
fi

PROMPT='%s$(ssh_username_hostname)${current_dir}$(virtualenv_info)$(git_prompt_info)${ret_status}%{$reset_color%}'
