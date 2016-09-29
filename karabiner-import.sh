#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set private.remap.reverse_mouse_scroll 1
/bin/echo -n .
$cli set repeat.initial_wait 150
/bin/echo -n .
$cli set repeat.wait 20
/bin/echo -n .
/bin/echo
