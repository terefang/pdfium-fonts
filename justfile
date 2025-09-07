#!/usr/bin/env -S just --justfile
#
#

XARCH := arch()+"-"+os()
XDIR := justfile_directory()
XDIST := XDIR+"/dist"
XSRC := XDIR+"/source"

build:
    #!/bin/sh
    for x in pfb ttf otf; do mkdir -p {{XDIST}}/$x; done
    for x in {{XSRC}}/*.sfd; do
        f=$(basename $x .sfd)
        for y in pfb ttf otf; do
             ~/bin/ttf2pfb.sh $x {{XDIST}}/$y/$f.$y
        done
    done
