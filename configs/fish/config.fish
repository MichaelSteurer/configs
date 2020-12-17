alias edit 'jed'
alias emacs '/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

alias ll 'ls -l'
alias tree 'tree -Csuh'

set -x EDITOR "code"
set -x TERMINFO /usr/share/terminfo

set -x HOSTNAME (hostname)

set -x PATH $PATH "$HOME/bin"

set -x GOOGLE_CLOUD_SDK $HOME/bin/google-cloud-sdk
set -x PATH $PATH $GOOGLE_CLOUD_SDK/bin
set -x PATH $PATH $GOOGLE_CLOUD_SDK/platform/google_appengine
set -x CLOUDSDK_PYTHON "/usr/bin/python2.7"
#set -x GOOGLE_APPLICATION_CREDENTIALS $HOME/application_default_credentials.json
#set -x PATH $GOOGLE_APPLICATION_CREDENTIALS $PATH

alias git 'env LANG=en_GB git'

set -x GOPATH ""
set -x GOPATH $GOPATH "$HOME/go"

set -x PYTHONPATH ""

set -g CONDA_ROOT "$HOME/bin/miniconda3"
set -x PATH "$CONDA_ROOT/bin" $PATH 

source "$CONDA_ROOT/etc/fish/conf.d/conda.fish"

# /$HOME/google-cloud-sdk/path.bash.inc
if [ -f '$GOOGLE_CLOUD_SDK/path.fish.inc' ]
    if type source >/dev/null
        source '$GOOGLE_CLOUD_SDK/path.fish.inc'
    else
        . '$GOOGLE_CLOUD_SDK/path.fish.inc'
    end
end

# /$HOME/google-cloud-sdk/completion.bash.inc
if [ -f '$GOOGLE_CLOUD_SDK/completion.bash.inc' ]
    if type source >/dev/null
        source '$GOOGLE_CLOUD_SDK/completion.fish.inc'
    else
        . '$GOOGLE_CLOUD_SDK/completion.fish.inc'
    end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/msteurer/bin/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

