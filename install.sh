#!/bin/bash
# Copyright (c) 2015 Marcus Downing <marcus.downing@gmail.com>
# Released under the 2-clause BSD license.

# http://stackoverflow.com/questions/1055671/how-can-i-get-the-behavior-of-gnus-readlink-f-on-a-mac
function abspath {

  if readlink -f "$1" 2>&1 | grep -q 'readlink: illegal option -- f'; then
    TARGET_FILE="$1"

    cd `dirname $TARGET_FILE`

    TARGET_FILE=`basename $TARGET_FILE`

    # Iterate down a (possible) chain of symlinks
    while [ -L "$TARGET_FILE" ]
    do
      TARGET_FILE=`readlink $TARGET_FILE`
      cd `dirname $TARGET_FILE`
      TARGET_FILE=`basename $TARGET_FILE`
    done

    # Compute the canonicalized name by finding the physical path
    # for the directory we're in and appending the target file.
    PHYS_DIR=`pwd -P`
    RESULT=$PHYS_DIR/$TARGET_FILE
  else
    RESULT=$(readlink -f "$1")
  fi

  echo $RESULT
}

#HERE=$(readlink -f "$0")
HERE=$(abspath "$0")
DIR=$(dirname "$HERE")
SCRIPT="$DIR/functions.sh"

source "$SCRIPT"

if [ -f /etc/init.d/functions.sh ]; then
  "$DIR/efunctions/eerror" "Cannot install efunctions: file already exists"
  exit
fi

if [ ! -d /etc/init.d ]; then
  sudo mkdir -p /etc/init.d
fi

"$DIR/efunctions/einfo" "Installing $SCRIPT into /etc/init.d"
sudo ln -s "$SCRIPT" /etc/init.d/functions.sh
