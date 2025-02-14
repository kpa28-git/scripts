#!/bin/sh
# program and web api aliases

# misc programs
alias i="btop" \
	mpv="mpv --input-ipc-server=/tmp/mpvsoc\$(date +%s)" \
	ytd="youtube-dl --add-metadata -i -o '\$HOME/Downloads/%(upload_date)s-%(title)s.%(ext)s'" \
	ytda="youtube-dl --add-metadata -i -x -f 'bestaudio/best' -o '\$HOME/Music/%(upload_date)s-%(title)s.%(ext)s'" \
	ffmpeg="ffmpeg -hide_banner" \
	dt="dust" \
	dt3="dt -d 3" \
	appsync="rsync -avxP" \
	mirsync="rsync -avxP --delete" \
	shck="shellcheck" \
	viewdoc="fzf --sync | pandoc -f docx -t pdf | zathura -" \
	vd="vidir" \
	wget="curl -OL" \
	pwi="sudo powertop" \
	nv="nvidia-smi" \
	nvw="watch2 nv" \
	nvi="nvtop" \
	arpall="arp-scan --localnet" \
	renamer="fd --type f | vidir -" \
	renamedr="fd --type d | vidir -" \
	rmempty="rm -d $(fd --type empty --type d)" \
	sprintservice="sudo systemctl start cups.service" \
	jp="julia --project" \
	jpo="julia --project --optimize=3" \
	jpt="julia --project --threads=auto" \
	jpto="julia --project --threads=auto --optimize=3" \
	jn="julia -e \"using Revise, Pluto; Pluto.run()\"" \
	jnt="julia --threads=auto -e \"using Revise, Pluto; Pluto.run(threads=Threads.nthreads())\"" \
	jnt2="julia --threads=auto -e \"using Revise, Pluto; Pluto.run(threads=2*Threads.nthreads())\"";
	# jup="jupyter notebook --ip=127.0.0.1 --port=8888" \

alias gst="git status" \
	gsb="git status -sb" \
	gss="git status -s" \
	gd="git diff --color" \
	gds="gd \$(gss | awk '{print \$NF}' | fzf --reverse --info=inline --preview='git diff --color {}' --header 'git diff file')" \
	gdc="gd --cached" \
	gdcs="gd --cached \$(gss | awk '{print \$NF}' | fzf --reverse --info=inline --preview='git diff --color --cached {}' --header 'git diff cached (staged) file changes')" \
	gdh="gd HEAD" \
	gdhs="gd HEAD \$(gss | awk '{print \$NF}' | fzf --reverse --info=inline --preview='git diff --color HEAD {}' --header 'git diff changes compared to HEAD')" \
	gc="git clone" \
	glsc="git log" \
	glsb="git branch -a" \
	glsf="git ls-tree --full-tree -r --name-only HEAD" \
	gl="git pull" \
	gp="git push" \
	gulp="git submodule foreach git pull origin master" \
	ga="git add" \
	gas="git add \$(gss | awk '{print \$NF}' | fzf --multi --reverse --info=inline --preview='git diff --color {}' --header 'git add files, use shift+Tab to multiselect')" \
	gr="git remote" \
	grm="git rm" \
	gcsmg="git commit -m" \
	gcmsg="git commit -m" \
	gcmsga="git commit --amend" \
	gua="git remote | xargs -L1 git push --all" \
	glp="git pull && git push" \
	gsave="git stash" \
	gload="git stash pop" \
	ghtest="ssh -T git@github.com" \
	gltest="ssh -T git@gitlab.com";

alias gpglspub="gpg --list-keys" \
	gpglssec="gpg --list-secret-keys --keyid-format LONG" \
	gpggen="gpg --full-generate-key" \
	gpgimp="gpg --import";

alias cg="conda list | grep" \
	cq="conda search --info" \
	cls="conda list" \
	car="conda activate" \
	cdr="conda deactivate" \
	cup="conda update conda pip" \
	cua="conda update --all" \
	crm="conda remove" \
	ccl="conda clean --yes --all";

alias tdd="trash put" \
	tls="trash list" \
	tre="trash list | fzf --reverse --header='Restore File(s)' --multi | awk '{\$1=\$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash restore --match=exact --force" \
	trm="trash list | fzf --reverse --header='Delete File(s)' --multi | awk '{\$1=\$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash empty --match=exact --force" \
	tem="trash empty --all";

alias coinp="curl -s rate.sx" \
	adap="curl -s rate.sx/ada" \
	btcp="curl -s rate.sx/btc" \
	ethp="curl -s rate.sx/eth";

alias trls="transmission-remote -l" \
	trad="transmission-remote -a";

alias chstat="clickhouse status" \
	chstop="clickhouse stop" \
	chrestart="clickhouse restart";

alias aid="aider --env $XDG_CONFIG_HOME/api-keys/llm.env";
