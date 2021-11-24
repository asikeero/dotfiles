#  _               _              _ _                     
# | |__   __ _ ___| |__      __ _| (_) __ _ ___  ___  ___ 
# | '_ \ / _` / __| '_ \    / _` | | |/ _` / __|/ _ \/ __|
# | |_) | (_| \__ \ | | |  | (_| | | | (_| \__ \  __/\__ \
# |_.__/ \__,_|___/_| |_|   \__,_|_|_|\__,_|___/\___||___/


# Custom defined aliases for bash
alias python="python3"
alias rm='rm -i'

# Custom settings
# disable input hang when pressing Ctrl+s
stty -ixon

# Custom functions

# combine cd and ls
cdls(){
    cd "$@" && ls;
}

# write to beginning of file
writetop(){
    local file=${1:?Specify filename as first argument}
    local text=${2:?Specify input text as second argument}
    echo "$text" >> tempfile.txt

    if [ -f "$file" ]; then
        cat "$file" >> tempfile.txt
    fi

    mv tempfile.txt "$file"
}

# git add, commit and push
git_acp(){
    git add .
    git commit -m @1
    git push
}
