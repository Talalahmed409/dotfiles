zmodload zsh/zprof

# --------------------------------------------------

# ⚡ Powerlevel10k Instant Prompt (keep at VERY TOP)

# --------------------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------

# Core paths

# --------------------------------------------------

export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# --------------------------------------------------

# Desktop / Session detection (Hyprland + AMD)

# --------------------------------------------------

CURRENT_SESSION="${XDG_SESSION_DESKTOP:-$XDG_CURRENT_DESKTOP}"

if [[ "$CURRENT_SESSION" == "Hyprland" ]]; then
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_QPA_PLATFORM="wayland;xcb"
export XCURSOR_THEME="Bibata-Modern-Ice"
export XCURSOR_SIZE=24
export LIBVA_DRIVER_NAME="radeonsi"
export AMD_VULKAN_ICD="RADV"
export EDITOR='nvim'
fi

# --------------------------------------------------

# Language runtimes (lazy-loaded)

# --------------------------------------------------

export PYENV_ROOT="$HOME/.pyenv"

pyenv() {
unset -f pyenv
eval "$(command pyenv init --path)"
eval "$(command pyenv init -)"
pyenv "$@"
}

# --------------------------------------------------

# PATH (optimized, no duplicates)

# --------------------------------------------------

typeset -U path

path=(
"$PYENV_ROOT/bin"
"$HOME/.local/bin"
"$HOME/.npm-global/bin"
"$HOME/.spicetify"
/usr/bin
$path
)
export PATH


# --------------------------------------------------
# 🧠 History (RESTORE + IMPROVE)
# --------------------------------------------------
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

setopt APPEND_HISTORY          # append instead of overwrite
setopt SHARE_HISTORY           # share across terminals
setopt HIST_IGNORE_ALL_DUPS    # no duplicates
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE       # ignore commands starting with space
setopt INC_APPEND_HISTORY      # write immediately


# --------------------------------------------------

# Misc environment

# --------------------------------------------------

export ALSA_LOG_FILE="/dev/null"

# --------------------------------------------------

# ⚡ Completion system (FAST)

# --------------------------------------------------

autoload -U compinit; compinit
source ~/.fzf-tab/fzf-tab.plugin.zsh

# --------------------------------------------------

# ⚡ Powerlevel10k (fast prompt)

# --------------------------------------------------

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --------------------------------------------------

# ⚡ Plugins (manual loading = MUCH faster)

# --------------------------------------------------

# Autosuggestions

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# --------------------------------------------------

# Arch / AUR helper detection

# --------------------------------------------------

if (( $+commands[paru] )); then
aurhelper="paru"
elif (( $+commands[yay] )); then
aurhelper="yay"
fi

# Install helper function

in() {
local arch=() aur=()
for pkg in "$@"; do
if pacman -Si "$pkg" &>/dev/null; then
arch+=("$pkg")
else
aur+=("$pkg")
fi
done
(( ${#arch[@]} )) && sudo pacman -S "${arch[@]}"
(( ${#aur[@]} ))  && $aurhelper -S "${aur[@]}"
}

# --------------------------------------------------

# Aliases

# --------------------------------------------------

# Navigation

alias ..='cd ..'
alias ...='cd ../..'

# Listing (eza)

alias c='clear'
alias l='eza -lh --icons=auto'
alias ls='eza -1 --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias lt='eza --icons=auto --tree'

# Pacman / AUR

alias un='$aurhelper -Rns'
alias up='$aurhelper -Syu'
alias pl='$aurhelper -Qs'
alias pa='$aurhelper -Ss'
alias pc='$aurhelper -Sc'

# Tools

alias n='nvim'
alias snvim='sudoedit'
alias vc='code'
alias audiofix='systemctl --user restart pipewire pipewire-pulse wireplumber'
alias cp='cpg -g'
alias mv='mvg -g'
alias vpn='sudo openvpn --config ~/Downloads/profile-userlocked.ovpn'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias speed='speedtest-cli'
alias t='tmux'

# --------------------------------------------------

# ⚡ Lazy-loaded zoxide

# --------------------------------------------------

if (( $+commands[zoxide] )); then
function z() {
unfunction z zi
eval "$(zoxide init zsh)"
z "$@"
}
function zi() { z -i "$@"; }
fi

# --------------------------------------------------

# ⚡ Syntax highlighting (MUST BE LAST)

# --------------------------------------------------

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

