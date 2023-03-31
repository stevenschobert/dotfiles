function fish_prompt --description 'Write out the prompt'
    set -l last_status_list $pipestatus

    echo -n -s \
      (set_color --bold blue) \
      '#' \
      (set_color normal) \
      ' ' \
      (set_color cyan) \
      "$USER" \
      (set_color normal) \
      ' at ' \
      (set_color green) \
      "$hostname" \
      (set_color normal) \
      ' in ' \
      (set_color yellow) \
      (prompt_pwd --dir-length=0) \
      (set_color normal) \
      ' ' \
      (date '+[%H:%M:%S]')

    set -f last_status_sum 0
    for last_status_el in $last_status_list
      set -f last_status_sum (math $last_status_sum + $last_status_el)
    end

    if test $last_status_sum != 0
      set -l last_status_joined (string join ',' $last_status_list)
      echo -s \
        ' ' \
        (set_color --bold red) \
        "[$last_status_joined]" \
        (set_color normal)
    else
      echo -s ''
    end

    echo -n -s \
      (set_color --bold red) \
      '→' \
      (set_color normal) \
      ' '
end
