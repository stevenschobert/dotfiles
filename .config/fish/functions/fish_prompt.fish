function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
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

    if test $last_pipestatus != 0
      echo -s \
        ' ' \
        (set_color --bold red) \
        "[$last_pipestatus]" \
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
