set -gx TERM screen-256color-bce;

fish_add_path ~/bin

if which nvim >/dev/null
  set -gx EDITOR nvim
end

# enable history in IEx
set -g -x ERL_AFLAGS "-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

# OS-specific stuff
switch (uname)
  case Linux
    source {$HOME}/.asdf/asdf.fish
    [ -f /usr/local/etc/grc.fish ]; and . /usr/local/etc/grc.fish
    [ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish
    [ -f /usr/share/autojump/autojump.fish ]; and . /usr/share/autojump/autojump.fish
    alias pbcopy 'xclip -selection clipboard'
    alias pbpaste 'xclip -selection clipboard -o'
  case Darwin
    [ -f /opt/homebrew/etc/grc.fish ]; and . /opt/homebrew/etc/grc.fish
    [ -f /opt/homebrew/opt/asdf/libexec/asdf.fish ]; and source /opt/homebrew/opt/asdf/libexec/asdf.fish
    [ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
    [ -f /usr/local/opt/asdf/libexec/asdf.fish ]; and source /usr/local/opt/asdf/libexec/asdf.fish
    fish_add_path /usr/local/bin
    fish_add_path /usr/local/opt/curl/bin
    fish_add_path /usr/local/sbin
    test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish    
  case '*'
    echo Unknown uname
end

# Fish git prompt
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'

# ---------
# Functions
# ---------
function fish_prompt --description 'Write out the prompt'
  set -l delim '>'
  set -l last_status $status

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __fish_prompt_cwd
    set -g __fish_prompt_cwd (set_color green)
  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  printf '%s' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" "$delim" ' '
end

function fish_greeting
  random_pokemon
end

function random_pokemon
  # https://github.com/dbernheisel/expokesay
  [ -d "$HOME/.pokesay" ]; and set p (find "$HOME/.pokesay" -type f | shuf -n 1)
  [ -d "$HOME/.pokesay" ]; and sh $p
  [ -d "$HOME/.pokesay" ]; and echo $(echo $p | string split '/' --fields 5 | string split '.' --fields 1)
end

# keep brew shellenv at the bottom
if test -f /opt/homebrew/bin/brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
end

if test -f /usr/local/bin/brew
  eval "$(/usr/local/bin/brew shellenv)"
end
