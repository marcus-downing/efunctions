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

#HERE=$(readlink -f "$0")
HERE=$(abspath "$0")
DIR=$(dirname "$HERE")
SCRIPT="$DIR/functions.sh"

source "$SCRIPT"

if [ -f /etc/init.d/functions.sh ]; then
  "$DIR/efunctions/eerror" "Cannot install efunctions: file already exists"
  exit
fi

"$DIR/efunctions/einfo" "Installing $SCRIPT into /etc/init.d"
sudo ln -s "$SCRIPT" /etc/init.d/functions.sh
