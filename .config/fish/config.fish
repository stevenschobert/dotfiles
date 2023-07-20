if status is-interactive
    # Commands to run in interactive sessions can go here
end

# TokyoNight Color Palette
set -l foreground ADADAD
set -l foreground_bright BABCC8
set -l selection 2E3758
set -l comment 565f89
set -l red E36744
set -l orange E17F64
set -l yellow EADA4A
set -l green 7EC452
set -l purple F258B9
set -l cyan 4ABFDF
set -l pink FA83C0

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $foreground_bright
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

# ASDF language version manager
source ~/.asdf/asdf.fish

# ASDF golang
. ~/.asdf/plugins/golang/set-env.fish
