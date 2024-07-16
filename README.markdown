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
  - Liberation Fonts
  - Geist Fonts (manual install)
- **Wallpapers** patched to have Light/Dark mode versions in GNOME.
- [ **Starship** ](https://github.com/starship/starship )
- [**Catppuccin**](https://github.com/catppuccin/catppuccin ) color scheme for WezTerm, NeoVIM, Starship, <!-- Polybar -->
<!-- - [ Polybar ](https://github.com/polybar/polybar ) -->

### Applications
<details>
<summary>Tools I Use</summary>

<details>
<summary>GNOME Extensions</summary>

- User Extensions
  - App Hider
  - Applications Overview Tooltip
  - Auto Move Applications
  - Bedtime Mode
  - Clipboard History
  - Display Scale Switcher
  - Gravatar
  - GSConnect
  - Just Perfection
  - Notification Banner Reloaded
  - Open Bar (disabled for performance)
  - Quick Setting Tweaker
  - Quick Settings Audio Devices Renamer
  - Removable Drive Menu
  - spotify-tray
  - Status Area Horizontal Spacing
  - Tactile
  - User Avater in Quick Settings
  - Vitals
- System Extensions
  - Appindicator and KStatusNotifierItem Support
  - Background Logo

</details>
<details>
<summary>General Productivity</summary>

- GUI
  - Backups (provided by `deja-dup`) for Home Directory backups
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
  - [ Audacity ](https://www.audacityteam.org/) (Audio Editing Software)
  - [ Reaper ](http://reaper.fm/index.php) (Digital Audio Workstation) - not included. download urself
  - ProtonMail (Mail & Calendar) - not included. download urself
  - ProtonPass (Password Manager) - not included. download urself
  - ProtonVPN (VPN Client) - not included. download urself
</details>
<details>
<summary>Development Tools</summary>

- [WezTerm](https://wezfurlong.org/wezterm/ ) (terminal emulator)
- Bash (CLI)
  - [Git](https://git-scm.com/ )
  - [GNU Stow](https://www.gnu.org/software/stow/ )
  - [Bat](https://github.com/sharkdp/bat ) (`cat` improvement)
  - Bats (Bash test framework)
  - [LSD](https://github.com/lsd-rs/lsd ) (prettier `ls`)
  - [rsync](https://rsync.samba.org/ ) for Obsidian Vault backup to local folder.
  - [ Starship ](https://github.com/starship/starship) (nice prompt)
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
      - User plugins:
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
  - javascript
  - julia
  - python
  - ruby
  - rust
  - vala
  - zig
</details>
</details>

### Keybinds (WIP)
Notes:
- design keybinds to be easy on laptop keyboard
- Voyager keyboard to have macros to handle keybinds.
- See shortcuts.json
#### Leader Keys
  - GNOME = SUPER
    - SWITCHER = SUPER + E
    - TACTILE = SUPER + W... change?
  - WEZTERM = SUPER + ... ?
  - NEOVIM = SPACE... add SUPER?
  - ...
#### Defaults
  - Open a new window
  - Close current window
  - Open a new tab
  - Close current tab
  - Prev/Next Workspace
  - Prev/Next Application = (SHIFT) + SUPER/ALT + TAB
  - Prev/Next Application in Workspace
  - Prev/Next Window
  - Prev/Next Window of Application
  - Prev/Next Tab = (SHIFT) CTRL + TAB

##### OS-Wide
  - (SHIFT) + SUPER/ALT + TAB = (Reverse) Switch Application
  - = Switch Window
  - SUPER + ESC = Switch Window of Application Directly
  - SUPER + Num = Open or Switch Directly to Favorite Application
##### Instancing
  - Close/Open Workspace
  - Close/Open Application
  - Close/Open Window = (SHIFT) CTRL + W
  - Close/Open Tab = (SHIFT) CTRL + T
##### Gnome: Switching
  - Window Switcher = SUPER + E
  - Prev/Next Workspace
  - Prev/Next Application
  - Prev/Next Window
  - Prev/Next Tab = (SHIFT) CTRL + TAB
  - Switch Focus = SUPER + H/J/K/L
  <!-- - Split = SUPER + ARROW_KEY -->
##### Tactile: Sizing/Positioning 
  - Prev/Next Monitor = TACTILE -> (SHIFT) + SPACE
  - Maximize = SUPER + UP or TACTILE -> 
  - Minimize
  - Grid-based Split = TACTILE + Point 1 + Point 2
##### WezTerm: Terminal
##### NeoVIM: Text Editor
  - Fold Commands: z
  - Switch Active Window (split) = CTRL + H/J/K/L



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

# /new/ To-Dos (072024)
- [ ] clean-up read me
  - merge-clean old todos into new
  - simplify readme; less is more
  - hyperlinks
  - general file management outline/instruction
  - obsidian vault explanation
  - applications list
- [ ] dotfiles (v2)
  - uhhhhuhuhuh
- [ ] research & test
  - [/] [pop-os/shell](https://github.com/pop-os/shell)
  - [/] cosmic-settings, how are keybinds handled->[pull 376](https://github.com/pop-os/cosmic-settings/pull/376)
  - dotfiles on ubuntu, install.sh on ubuntu
  - standard keybind adoption
  - 
- [ ] reinstall
  - [ ] pre-reqs
    - [ ] clean
    - [ ] document
    - [ ] test on vm
      - [ ] test 1: manual install (ubuntu & fedora)
      - [ ] test 2: script install (ubuntu & fedora)
      - compare
      - document
    - [ ] simplify
    
  - [ ]
# TODO(s) /old/
## Repo Stuff
- [/] link external github repos, i.e. rbenv, plugins, bash scripts, etc.
## Config Stuff
- [ ] Voyager keybinds
  - ctrl + a macro lol? - double tap a?
  - application specific macros:
    - prev/next tab macros
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
  - [ ] use starship + wezterm to name tabs as "process: filename:" ?
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
  - [ ] finalize functionality
    - [ ] put installs into individual functions
    - [ ] put status printing into individual functions?
    - [ ] options?
      - standard
        - [ ] --help
        - [ ] --all (install all)
        - [ ] --list
        - [ ] -o  (output log filename)
        - [ ] --quiet
        - [ ] --verbose
        - [ ] --assume-yes
        - [ ] --noexec
        - [ ] --debug
    - [ ] select menu (when no --all)
    - [ ] uninstall?
    - [ ] finish distro-agnostism
    - [ ] impl shell-agnostism?
  - [ ] retest install scripts
  - [ ] implement BATS
  - [x] fix new errors
  - [ ] add firefox-dev setup~ connection with nvim
  - [ ] test on Ubuntu
## Other Scripts
- [ ] common-use scripts...?
  - [ ] update all?
  - [ ] backup...?
    - [ ] humble bundle documents
    - [ ] GNOME settings? (dconf)
    - [ ] gsettings?
  - [ ] compression
    - [ ] individually compress directories in this directory
## Miscellaneous
- [ ] obsidian -> standard notes?, wait to see proton offering
- [ ] prune unneccessary stuff
- [ ] stuff to add to dotfiles
  - [ ] gnome extensions + extension settings
  - [ ] gnome tweaks + settings
  - [ ] kdenlive
  - [ ] audactity
  - [x] starship
  - [x] discord desktop
  - [x] vencord (does this break discord rules?)
  - [x] fastfetch
  - [ ] vibreoffice
- [ ] might rice
  - to test/add:
    - [x] fastfetch
    - [x] pitvi vs kdenlive
    - [x] kdenlive
    - [ ] vibreoffice
    - [x] fzf
    - [ ] atuin?
    - [ ] chezmoi?
    - [ ] powertop
    - [x] discord desktop
    - [x] vencord (does this break discord rules?)
    - [ ] pomotroid
  - [ ] to remove

- to config
  - [ ] sway
    - keybinds
    - workspaces
    - disable follow mouse focus
