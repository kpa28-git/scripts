#!/usr/bin/env nu

def 'is-installed' [ cmd: string ] { not (which $cmd | is-empty) }

