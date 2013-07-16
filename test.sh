source /etc/init.d/functions.sh
einfo "Foo"
einfo Spaces rock
eindent
ewarn "Bar"
ewarn Spaces rock
eoutdent
eerror "Qux"
eerror Spaces rock

echo ""
ebegin "Ged"
eend 0
eindent
ebegin "Mog"
eend 1
ebegin "Nib"
eindent
eend 1 "Fail!"
eoutdent
ebegin "Kaa"
eindent
ewend 1 "Provisos"
eoutdent
eoutdent
ebegin Spaces rock
eend 1 Yes indeedy!

echo ""
eval_ecolors
