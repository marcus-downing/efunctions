HERE=$(readlink -f "$0")
DIR=$(dirname "$HERE")
SCRIPT="$DIR/functions.sh"
echo "Installing $SCRIPT into /etc/init.d"
sudo ln -s "$SCRIPT" /etc/init.d/functions.sh
