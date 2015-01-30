#!/bin/sh
# Copyright (c) 2015 Marcus Downing <marcus.downing@gmail.com>
# Released under the 2-clause BSD license.

. /etc/init.d/functions.sh

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
. efunctions_ecolors
einfo "Colour is ${GOOD}good"
ewarn "Colour is ${WARN}alarming"
eerror "Colour is ${BAD}bad"
einfo "Colour is ${NORMAL}normal"
ewarn "Brackets are ${BRACKET}bracketty"
eerror "Text is ${HILITE}hilited"
