# My Setup

Why not `oh-my-zsh`? Well, it was super slow with the default config. Starship is a _light_ and fast wrapper for zsh.

## Getting Started

Clone this repo into `./config` so that you have `./config/myconfig`. Run `setup.sh`.

## Neovim/Vim HelpDesk

A place for me to put keybindings for reference...until I know them by heart...

* To [see full path of current open buffer](https://vi.stackexchange.com/questions/104/how-can-i-see-the-full-path-of-the-current-file): `1 CTRL-G`
* `yw`: yank (copy) current word starting from cursor position within word.
* `yaw`: yank (copy) current word regardless of where the cursor is located in the word.

* `<leader>S`: Search-and-replace project-wide with Spectre 

## Bash/Zsh HelpDesk

### Recursively run CMD on every file in dir

```Bash
find . -type d -exec echo "Hello, '{}'" \;

Hello, '.'
Hello, './.libs'
Hello, './include'
Hello, './autom4te.cache'
Hello, './build'
Hello, './modules'
```

#### Run commands on multiple files

Run black on all files, excluding a certain dir: `find . -type f -name "*.py" -not -path "*migrations*" -exec black '{}' \;`

Run Black on all changed git files: `git diff --name-only | xargs -I{} black {}`
