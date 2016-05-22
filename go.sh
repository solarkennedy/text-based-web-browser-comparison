#!/bin/bash
set -eu

methods="
retawq
elinks
links2
w3m
lynx
"

urls="
http://www.google.com
http://news.ycombinator.com
"

function retawq() {
  $FUNCNAME $1
}
function elinks() {
  $FUNCNAME $1
}
function links2() {
  $FUNCNAME $1
}
function w3m() {
  $FUNCNAME $1
}
function lynx() {
  $FUNCNAME $1
}

function take_screenshot {
  local method=$1
  local url=$2
  echo "Taking a screenshot of $url and rendered with $method"
  set -vx
  xterm -geometry 100x24 -e "$method $url" &
  read TEST
  #sleep 30s
  window_id=$(xdotool search --class xterm | head)
  import -window "$window_id" /tmp/screenshot.png
  filename="$(echo $url | cut -f 3 -d '/') $method.png"
  convert /tmp/screenshot.png -trim -background Grey -gravity Center -pointsize 48 label:"Method: $method" +swap -append "outputs/$filename"
  killall xterm
}

function save_original {
  local url=$1
  filename="$(echo $url | cut -f 3 -d '/') $original.png"
  phantomjs screenshot.js "$url" /tmp/original.png 640 480
  convert /tmp/original -trim  -background Grey -gravity Center -pointsize 48 label:"Original" +swap -append outputs/$filename
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
