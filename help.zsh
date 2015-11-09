autoload -U run-help

# So sudo ls <alt-h> shows "man ls", not "man sudo":
autoload run-help-sudo

# So git log <alt-h> shows "man git log", not "man git":
autoload run-help-git

# So svn merge <alt-h> shows "man svn merge", not "man svn":
autoload run-help-svn
