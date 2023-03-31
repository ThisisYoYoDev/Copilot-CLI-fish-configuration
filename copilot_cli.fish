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
