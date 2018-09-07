# My Z shell configuration

This contains my configuration files for Z shell.

I'm mostly a Java and Ruby programmer, so the vast majority of the configuration is for those
languages, and by extensions, Gradle and Rake.

I also use Emacs, bouncing back and forth between it for editing, and the command line for
execution. (That is, I don't have a shell within Emacs.)

## Examples

Lately I've used global aliases much more often, such as the below:


```shell
# most recent directory and file:
alias -g D='*(/om[1])'
alias -g F='*(.om[1])'

# list the most recent directory:
% ls D

# open the most recent file in Emacs (see separate entry for "ec"):
% ec F

alias -g S='| sort'
alias -g SN='| sort -n'

# sort by name:
% find -name \*.rb S

# sort by file length:
% wc **/*.rb SN

# Prepend line numbers to each line:
alias -g LN='| awk "{print FNR \" \" \$0 }"'
% find -type f LN

# mix them; prepend line numbers to the files under the most recent directory, sorted:
% find D -type f S LN
```

Some Emacs shortcuts:

```shell
# the current file in Emacs
ecf() {
    echo ${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) buffer-file-name) ')}
}
# detailed list of the current file in Emacs
% ls -l `ecf`

# the directory of the current file in Emacs (same as "ecf | xargs dirname"):
ecd() {
    echo ${(Q)~$(emacsclient -e '(with-current-buffer (window-buffer (selected-window)) default-directory) ')}
}
# change to the current directory in Emacs
% cd `ecd`

ec() {
    for i in $*
    do
        emacsclient --no-wait $i
    done
}
# open the file in Emacs:
% ec README.md

# currently open file in Emacs:
alias -g EF='`ecf`'
# same as the above example:
% ls -l EF

# directory of the current file
alias -g ED='`ecd`'
# see above
% cd ED

# rootname (e.g., "Array.java") of the current file:
alias -g ER='`ecr`'
# find 

# basename of the current file
alias -g EB='`ecb`'
# search for occurrences of the basename, which is likely a class in Java:
% glark EB **/*.java
```

Most recent is the `em` frontend. Inspired by `git`, `em` has subcommands that are delegated, and
works with Z shell completions:

```shell
# same as ec
% em open some/file.rb

# same as ecf
% em current-file

# same as ecd
% em current-directory

# alias for current-directory
% em pwd

# prints a list of the files currently in emacs:
% em files

# searches through all files currently in emacs:
% em glark tr.Ace.setVerbose

# searches through all Ruby files currently in emacs:
% em glark --match-name '\.rb$' 'def\s+initialize'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpace/zsh.

## License

This available as open source under the terms of the [MIT
license](http://opensource.org/licenses/MIT).
