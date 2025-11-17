export LANG=C.UTF-8
export LC_ALL=C.UTF-8

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\w '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source ~/.git-completion.bash

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

_npm_completion () {
  local words cword
  if type _get_comp_words_by_ref &>/dev/null; then
    _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
  else
    cword="$COMP_CWORD"
    words=("${COMP_WORDS[@]}")
  fi
   local si="$IFS"
  if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                         COMP_LINE="$COMP_LINE" \
                         COMP_POINT="$COMP_POINT" \
                         npm completion -- "${words[@]}" \
                         2>/dev/null)); then
    local ret=$?
    IFS="$si"
    return $ret
  fi
  IFS="$si"
  if type __ltrim_colon_completions &>/dev/null; then
    __ltrim_colon_completions "${words[cword]}"
  fi
}
complete -o default -F _npm_completion npm
###-end-npm-completion-###

export PATH="$PATH:$HOME/JS/e2ed/node_modules/.bin:$HOME/JS/joom-js/apps/pro-client/node_modules/.bin:$HOME/bin"

export NODE_REPL_HISTORY_SIZE=1000000

export VAULT_ADDR=https://vault.dev.joom.it/

cd ~/JS

_node_complete() {
  local cur_word options
  cur_word="${COMP_WORDS[COMP_CWORD]}"
  if [[ "${cur_word}" == -* ]] ; then
    COMPREPLY=( $(compgen -W '--experimental-specifier-resolution --frozen-intrinsics --tls-min-v1.2 --perf-prof-unwinding-info --require --max-http-header-size --experimental-vm-modules --insecure-http-parser --interactive --report-signal --inspect-port --experimental-policy --experimental-import-meta-resolve --no-force-async-hooks-checks --input-type --redirect-warnings --no-warnings --inspect-brk-node --trace-deprecation --preserve-symlinks-main --cpu-prof-name --cpu-prof --heap-prof-name --version --tls-max-v1.3 --tls-min-v1.0 --security-revert --expose-internals --report-directory --disable-proto --inspect --help --print --es-module-specifier-resolution --tls-min-v1.1 --v8-pool-size --debug-arraybuffer-allocations --experimental-loader --http-parser --icu-data-dir --report-filename --trace-sync-io --report-uncaught-exception --experimental-modules --trace-event-categories --v8-options --report-compact --force-context-aware --disallow-code-generation-from-strings --tls-cipher-list --experimental-wasm-modules --zero-fill-buffers --trace-event-file-pattern --perf-basic-prof-only-functions --test-udp-no-try-send --experimental-wasi-unstable-preview1 --heap-prof-interval --completion-bash --interpreted-frames-native-stack --openssl-config --trace-warnings --napi-modules --use-openssl-ca --use-bundled-ca --trace-sigint --use-largepages --debug-brk --jitless --policy-integrity --title --enable-source-maps --cpu-prof-interval --tls-keylog --experimental-repl-await --experimental-json-modules --throw-deprecation --check --experimental-worker --heap-prof --inspect-brk --report-on-signal --experimental-report --max-old-space-size --inspect-publish-uid --report-on-fatalerror --pending-deprecation --stack-trace-limit --trace-uncaught --trace-tls --no-node-snapshot --tls-max-v1.2 --perf-basic-prof --eval --tls-min-v1.3 --unhandled-rejections --trace-exit --heapsnapshot-signal --perf-prof --abort-on-uncaught-exception --prof-process --no-deprecation --heap-prof-dir --huge-max-old-generation-size --track-heap-objects --preserve-symlinks --debug --cpu-prof-dir --inspect-brk= --debug= --debug-port --print <arg> -c --debug-brk= -e -i --inspect= -p --loader --prof-process -pe -r --security-reverts --trace-events-enabled -v --inspect-brk-node= -h' -- "${cur_word}") )
    return 0
  else
    COMPREPLY=( $(compgen -f "${cur_word}") )
    return 0
  fi
}
complete -F _node_complete node node_g

_rush_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(rush tab-complete --position "${COMP_POINT}" --word "${COMP_LINE}" 2>/dev/null)"
  if [ $? -ne 0 ]; then
    completions=""
  fi

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

complete -f -F _rush_bash_complete rush


_rushx_completion () {
  local words cword
  if type _get_comp_words_by_ref &>/dev/null; then
    _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    words=(npm run "${words[@]:1}")
  else
    cword="$COMP_CWORD"
    words=(npm run "${COMP_WORDS[@]:1}")
  fi
   local si="$IFS"
  if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="2" \
                         COMP_LINE="npm run ${COMP_LINE:6}" \
                         COMP_POINT="$COMP_POINT" \
                         npm completion -- "${words[@]}" \
                         2>/dev/null)); then
    local ret=$?
    IFS="$si"
    return $ret
  fi
  IFS="$si"
  if type __ltrim_colon_completions &>/dev/null; then
    __ltrim_colon_completions "${words[2]}"
  fi
}
complete -o default -F _rushx_completion rushx

eval `keychain --eval --agents ssh id_ed25519`
