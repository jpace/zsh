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

# change to the most recent directory:
% ls D

# open the most recent file (see separate entry for "o")
% o F

alias -g S='| sort'
alias -g SN='| sort -n'

# sort names:
% find -name \*.rb S

# sort by file length:
% wc **/*.rb SN

# Prepend line numbers to each line:
alias -g LN='| awk "{print FNR \" \" \$0 }"'
% find -type f LN

# mix them; prepend line numbers to the files under the most recent directory, sorted:
% find D -type f S LN
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpace/zsh.

## License

The is available as open source under the terms of the [MIT
license](http://opensource.org/licenses/MIT).
