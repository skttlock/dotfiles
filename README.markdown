# My dotfiles

This directory contains the dotfiles for my system. Currently, this will configure:
- Bash
- Git
- NeoVim
- Tmux

This directory also contains wallpapers and fonts I like. Eventually, these- as well as applications I use- will be installed using the scripts found in the `/first_time_setup/` directory.
- **PROGRAMMING LANGUAGES**
    - Ruby
    - Rust
    - *to be installed*
        - go
        - typescript
# Requirements
Ensure you have the following installed on your system
- Git
- GNU Stow
# Installation
1. Clone the repo to your $HOME path
2. Backup your `.bashrc` and `.bash_profile` files.
3. Navigate to the repo
4. `stow .` in your shell
5. (WIP) Utlize the `install.sh` script.
6. Test & Debug
# Appearance
## Font(s)
- Liberation Font Family (including Narrow, all patched with Nerds Fonts)
    - Fedora Users :
        - One can manually install the fonts by copying the TTFs to `~/.fonts` for user wide usage and/or to `/usr/share/fonts/liberation` for system-wide availability. Then, run `fc-cache` to let that cached.
## Wallpaper(s)
- Patched to have Light/Dark mode versions in GNOME.
## Colorscheme(s)
- Currently using Catppuccin in Nvim
- Default GNOME terminal colors in Gnome Terminal, based on System Light/Dark setting
# Applications
<details>

<summary>Tools I Use</summary>
- Back-Ups
    - Backups (provided by `deja-dup`) for Home Directory backups
    - Btrfs-Assistant for "restore point\[s] when a system configuration goes wrong"
- General Productivity
    - GUI
        - Synfig (Animation Software)
        - Google Chrome (Keyboard Training via zsa.io) - not included. download urself
        - LibreOffice Suite (Office Productivity Suite) - not included. download urself
        - Firefox (Web Browser)
            - Extensions:
                - ProtonPass
                - ProtonVPN
                - UBlock Origin
                - Privacy Badger
                - Dark Reader
                - Flagfox
                - Tree Style Tab
        - Obsidian (Note Taking) - config occurs on Sync
            - Theme: Minimal
            - (Community) Plugins:
                - Highightr
                - Calendar
                - Periodic Notes
                - Folder Notes
                - Waypoint
                - Hider
                - Style Settings
                - Minimal Theme Settings
- Development Tools
    - Terminal
        - GNU Stow
        - Git
        - Bat (`cat` improvement)
        - LSD
        - **Ruby Development**
            - rbenv
        - **Rust Development**
            - rustup
        - **V Development**
            - *TBA*
        - NeoVIM
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
        - Tmux
        Currently pretty vanilla.
            - Plugins:
                - TPM (plugin manager)
                - Tmux-Sensible
                - Tmux-Which-Key

</details>
# (Probably) Necessary Steps
## Git(Hub) Connection

# TODO
- test install scripts
- link external github repos, i.e. rbenv, plugins, bash scripts, etc.
