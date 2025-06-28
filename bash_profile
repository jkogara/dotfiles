#!/usr/bin/env bash

# Don't check mail when opening terminal.
unset MAILCHECK

[[ -s ~/.bashrc ]] && source ~/.bashrc

export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
. "$HOME/.cargo/env"

if [ $(hostname) == "jono120-amd-9700" ]; then
	ddcutil -d 2 setvcp 10 80
fi
