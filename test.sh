source /etc/init.d/functions.sh
einfo "Foo"
eindent
ewarn "Bar"
eoutdent
eerror "Qux"

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

echo ""
eval_ecolors
