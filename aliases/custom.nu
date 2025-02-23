#!/usr/bin/env sh
# custom aliases and functions go here

# search aliases (TODO: replace with zoxide)
alias lspaths = fd -HI --ignore-file ~/.config/fd/ignore_file;
# alias s = ^(lspaths | fzf --reverse --info=inline --preview='pistol {}');
# alias se = ^$env.EDITOR "(s --header='Edit File')";
# alias sv = ^$env.VISUAL "(s --header='Edit File')";
# alias sd = cd "(s --header='Search Directory')";
# alias so = ^$env.OPENER (s --header='Open File');
# alias sr = ^$env.READER (fd -I -t 'f' '.' $env.READING | sed 's|READING\/||' | fzf --reverse --info=inline --preview='pdftotext READING/{}' --header='Select Reading' | sed 's|^|READING\/|');
# alias srb = $env.READER \"(cat \"$env.READING\"/books/list.txt | fzf --reverse --info=inline --preview=\"pdftotext READING/{}\" --header='Select from Books Reading List' | sed \"s|^|READING\/books\/|\")\";
# alias srp = READER \"(cat \"READING\"/papers/list.txt | fzf --reverse --info=inline --header='Select from Papers Reading List' | sed \"s|^|READING\/papers\/|\")\";

# history aliases
alias h = history;
# alias hg = h | grep;
# hs="h | fzf --tac --info=inline --header='Search Command' | sed 's/^[0-9]*\s*//g'" \
# hi="xdotool type --delay 0 \"\$(hs)\" && clear";

# sg() {
# 	RES="$(s --header='Grep File')";
# 	grep "$1" "$RES";
# }

