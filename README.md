efunctions
==========

Port of Gentoo's functions.sh to other *nixes.

Gentoo provides a number of functions for providing feedback on scripts and services. This is a port of those functions to other linuxes such as Ubuntu, so that scripts continue to work.

## Commands

### einfo, ewarn, eerror

Output a message prefixed with a green, yellow or red asterisk.

```sh
einfo "Stuff happens"
ewarn "Dangerous stuff happens"
eerror "Oh noes!"
```

```
 * Some message
 * Dangerous stuff happens
 * Oh noes!
```

(GitHub-flavour markdown doesn't support colours...)

### einfon, ewarnn, eerrorn

The same as above, but without the newline at the end of each.

```sh
einfo "Stuff happens"
ewarn "Dangerous stuff happens"
eerror "Oh noes!"
```

```
 * Some message * Dangerous stuff happens * Oh noes!
```

### ebegin, eend

**ebegin** outputs a message like einfo, with a trailing ellipsis ...

**eend** appends a good or bad message to the previous line. It's often called with `$?`, a variable representing the return value of the last command

```sh
ebegin Rejigging the squinks
somecommand
eend $?
```

```
 * Rejigging the squinks...                                              [ ok ]
```

### eindent, eoutdent

Increase or decrease the indent on subsequent messages.

```sh
einfo "Doing three things"
eindent

ebegin "First thing"
firstcommand
eend $?

ebegin "Second thing"
secondcommand
eend $?

ebegin "Third thing"
thirdcommand
eend $?

eoutdent
```

```
 * Doing three things
   * First thing...                                                      [ ok ]
   * Second thing...                                                     [ ok ]
   * Third thing...                                                      [ ok ]
```

### eval_ecolors

Evaluate this to get access to the colours it uses.

```sh
eval $(eval_ecolors)
echo "$GOOD green $WARN yellow $BAD red"
```

```
 green  yellow  red
```

## Non-standard commands

The following commands aren't part of the traditional package, but they're useful so I've added them anyway.

### eprefix

Prefixes stdin with the current indent.

```sh
eindent
eindent
eindent
somecommand | eprefix
```

```
       Command output, prefixed with spaces
```

If you also add the word *info*, *warn* or *error*, it'll prefix stdin with the appropriate asterisk.

```sh
eindent
eindent
eindent
somecommand | eprefix info
```

```
       * Command output, prefixed with spaces and an asterisk
```