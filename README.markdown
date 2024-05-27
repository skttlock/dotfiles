# My dotfiles

This directory contains the dotfiles for my system. Currently, this will install/configure:

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
        - *TBD*
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

</details>

# TODO
- [ ] link external github repos, i.e. rbenv, plugins, bash scripts, etc.
- [ ] install scripts
  - [x] test install scripts
  - [ ] add dialogs: "install ruby? y/n" etc.
    - [ ] detect already installed things...
      - [ ] prog langs
      - [ ] uhh
  - [ ] add programming languages
    - [x] v...?
      - [ ] remove v?
    - [ ] vala
    - [ ] julia?
    - [ ] odin
    - [ ] crystal?
    - [ ] zig
    - [ ] ruby, not just rbenv...
    - [ ] rust, not just rustup...
    - [ ] print versions
  - [ ] retest install scripts
  - [ ] finalize functionality
    - [ ] options? -y for full... 
    - [ ] make shell-agnostic?
    - [ ] GNOME settings? (dconf)
    - [ ] gsettings?
    - [ ] uninstall?
  - [ ] retest install scripts
  - [ ] test on Ubuntu
- [ ] common-use scripts...?
  - [ ] update all
  - [ ] backup?
- [ ] install scripts rewrite
  - use BASH3Boilerplate?
