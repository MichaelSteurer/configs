alias edit 'jed'
alias emacs '/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

alias ll 'ls -l'
alias tree 'tree -Csuh'

set -x EDITOR "code"

set -x PATH "$HOME/bin" $PATH
set -x PATH /anaconda3/bin $PATH

set -x GOOGLE_CLOUD_SDK $HOME/google-cloud-sdk
set -x PATH $GOOGLE_CLOUD_SDK/bin $PATH
set -x PATH $GOOGLE_CLOUD_SDK/platform/google_appengine $PATH
set -x CLOUDSDK_PYTHON "/usr/bin/python2.7"
#set -x GOOGLE_APPLICATION_CREDENTIALS $HOME/application_default_credentials.json
#set -x PATH $GOOGLE_APPLICATION_CREDENTIALS $PATH

set -x GOROOT $GOROOT ""
#set -x GOROOT $GOROOT /usr/local/go/bin/go/

set -x GOPATH $GOPATH "$HOME/go"

set -x PYTHONPATH $PYTHONPATH ""

source /anaconda3/etc/fish/conf.d/conda.fish 

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
