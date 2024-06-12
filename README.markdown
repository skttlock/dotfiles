# My dotfiles

This directory contains the dotfiles for my system and an install script to get started.
This script was written in and for Fedora 39/40 on GNOME DE.

## Getting Started
### Prerequisites
Ensure you have the following installed on your system
- [Git](https://git-scm.com/ )
- [GNU Stow](https://www.gnu.org/software/stow/ )
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
- [**Catppuccin**](https://github.com/catppuccin/catppuccin ) color scheme for WezTerm, NeoVIM, Polybar
- [ Polybar ](https://github.com/polybar/polybar )
- [ Starship ](https://github.com/starship/starship )

### Applications
<details>
<summary>Tools I Use</summary>

- Back-Ups
  - Backups (provided by `deja-dup`) for Home Directory backups
  - Btrfs-Assistant for "restore point\[s] when a system configuration goes wrong"
  - [rsync](https://rsync.samba.org/ ) for Obsidian Vault backup to local folder.
- General Productivity
  - GUI
    - [Firefox](https://www.mozilla.org/en-US/firefox/ ) (Web Browser)
      - Extensions:
        - ProtonPass
        - ProtonVPN
        - UBlock Origin
        - Privacy Badger
        - Dark Reader
        - Flagfox
        - Tree Style Tab
    - [Obsidian](https://obsidian.md/ ) (Note Taking) - config occurs via Sync plugin
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
    - [Synfig](https://www.synfig.org/ ) (Animation Software)
    - [Godot](https://godotengine.org/ ) (Game Egnine)
    - Google Chrome (Keyboard Training via zsa.io) - not included. download urself
    - [ LibreOffice Suite ](https://www.libreoffice.org/ ) (Office Productivity Suite)
      - [ Vibreoffice ](https://github.com/seanyeh/vibreoffice )
      - CodeHighlighter
    - ProtonMail (Mail & Calendar) - not included. download urself
    - ProtonVPN (VPN Client) - not included. download urself
- Development Tools
  - [WezTerm](https://wezfurlong.org/wezterm/ ) (terminal emulator)
  - CLI (Bash)
    - [GNU Stow](https://www.gnu.org/software/stow/ )
    - [Git](https://git-scm.com/ )
    - [Bat](https://github.com/sharkdp/bat ) (`cat` improvement)
    - Bats (Bash test framework)
    - [LSD](https://github.com/lsd-rs/lsd ) (prettier `ls`)
    - [TLDR](https://github.com/tldr-pages/tldr )
    - [NeoVIM](https://github.com/neovim/neovim )
      - Plugins:
        - Colorschemes:
          - Catppuccin
        - [Kickstart](https://github.com/nvim-lua/kickstart.nvim ) defaults:
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
          - Neoscroll (remove?)
          - wezterm/nvim interaction plugin (tbd & added)
   - Tmux (to be removed as WezTerm becomes main)
      - Plugins:
        - TPM (plugin manager)
        - Tmux-Sensible
        - Tmux-Which-Key
  - Programming Languages
    - elm
    - julia
    - [ruby]
    - rust
    - vala
    - zig
</details>

### Keybinds (WIP)
Notes:
- design keybinds to be easy on laptop keyboard
- Voyager keyboard to have macros to handle keybinds.
#### Leader Keys
  - Tactile
  - WezTerm
  - NeoVIM
  - 
#### Defaults
  - Open a new window
  - Close current window
  - Open a new tab
  - Close current tab

##### OS-Wide
  - (SHIFT) + SUPER/ALT + TAB = (Reverse) Switch Application
  - = Switch Window
  - SUPER + ESC = Switch Window of Application Directly
  - SUPER + Num = Open or Switch Directly to Favorite Application
##### Leader Keys
  - Tactile: SUPER + W
  - Wezterm: uhhh
  - Neovim: SPACE
##### Instancing
  - Close/Open Workspace
  - Close/Open Application
  - Close/Open Window = (SHIFT) CTRL + W
  - Close/Open Tab = (SHIFT) CTRL + T
##### Switching
  - Prev/Next Workspace
  - Prev/Next Application
  - Prev/Next Window
  - Prev/Next Tab = (SHIFT) CTRL + TAB
##### Sizing/Positioning 
  - Prev/Next Monitor
  - Maximize
  - Minimize
  - Left split
  - Right split
  - Up split
  - Down split

#### [ GNOME ](https://help.gnome.org/users/gnome-help/stable/keyboard.html.en ):
- hint: `gsettings list-recursively | grep -i "keybinding"`
#### [ Obsidian ](https://help.obsidian.md/User+interface/Hotkeys ):
#### NeoVIM:
  - LEADER = SPACE
  - U (normal mode) = Undo
  - CTRL + R (normal mode) = Redo
  - NeoScroll:
    - CTRL + U = Scroll Up
    - CTRL + D = Scroll Down
####  [WezTerm](https://wezfurlong.org/wezterm/config/keys.html ):
use window macros for panes?
- LEADER = 
  - Searching:
    - SHIFT + CTRL + F = enter scrollback search mode
  - Spawning:
    - LEADER + N
    - LEADER + T
    - SHIFT + CTRL + N = spawn window
    - SHIFT + CTRL + T = spawn tab
  - Navigating:
    - LEADER + ARROW_KEY
    - SHIFT + CTRL + ARROW_KEY = activate pane relative to current pane
    - LEADER + 
    - CTRL + TAB = next tab
    - SHIFT + SUPER + \[ or \] = activate next or previous tab relative to current tab
  - Sizing:
    - LEADER + 
  - Other:
    - SHIFT + CONTROL + P = activate command palette

# TODO(s)
## Repo Stuff
- [/] link external github repos, i.e. rbenv, plugins, bash scripts, etc.
## Config Stuff
- [ ] Voyager keybinds
  - application specific macros:
    - prev/next tab macros
    - 
    - wezterm tab management...
- [ ] keybinds:
  - [ ] Make Reliable/Sensible Defaults
  - [ ] WezTerm
      - [ ] delete all keybinds, then:
      - [ ] leader key(bind)
      - [ ] pane: create, delete, size, selection
      - [ ] tab: create, delete, selection
- [ ] determine:
  - [ ] wezterm functionality to keep or remove
    - [ ] command palette?
- [ ] test i3, other WMs
- [ ] find a better way to manage keybinds
  - test:
    - [ ] xbindkeys
## "User" Friendliness
- [x] semantic ANSI text styling variables
## Install Scripts
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
## Other Scripts
- [ ] common-use scripts...?
  - [ ] update all?
  - [ ] backup...?
    - [ ] humble bundle documents
    - [ ] GNOME settings? (dconf)
    - [ ] gsettings?
  - [ ] compression
    - [ ] individually compress directories in this directories
## Miscellaneous
- [ ] obsidian -> standard notes?, wait to see proton offering
- [ ] prune unneccessary stuff
- [ ] might rice
  - to add:
    - [x] polybar - feels redundant on GNOME
    - [ ] starship
    - [ ] poketerm?
    - [ ] nerdfetch
    - [ ] vibreoffice
    - [ ] fzf
    - [ ] atuin?
    - [ ] chezmoi?
    - [ ] powertop
    - 
  - to add to dotfile and config:
    - polybar
    - starship
