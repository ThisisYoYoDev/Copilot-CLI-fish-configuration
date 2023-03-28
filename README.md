# Copilot-CLI-fish-configuration
Here is this little script to help you configure copilot cli on fish

```
alias '??'='copilot_what-the-shell';
alias "git\?"='copilot_git-assist';
alias 'gh\?'='copilot_gh-assist';
alias 'wts'='copilot_what-the-shell';
```

For the moment it does not support the wildcard for:\
git? who becomes git\\?\
gh? which becomes gh\\?\
?? works correctly


## How to install it ?

Just put the configuration in `~/.config/fish/config.fish`



## One line install

```sh
curl https://raw.githubusercontent.com/ThisisYoYoDev/Copilot-CLI-fish-configuration/f741dfca21822419a9c344d7ec9516465f7bac5a/copilot_cli.fish >> ~/.config/fish/config.fish
```

Then re-open your terminal and enjoy 🎊
