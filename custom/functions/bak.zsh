#!/usr/bin/env zsh
function bak(){
    original=$1;
    cp -r $original $original.$(date +%d-%b-%Y).bak
}
