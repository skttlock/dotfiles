# My dotfiles

This directory contains the dotfiles for my system and an install script to get started.
This script was written in and for Fedora 39/40 on GNOME DE.

## Getting Started
### Prerequisites
Ensure you have the following installed on your system
- Git
- GNU Stow
### Installation
1. Clone the repo to your $HOME path, that's it!

### Usage
1. Backup your `.bashrc` and `.bash_profile` files.
2. Navigate to the repo
3. `stow .` in your shell
4. Navigate to `/first_time_setup/`.
5. Utilize the `install.sh` script.
6. Test & Debug

## Whats Included?
### Appearance
- **Fonts** patched with Nerds Font Patcher
- **Wallpapers** patched to have Light/Dark mode versions in GNOME.
- **Catppuccin** color scheme in Nvim

### Applications
<details>
<summary>Tools I Use</summary>

- Back-Ups
  - Backups (provided by `deja-dup`) for Home Directory backups
  - Btrfs-Assistant for "restore point\[s] when a system configuration goes wrong"
- General Productivity
  - GUI
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
    - Synfig (Animation Software)
    - Google Chrome (Keyboard Training via zsa.io) - not included. download urself
    - LibreOffice Suite (Office Productivity Suite) - not included. download urself
    - ProtonMail (Mail & Calendar) - not included. download urself
    - ProtonVPN (VPN Client) - not included. download urself
- Development Tools
  - Terminal
    - GNU Stow
    - Git
    - Bat (`cat` improvement)
    - Bats (Bash test framework)
    - LSD
    - TLDR
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
      - Plugins:
        - TPM (plugin manager)
        - Tmux-Sensible
        - Tmux-Which-Key
  - Programming Languages
    - elm
    - julia
    - ruby
    - rust
    - vala
    - zig
</details>

# TODO
- [ ] link external github repos, i.e. rbenv, plugins, bash scripts, etc.
- [x] semantic ANSI text styling variables
- [ ] install scripts
  - [x] test install scripts
  - [x] retest install scripts
  - [x] rewrite with mise
  - [x] retest
  - [x] fix errors
  - [ ] repeat
  - [ ] finalize functionality
    - [ ] options?
    - [ ] make shell-agnostic?
    - [ ] uninstall?
  - [ ] retest install scripts
  - [ ] test on Ubuntu
- [ ] common-use scripts...?
  - [ ] update all?
  - [ ] backup...?
    - [ ] GNOME settings? (dconf)
    - [ ] gsettings?
- [ ] obsidian -> standard notes, wait to see proton offering
