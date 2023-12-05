set fish_greeting

source "$HOME/.config/fish/aliases.fish"

set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git
set fzf_git_log_format "%H %s"

set -U fish_user_paths "$HOME/.cargo/bin/" $fish_user_paths


function cheat
    curl -m 10 "http://cheat.sh/$argv" 2>/dev/null
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
