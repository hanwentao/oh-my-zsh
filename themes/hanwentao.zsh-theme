function ssh_username_hostname() {
  if [[ -n "$SSH_CONNECTION" ]]; then
    if [[ -n "$USE_SOLARIZED" ]]; then
      echo "%{$fg[green]%}%n@%m "
    else
      echo "%{$fg_bold[green]%}%n@%m "
    fi
  fi
}

if [[ -n "$USE_SOLARIZED" ]]; then
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}git:(%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX=" "
  ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}X%{$fg[cyan]%})"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"

  local current_dir="%{$fg[blue]%}%~ "
  local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%}%? )%# "

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

  local current_dir="%{$fg_bold[blue]%}%~ "
  local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}%? )%# "
fi

PROMPT='%s$(ssh_username_hostname)${current_dir}$(git_prompt_info)${ret_status}%{$reset_color%}'
