
# Fish configuration for Copilot-CLI

set copilot_cli_path (which github-copilot-cli)

# check if copilot is installed
if test -z "$copilot_cli_path"
  echo "Copilot CLI not found. Please install it from https://www.npmjs.com/package/@githubnext/github-copilot-cli"
  exit 1
end

function copilot_what-the-shell --description 'Copilot CLI: What the shell ?'
  set TMPFILE (mktemp)
  trap 'rm -f $TMPFILE' EXIT

  if $copilot_cli_path what-the-shell "$argv" --shellout $TMPFILE

    if [ -e "$TMPFILE" ]
      set FIXED_CMD (cat $TMPFILE)
      eval "$FIXED_CMD"
    else
      echo "Apologies! Extracting command failed"
    end

  else
    return 1
  end

end

function copilot_git-assist --description 'Copilot CLI: Git assist'
  set TMPFILE (mktemp)
  trap 'rm -f $TMPFILE' EXIT

  if $copilot_cli_path git-assist "$argv" --shellout $TMPFILE

    if [ -e "$TMPFILE" ]
      set FIXED_CMD (cat $TMPFILE)
      eval "$FIXED_CMD"
    else
      echo "Apologies! Extracting command failed"
    end

  else
    return 1
  end

end

function copilot_gh-assist --description 'Copilot CLI: Github assist'
  set TMPFILE (mktemp)
  trap 'rm -f $TMPFILE' EXIT
  if $copilot_cli_path gh-assist "$argv" --shellout $TMPFILE

    if [ -e "$TMPFILE" ]
      set FIXED_CMD (cat $TMPFILE)
      eval "$FIXED_CMD"
    else
      echo "Apologies! Extracting command failed"
    end

  else
    return 1
  end
end

# Aliases for what-the-shell
alias '!!'='copilot_what-the-shell'
alias 'wts'='copilot_what-the-shell'

# Aliases for git-assist
alias 'git!'='copilot_git-assist'
alias 'ga'='copilot_git-assist'

# Aliases for gh-assist
alias 'gh!'='copilot_gh-assist'
alias 'gha'='copilot_gh-assist'
