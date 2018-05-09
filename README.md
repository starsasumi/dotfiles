# dotfiles

## Start with a new machine

- Clone the project as a bare repository:

      git clone --bare https://github.com/starsasumi/dotfiles.git ~/.dotfiles

- Define a temporary alias to work with that repository:

      alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

- Check out the dotfiles with the alias above:

      dotfiles checkout

- The step above above might fail with a message.

  This is about overwriting dotfiles that exist already. Please rename/remove them, and then rerun `dotfiles checkout`.

- Prevent git from showing untrack files in your home when you type `dotfiles status`

      dotfiles config --local status.showUntrackedFiles no

- (Optional) Set your username and email.

      dotfiles config user.name "<name>"
      dotfiles config user.email "<email>"

## Usage

With the setop about, you can manege your dotfiles with command `dotfiles`. `dotfiles` is a git alias that works with the bare repository `~/.dotfiles`.

    dotfiles status
    dotfiles add .vimrc
    dotfiles commit -m "update vim config"

## Credit

Thanks for [Nicola Paolucci](https://developer.atlassian.com/blog/authors/npaolucci) for his great article _[The best way to store your dotfiles: A bare Git repository](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)_. Please read it if you would like to know more about the technique I use.
