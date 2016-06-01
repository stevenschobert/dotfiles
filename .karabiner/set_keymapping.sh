#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set remap.consumer_to_fkeys_f5 1
/bin/echo -n .
$cli set remap.consumer_to_fkeys_f1 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f5 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f1 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f10 1
/bin/echo -n .
$cli set remap.consumer_to_fkeys_f10 1
/bin/echo -n .
$cli set repeat.wait 25
/bin/echo -n .
$cli set remap.consumer_to_fkeys_f7 1
/bin/echo -n .
$cli set remap.consumer_to_fkeys_f3 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f3_lion 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f7 1
/bin/echo -n .
$cli set remap.fnletter_to_ctrlletter 1
/bin/echo -n .
/bin/echo
