#!/bin/bash

methods="
netrik
retawq
elinks
links
links2
w3m
lynx
"

function netrik() {
  $FUNCNAME $1
}
function retawq() {
  $FUNCNAME $1
}
function retawq() {
  $FUNCNAME $1
}
function elinks() {
  $FUNCNAME $1
}
function links() {
  $FUNCNAME $1
}
function links2() {
  $FUNCNAME $1
}
function w3m() {
  $FUNCNAME $1
}
function links() {
  $FUNCNAME $1
}

function take_screenshot {
  local url=$1
  local method=$2
  echo "Taking a screenshot of $url and rendered with $method"
  xterm -maximized -e "$method $url" &
  sleep .5s
  window_id=$(xdotool search --class xterm | head)
  import -window "$window_id" /tmp/screenshot.png
  filename=$(echo $url | cut -f 2 -d '/')
  convert /tmp/screenshot.png -trim -background Grey -gravity Center -pointsize 48 label:"Method: $method" +swap -append $filename.png
  killall xterm
}

function save_original {
  local url=$1
  #convert $input -trim -resize 600% -background Grey -gravity Center -pointsize 48 label:"Original" +swap -append $output
}

function make_screenshots {
  for url in $urls; do
    for method in $methods; do
      take_screenshot $method $url
    done
    save_original $url
  done
}

make_screenshots
