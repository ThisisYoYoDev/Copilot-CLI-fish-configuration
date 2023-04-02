# Copilot-CLI-fish-configuration

This repository contains a script to help you configure the Copilot CLI on fish, a user-friendly shell for UNIX-like operating systems.

## How to use this configuration?
This repository provides a simple configuration script that includes aliases for some of Copilot's commands. The script adds aliases for `what-the-shell`, `git-assist`, and `gh-assist` commands. 

To use this configuration, you just need to add the provided script to your fish shell's configuration file. You can do this manually by copying the script to `~/.config/fish/config.fish`. \
Alternatively, you can use the one-line installation command below, which will automatically add the script to your fish shell's configuration file:

```bash
curl https://raw.githubusercontent.com/ThisisYoYoDev/Copilot-CLI-fish-configuration/main/copilot_cli.fish >> $__fish_config_dir/config.fish
```

Once you have installed the script, you can start using the aliases for `what-the-shell`, `git-assist`, and `gh-assist` commands in your fish shell. DO NOT forget to re-open your terminal after installing the script.

## What are the aliases?

| Alias | Command |
| --- | --- |
| `??` | `what-the-shell` |
| `!!` | `what-the-shell` |
| `wts` | `what-the-shell` |
| `git?` | `git-assist` |
| `git!` | `git-assist` |
| `ga` | `git-assist` |
| `gh?` | `gh-assist` |
| `gh!` | `gh-assist` |
| `gha` | `gh-assist` |


Thanks for reading! If you have any questions, feel free to open an issue <3
