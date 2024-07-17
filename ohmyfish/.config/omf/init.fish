# ---------- Bobthefish cusomizations ----------
set -g theme_nerd_fonts yes

# Show exit code instad of '!' in initial segment
#set -g theme_show_exit_status yes

# Show number of background tasks in initial segment
set -g theme_display_jobs_verbose yes

# Always display username, also for default user
#set -g theme_display_user yes

set -g theme_newline_cursor yes

# Custom right prompt (Show only time and date)
set -g theme_date_format +%T\ \ %x

set -g theme_title_display_process yes
#set -g theme_title_display_user yes

function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
    set -l white  ffffff
    set -l black  000000
    set -l gray   3a2a03
    set -l red    d12f1d
    set -l orange d1641b
    set -l yellow d1c21d
    set -l green  2ba307
    
    # Path and current dir
    set -x color_path                     $gray $white
    set -x color_path_basename            $gray $white --bold

    # Path and current dir when no write permissions
    set -x color_path_nowrite             $gray $red
    set -x color_path_nowrite_basename    $gray $red --bold

    # Initial segment after error in previous command
    set -x color_initial_segment_exit     $orange $white --bold
    set -x color_initial_segment_private  $orange $white
    set -x color_initial_segment_su       $orange $white --bold
    # Initial segment if a background task is running
    set -x color_initial_segment_jobs     $orange $white --bold
    
    # Git branch info
    set -x color_repo                     $green  $gray
    set -x color_repo_work_tree           $orange $gray
    set -x color_repo_dirty               $red    $gray
    set -x color_repo_staged              $yellow $gray
end