#!/usr/bin/env nu
# load shell aliases based on OS and/or distro


# if (^ps --no-headers -o comm 1) == systemd {
const NU_INIT = if true {
	"systemd.nu"
}

# NU_OS = if (uname | get nodename) == "arch" {
const NU_OS = if $nu.os-info.name == "linux" {
	"arch.nu"
} else if $nu.os-info.name == "freebsd" {
	"freebsd.nu"
}

# const NU_GRAPHICAL = if $env.XDG_SESSION_TYPE == "wayland" {
const NU_GRAPHICAL = if true {
	"programs_wayland.nu"
} else if false {
	"programs_x11.nu"
}

source util.nu
source programs_posix.nu
source programs.nu
source $NU_INIT
source $NU_OS
source $NU_GRAPHICAL
source custom.nu

