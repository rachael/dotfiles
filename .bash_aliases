#!/bin/bash

# cd
alias ..="cd .."

# ls
alias ls="ls -AFG"
alias ll="ls -lthAFG"
alias la="ls -lhAFG"

#macOS
alias addspacer="defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}' && killall Dock"
