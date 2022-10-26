# My Setup

Why not `oh-my-zsh`? Well, it was super slow with the default config. Starship is a _light_ and fast wrapper for zsh.

## Getting Started

Clone this repo into `./config` so that you have `./config/myconfig`. Run `setup.sh`.

## Neovim/Vim HelpDesk

My config is originally based on [jdhao/nvim-config](https://github.com/jdhao/nvim-config).

A place for me to put keybindings for reference...until I know them by heart...

### Native keybindings

- To [see full path of current open buffer](https://vi.stackexchange.com/questions/104/how-can-i-see-the-full-path-of-the-current-file): `1 CTRL-G` \*`yw`: yank (copy) current word starting from cursor position within word.
- `yaw`: yank (copy) current word regardless of where the cursor is located in the word.
- [Edit a pane in a new tab](https://superuser.com/questions/66179/how-do-i-edit-an-existing-buffer-in-a-new-tab-in-vim#:~:text=You%20can%20accomplish%20this%20by,the%20sb%5Buffer%5D%20command.&text=The%20sb%20command%20normally%20opens,new%20tab%20should%20be%20created.):
  - `:ls`, then `:tab sb 2` if you wish to edit pane 2 to a new tab.
  - The tab's position can be dictated with `:0tab sb 2` to move pane 2 to a tab which will be first in all the tabs.

### Non-native keybindings

- `<leader>S`: Search-and-replace project-wide with Spectre

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

### CLI tools

- [fd: friendly alternative to find](https://github.com/sharkdp/fd)

#### Run commands on multiple files

Run black on all files, excluding a certain dir: `find . -type f -name "*.py" -not -path "*migrations*" -exec black '{}' \;`

Run Black on all changed git files: `git diff --name-only | xargs -I{} black {}`
