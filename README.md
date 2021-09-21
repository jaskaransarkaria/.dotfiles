# .dotfiles

I manage my dotfiles with [rcm](https://github.com/thoughtbot/rcm). Also see [here](https://distro.tube/guest-articles/managing-dotfiles-with-rcm.html).

I advise setting up a `~/.rcrc` file with these contents:

> DOTFILES_DIRS="/path/to/your/dotfiles/directory"

Then you can use a command like this to push config to the right place:

> rcup -v config/nvim

Note the omission of the trailing '/'


- `mkrc -v <path to file or directory>` - add to .dotfiles with symlink
- `rcup` - updates all the dotfiles
- `rcdn <filename>` - removes the symlink

