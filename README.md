Dotfiles, tracked in place at `$HOME`.

The git dir is `~/.dotfiles.git`, not `~/.git`, so `~` itself is not a git
worktree: tools run anywhere under `~` do not mistake the home directory for
this repo. The files stay where their applications expect them. Manage them
with the `dotfiles` alias (defined in `.zshrc`) instead of `git`:

```bash
dotfiles status
dotfiles add .zshrc
dotfiles commit -m "..."
dotfiles push
```

## Install on a new machine

```bash
git clone --bare git@github.com:rachael/dotfiles.git "$HOME/.dotfiles.git"
alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
dotfiles config core.worktree "$HOME"
dotfiles config status.showUntrackedFiles no
dotfiles checkout        # fails if a tracked file already exists; move it aside and retry
```

`.gitignore` ignores everything except the listed dotfiles, so `dotfiles add`
only ever picks up what is explicitly allowed.

## Versioning

Tags on `v2`. `v2.0` (2026-09-14) is the AI edition: the point where these
dotfiles started being maintained with and for AI agents (agent-log git
aliases, the bare git dir so agents running under `~` stop mistaking it for a
repo). Minor versions (`v2.1`, `v2.2`, ...) from here until something major
changes the setup again; a major bump is a decision, not a habit.

## Not installed by this repo

- [iTerm 2](https://iterm2.com/)
- [oh-my-zsh](https://ohmyz.sh/#install)
- [XCode](https://apps.apple.com/us/app/xcode/id497799835)
- [nvm](https://github.com/nvm-sh/nvm#install--update-script)
- [yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)
- [fzf](https://github.com/junegunn/fzf)
- [fasd](https://github.com/d10xa/fasd)

oh-my-zsh custom config: [rachael/ohmyzsh](https://github.com/rachael/ohmyzsh)

Code editors.

- [Cursor](https://cursor.sh/) (AI code editor)
- [VS Code](https://code.visualstudio.com/)

May also need:

For fasd

```bash
brew install gawk
brew install gnu-sed
```
