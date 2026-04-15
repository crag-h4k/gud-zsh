if [ "$USER" = "root" ];
    then CARETCOLOR="magenta";
else CARETCOLOR="blue";
fi

local return_code="%(?..%{$fg_bold[red]%}%?%{$reset_color%})"

RPS1='${return_code} %D{%d-%b-%Y} - %*'

PROMPT='%{$fg_bold[cyan]%}%n%{$reset_color%}%{$fg[yellow]%}@%{$reset_color%}%{$fg_bold[blue]%}%m%{$reset_color%}:%{${fg_bold[green]}%}%~%{$reset_color%}$(git_prompt_info)
%{${fg[$CARETCOLOR]}%}λ %{${reset_color}%}'
RPROMPT='$(tf_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}^%{$reset_color%}%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%} ❤"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ☭"
ZSH_THEME_GIT_PROMPT_UNKNOWN="%{$fg[cyan]%} ?"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[orange]%} ✭"

ZSH_THEME_TF_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_TF_PROMPT_SUFFIX="%{$reset_color%}"

# ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻
# ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➼ ✂
# ǂ ĭ Ť Ŧ ☭ ⚡ λ
# ✔ ☹ ☠ ☢ ☤ 🔥 ⚠
