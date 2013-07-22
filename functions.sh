# Replicates Gentoo's functions.sh in a portable way
# Obviously the borrow heavily from the original rc script
# written by Roy Marples

eindent()
{
  EINFO_INDENT=$((${EINFO_INDENT:-0} + 2))
  if [ "$EINFO_INDENT" -gt 40 ] ; then EINFO_INDENT=40; fi
  export EINFO_INDENT
}

eoutdent()
{
  EINFO_INDENT=$((${EINFO_INDENT:-0} - 2))
  if [ "$EINFO_INDENT" -lt 0 ] ; then EINFO_INDENT=0; fi
  export EINFO_INDENT
}

efunctions_indent()
{
  EINFO_INDENT=${EINFO_INDENT:-0}
  for I in `seq 1 $EINFO_INDENT`
  do
    echo -n " "
  done
}

# http://stackoverflow.com/questions/1055671/how-can-i-get-the-behavior-of-gnus-readlink-f-on-a-mac
function abspath {

  if readlink -f $0 2>&1 | grep -q 'readlink: illegal option -- f'; then
    TARGET_FILE=$1

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
    RESULT=$(readlink -f $1)
  fi

  echo $RESULT
}

export -f 'efunctions_indent'

#HERE=$(readlink -f "${BASH_SOURCE[0]}")
HERE=$(abspath "${BASH_SOURCE[0]}")
DIR=$(dirname "$HERE")
FDIR="$DIR/efunctions"

export PATH="$PATH:$FDIR"

if [ -z "$TERMINFO" ]; then
  export TERMINFO=$(whereis terminfo | grep -o '^[^ ]* [^ ]*' | grep -o '[^ ]*$')
fi
