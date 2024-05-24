# My dotfiles

This directory contains the dotfiles for my system. Currently, this will configure:
- Bash
- Git
- NeoVim
- Tmux

This directory also contains wallpapers and fonts I like. Eventually, these- as well as applications I use- will be installed using the scripts found in the `/first_time_setup/` directory.
- **PROGRAMMING LANGUAGES**
    - Ruby
        - Rails
    - Julia
    - *to be installed*
        - rust
        - go
        - typescript (sigh)
# Requirements
Ensure you have the following installed on your system
- Git
- GNU Stow
# Installation
1. Clone the repo to your $HOME path
2. Navigate to the repo
3. `stow .` in your shell
4. (WIP) Utlize the `install.sh` script.
5. Test & Debug
# Appearance
## Font(s)
- Liberation Font Family (including Narrow, all patched with Nerds Fonts)
    - Fedora Users :
        - One can manually install the fonts by copying the TTFs to `~/.fonts` for user wide usage and/or to `/usr/share/fonts/liberation` for system-wide availability. Then, run `fc-cache` to let that cached.
## Wallpaper(s)
- Currently using Trauma Team from Cyberpunk 2077 found on Wallhaven
## Colorscheme(s)
- Currently using Catppuccin in Nvim
- Default GNOME terminal colors in Gnome Terminal, based on System Light/Dark setting
# Applications
## Tools I Use
### Back-Ups
- Backups (provided by `deja-dup`) for Home Directory backups
- Btrfs-Assistant for "restore point\[s] when a system configuration goes wrong"
### Productivity
#### General
##### GUI - not included. download urself
- Synfig (Animation Software)
- Google Chrome (Keyboard Training via zsa.io)
- LibreOffice Suite (Office Productivity Suite)
###### Firefox (Web Browser)
- Extensions:
    - UBlock Origin
    - Privacy Badger
    - Dark Reader
    - Flagfox
    - Tree Style Tab
###### Obsidian (Note Taking) - config occurs on Sync
- Theme: Minimal
- (Community) Plugins:
    - Highightr
    - Calendar
    - Periodic Notes
    - Style Settings
    - Minimal Theme Settings
    - Hider
    - Folder Notes
    - Waypoint
#### Development
##### Terminal
- GNU Stow
- Git
- Bat (`cat` improvement)
- **Ruby Development**
    - Ruby
        - rbenv
            - ruby-build
###### NeoVIM
Currently based on Kickstart.nvim
- Plugins:
    - Colorschemes:
        - Catppuccin
    - Kickstart defaults:
        - Autopairs
        - Cmp
        - Conform
        - Debug
        - Git Signs
        - Indent Line
        - Lint
        - LSP Config
        - Mini
        - NeoTree
        - Telescope
        - Todo Comments
        - Treesitter
        - WhichKey
    - Custom plugins:
        - Auto Dark Mode
        - Vim-Bundler
        - Vim-Commentary
        - Vim-Endwise
        - Vim-Fugitive
        - Vim-Rails
        - Vim-Tmux
        - Neoscroll
###### Tmux
Currently pretty vanilla.
- Plugins:
    - TPM (plugin manager)
    - Tmux-Sensible
    - Tmux-Which-Key
# (Probably) Necessary Steps
## Git(Hub) Connection

# TODO
- add ignore first_time_setup to stow
- install shell script
    - app install shell script
        - add rbenv installs
-
