alias edit 'jed'
alias emacs '/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

alias ll 'ls -l'
alias tree 'tree -Csuh'

set -x EDITOR "code"
set -x TERMINFO /usr/share/terminfo

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

set -u fish_color_autosuggestion 006363
set -u fish_color_cancel -r
set -u fish_color_command 009999
set -u fish_color_comment FF9640
set -u fish_color_cwd green
set -u fish_color_cwd_root red
set -u fish_color_end FFB273
set -u fish_color_error FF7400
set -u fish_color_escape 'bryellow'  '--bold'
set -u fish_color_history_current --bold
set -u fish_color_host normal
set -u fish_color_match --background=brblue
set -u fish_color_normal normal
set -u fish_color_operator bryellow
set -u fish_color_param 33CCCC
set -u fish_color_quote 5CCCCC
set -u fish_color_redirection BF7130
set -u fish_color_search_match 'bryellow'  '--background=brblack'
set -u fish_color_selection 'white'  '--bold'  '--background=brblack'
set -u fish_color_status red
set -u fish_color_user brgreen
set -u fish_color_valid_path --underline
set -u fish_greeting 'Welcome to fish, the friendly interactive shell'
set -u fish_key_bindings fish_default_key_bindings
set -u fish_pager_color_completion
set -u fish_pager_color_description 'B3A06D'  'yellow'
set -u fish_pager_color_prefix 'white'  '--bold'  '--underline'
set -u fish_pager_color_progress 'brwhite'  '--background=cyan'
