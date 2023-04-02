# Copilot CLI

# Fish configuration for Copilot-CLI

set copilot_cli_path (which github-copilot-cli)

# check if copilot is installed
if test -z "$copilot_cli_path"
  echo "Copilot CLI not found. Please install it from https://www.npmjs.com/package/@githubnext/github-copilot-cli"
  exit 1
end

function copilot_assist --description 'Copilot CLI: Assist'
  set TMPFILE (mktemp)
  trap 'rm -f $TMPFILE' EXIT

  if $copilot_cli_path $argv[1] (echo $argv[2..-1]) --shellout $TMPFILE
    if [ -e "$TMPFILE" ]
      eval (cat $TMPFILE | sed ':a;N;$!ba;s/\n/ ; /g')
      if test $status -ne 0
        echo "Apologies! The command failed, log is available at $TMPFILE"
      end
    else
      echo "Apologies! Extracting command failed"
    end
  else
    return 1
  end
end


# Aliases for what-the-shell
alias '!!'='copilot_assist what-the-shell'
alias 'wts'='copilot_assist what-the-shell'

# Aliases for git-assist
alias 'git!'='copilot_assist git-assist'
alias 'ga'='copilot_assist git-assist'

# Aliases for gh-assist
alias 'gh!'='copilot_assist gh-assist'
alias 'gha'='copilot_assist gh-assist'


function add_history_entry --description 'Add history entry'
  begin
    flock 1
    and echo -- '- cmd:' (
      string replace -- \n \\n (string join ' ' $argv) | string replace \\ \\\\
    )
    and date +'  when: %s'
  end >> $__fish_user_data_dir/fish_history
  and history merge
end

# Thanks to Cody Tubbs for this part <3
set copilot_regex_wildcard_wts '^(?<tag>#?\?\?\s?)(?<copilot_cmd_string>.*)'
set copilot_regex_wildcard_git '^(?<tag>#?git\?\s?)(?<copilot_cmd_string>.*)'
set copilot_regex_wildcard_gh '^(?<tag>#?gh\?\s?)(?<copilot_cmd_string>.*)'

function hook_exit --on-event fish_exit --description 'Copilot CLI: Exit hook'
  if string match -raq $copilot_regex_wildcard_wts $history[1] or \
    string match -raq $copilot_regex_wildcard_git $history[1] or \
    string match -raq $copilot_regex_wildcard_gh $history[1]
     add_history_entry 'block copilot on startup'
 end
end

function hook_cli --on-event fish_prompt --description 'Copilot CLI: Hook'
  if string match -raq $copilot_regex_wildcard_wts $history[1]
    copilot_assist what-the-shell "$copilot_cmd_string"
  end
  if string match -raq $copilot_regex_wildcard_git $history[1]
    copilot_assist git-assist "$copilot_cmd_string"
  end
  if string match -raq $copilot_regex_wildcard_gh $history[1]
    copilot_assist gh-assist "$copilot_cmd_string"
  end
end