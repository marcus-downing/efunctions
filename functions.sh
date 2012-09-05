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

export -f 'efunctions_indent'

HERE=$(readlink -f $0)
DIR=$(dirname "$HERE")
FDIR="$DIR/efunctions"

export PATH="$PATH:$FDIR"

