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

abspath()
{
  case $OSTYPE in
    darwin*)
      readlink "$1"
      ;;
    *)
      readlink -f "$1"
      ;;
  esac
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
