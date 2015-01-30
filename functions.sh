#!/bin/sh
# Copyright (c) 2015 Marcus Downing <marcus.downing@gmail.com>
# Released under the 2-clause BSD license.

# Replicates Gentoo's functions.sh in a portable way
# Obviously borrow heavily from the original rc script
# written by Roy Marples

eindent() {
  . "$EFUNCTIONS_DIR/eindent"
}

eoutdent() {
  . "$EFUNCTIONS_DIR/eoutdent"
}

# http://stackoverflow.com/questions/1055671/how-can-i-get-the-behavior-of-gnus-readlink-f-on-a-mac
abspath() {
  if readlink -f "$1" 2>&1 | grep -q 'readlink: illegal option -- f'; then
    TARGET_FILE="$1"

    cd `dirname "$TARGET_FILE"`

    TARGET_FILE=`basename "$TARGET_FILE"`

    # Iterate down a (possible) chain of symlinks
    while [ -L "$TARGET_FILE" ]
    do
      TARGET_FILE="`readlink "$TARGET_FILE"`"
      cd "`dirname "$TARGET_FILE"`"
      TARGET_FILE="`basename "$TARGET_FILE"`"
    done

    # Compute the canonicalized name by finding the physical path
    # for the directory we're in and appending the target file.
    PHYS_DIR="`pwd -P`"
    RESULT="$PHYS_DIR/$TARGET_FILE"
  else
    RESULT="$(readlink -f "$1")"
  fi

  echo $RESULT
}

if [ -x "/etc/init.d/functions.sh" ]; then
  HERE="$(abspath "/etc/init.d/functions.sh")"
else
  HERE="$(abspath "$0")"
fi
DIR="$(dirname "$HERE")"
export EFUNCTIONS_DIR="$DIR/efunctions"
export PATH="$PATH:$EFUNCTIONS_DIR"

if [ -n "$TERM" ] && [ "$TERM" = unknown ] ; then
  export TERM=dumb
fi

if [ -z "$TERMINFO" ]; then
  export TERMINFO=$(whereis terminfo | grep -o '^[^ ]* [^ ]*' | grep -o '[^ ]*$')
fi
