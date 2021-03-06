#!/usr/bin/env bash

# a simple way to fill the xclipboard or paste from it,
# to push content between a terminal and gui programs

# when there is something 'non-tty' on fd 0, i.e. stdin,
# then assume we are receiving content and put it into clipboard
# otherwise output what is currently inside

if iscommand xclip; then

  clipboard() {

    if [[  $1 == out || -t 0 ]]; then
      xclip -selection clipboard -out
    else
      xclip -selection clipboard -in
    fi

  };

  if ! iscommand cb; then
    alias cb=clipboard
  fi

  argumentorclipboard() {

    if [[ -n $* ]]; then
      printf '%s\n' "$*";
    else
      clipboard out
    fi

  };

fi
