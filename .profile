
export GOCACHE="$HOME/.local/state/gocache"
export GOPATH="$HOME/.local/state/gopath"
export PATH="$PATH:/home/kin/.scripts/"
export PATH="$PATH:/home/kin/.cargo/bin"
export PATH="$PATH:$GOPATH/bin"
# export MANPAGER='nvim --server $NVIM --remote-send "<C-\><C-n>+Man!"'

pgrep startx &> /dev/null || startx &> /dev/null
