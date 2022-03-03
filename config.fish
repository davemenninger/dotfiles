set PATH $PATH ~/bin

# Colors
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_show_informative_status 1

function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q -g __fish_classic_git_functions_defined
    set -g __fish_classic_git_functions_defined

    function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
      if status --is-interactive
        set -e __fish_prompt_user
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
      if status --is-interactive
        set -e __fish_prompt_host
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
      if status --is-interactive
        set -e __fish_prompt_status
        commandline -f repaint ^/dev/null
      end
    end
  end

  set -l delim '>'

  switch $USER

  case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

  case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q fish_color_user
    set -g fish_color_user 'green'
  end
  if not set -q fish_color_host
    set -g fish_color_host 'cyan'
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end

  printf '%s' "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" @ "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd)
  set_color normal
  printf '%s' (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" "$delim" ' '
end

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish
[ -f /usr/share/autojump/autojump.fish ]; and . /usr/share/autojump/autojump.fish
[ -f /usr/local/etc/grc.fish ]; and . /usr/local/etc/grc.fish
[ -f ~/perl5/perlbrew/etc/perlbrew.fish ]; and . ~/perl5/perlbrew/etc/perlbrew.fish

set -gx TERM screen-256color-bce;

function vs
  vagrant ssh;
end


# rbenv
if which rbenv >/dev/null
  set -gx PATH "$HOME/.rbenv/shims" $PATH
  set -gx RBENV_SHELL fish
  set RBENV_VERSION (rbenv --version | sed "s/rbenv //")
  # echo $RBENV_VERSION
  [ -f "/usr/local/Cellar/rbenv/$RBENV_VERSION/libexec/../completions/rbenv.fish" ]; and . "/usr/local/Cellar/rbenv/$RBENV_VERSION/libexec/../completions/rbenv.fish"
  [ -f '/usr/lib/rbenv/completions/rbenv.fish' ]; and . '/usr/lib/rbenv/completions/rbenv.fish'
  command rbenv rehash 2>/dev/null
  function rbenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      source (rbenv "sh-$command" $argv|psub)
    case '*'
      command rbenv "$command" $argv
    end
  end
end

# enable history in IEx
set -g -x ERL_AFLAGS "-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[ -f /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.fish ]; and . /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.fish

function fish_greeting
  # https://github.com/dbernheisel/expokesay
  [ -d "$HOME/.pokesay" ]; and sh (find "$HOME/.pokesay" -type f | shuf -n 1)
  [ -f ~/Dropbox/todo/todo.md ]; and cat ~/Dropbox/todo/todo.md | sort -R | head -3;
end

function todo
  set todo_path ~/Dropbox/todo/todo.md
  switch $argv[1]
    case ''
      nvim "$todo_path"
    case '*'
      set tag (string upper $argv[1])
      echo "$tag"
      cat "$todo_path" | grep "$tag"
      true
  end
end


# TODO OS-specific stuff
switch (uname)
  case Linux
    echo Hi Tux!
  case Darwin
    echo Hi Hexley!
    set PATH $PATH /usr/local/bin
    set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
    test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
    source /usr/local/opt/asdf/asdf.fish
    source /usr/local/opt/asdf/libexec/asdf.fish
    set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
  case '*'
    echo Unknown uname
end
