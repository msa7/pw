#!/usr/bin/env bash

test_description='Test command get.'
source "$(dirname "$0")"/setup-03.sh

test_expect_success 'Set a new password.' '
    "$PW" set test1 <<-_EOF
$PASSPHRASE
$PASS1
$PASS1
_EOF
'

test_expect_success 'Test get.' '
    "$PW" get test1 <<<"$PASSPHRASE" &&
    local pass1=$(xclip -selection clipboard -o) &&
    [[ $PASS1 == $pass1 ]]
'

test_expect_success 'Test that get is the default command.' '
    "$PW" test1 <<<"$PASSPHRASE" &&
    local pass1=$(xclip -selection clipboard -o) &&
    [[ $PASS1 == $pass1 ]]
'

test_done
