#!/usr/bin/env nu
# program and web api aliases

# misc
alias i = btop;
# alias mpv = mpv --input-ipc-server=/tmp/mpvsoc\$(date +%s);
alias ytd = youtube-dl --add-metadata -i -o '\$HOME/Downloads/%(upload_date)s-%(title)s.%(ext)s';
alias ytda = youtube-dl --add-metadata -i -x -f 'bestaudio/best' -o '\$HOME/Music/%(upload_date)s-%(title)s.%(ext)s';
alias ffmpeg = ffmpeg -hide_banner;
alias dt = dust;
alias dt3 = dt -d 3;
alias appsync = rsync -avxP;
alias mirsync = rsync -avxP --delete;
alias shck = shellcheck;
alias viewdoc = fzf --sync | pandoc -f docx -t pdf | zathura -;
alias vd = vidir;
alias wget = curl -OL;
alias pwi = sudo powertop;
alias nv = nvidia-smi;
alias nvw = watch2 nv;
alias nvi = nvtop;
alias arpall = arp-scan --localnet;
alias renamer = fd --type f | vidir -;
alias renamedr = fd --type d | vidir -;
alias rmempty = rm --trash (fd --type empty --type d);
alias sprintservice = sudo systemctl start cups.service;
alias trls = transmission-remote -l;
alias trad = transmission-remote -a;
alias aid = aider --env $env.XDG_CONFIG_HOME/api-keys/llm.env;

# julia
alias jp = julia --project;
alias jpo = julia --project --optimize=3;
alias jpt = julia --project --threads=auto;
alias jpto = julia --project --threads=auto --optimize=3;
alias jn = julia -e "using Revise, Pluto; Pluto.run()";
alias jnt = julia --threads=auto -e "using Revise, Pluto; Pluto.run(threads = Threads.nthreads())";
alias jnt2 = julia --threads=auto -e "using Revise, Pluto; Pluto.run(threads = 2*Threads.nthreads())";
# alias jup = "jupyter notebook --ip = 127.0.0.1 --port = 8888" \

# git
alias gst = git status;
alias gsb = git status -sb;
alias gss = git status -s;
alias gd = git diff --color;
alias gds = gd (gss | awk '{print;$NF}' | fzf --reverse --info=inline --preview='git diff --color {}' --header='git diff file');
alias gdc = gd --cached;
alias gdcs = gd --cached (gss | awk '{print;$NF}' | fzf --reverse --info=inline --preview='git diff --color --cached {}' --header='git diff cached (staged) file changes');
alias gdh = gd HEAD;
alias gdhs = gd HEAD (gss | awk '{print;$NF}' | fzf --reverse --info=inline --preview='git diff --color HEAD {}' --header='git diff changes compared to HEAD');
alias gc = git clone;
alias glsc = git log;
alias glsb = git branch -a;
alias glsf = git ls-tree --full-tree -r --name-only HEAD;
alias gl = git pull;
alias gp = git push;
alias gulp = git submodule foreach git pull origin master;
alias ga = git add;
# alias gas = ;
alias gr = git remote;
alias grm = git rm;
alias gcsmg = git commit -m;
alias gcmsg = git commit -m;
alias gcmsga = git commit --amend;
alias gsave = git stash;
alias gload = git stash pop;
alias ghtest = ssh -T git@github.com;
alias gltest = ssh -T git@gitlab.com;
def gas [] { git add (gss | awk '{print $NF}' | fzf --multi --reverse --info=inline --preview='git diff --color {}' --header='git add files, use shift+Tab to multiselect'); } # TODO Fix for multiselect
def gua [] { git remote | xargs -L1 git push --all; }
def glp [] { git pull; git push; }

# gpg
alias gpglspub = gpg --list-keys;
alias gpglssec = gpg --list-secret-keys --keyid-format LONG;
alias gpggen = gpg --full-generate-key;
alias gpgimp = gpg --import;

# conda
alias cq = conda search --info;
alias cls = conda list;
alias car = conda activate;
alias cdr = conda deactivate;
alias cup = conda update conda pip;
alias cua = conda update --all;
alias crm = conda remove;
alias ccl = conda clean --yes --all;
def cg [pkg] { conda list | grep $pkg; }

# uv
alias uvpyls = uv python list;
alias uvpipls = uv pip list;
alias uvpiptree = uv pip tree;

# trashy
alias tdd = trashy put;
alias tls = trashy list;
alias tem = trashy empty --all;
# def tre [] { trash list | fzf --reverse --header='Restore File(s)' --multi | awk '{\$1=\$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash restore --match=exact --force; }
# def trm [] { trash list | fzf --reverse --header='Delete File(s)' --multi | awk '{\$1=\$1;print}' | rev | cut -d ' ' -f1 | rev | xargs trash empty --match=exact --force; }

# rate.sx
alias coinp = curl -s rate.sx;
alias adap = curl -s rate.sx/ada;
alias btcp = curl -s rate.sx/btc;
alias ethp = curl -s rate.sx/eth;

