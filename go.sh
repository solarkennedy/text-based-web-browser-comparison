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
https://en.wikipedia.org/wiki/Rule_110
http://news.ycombinator.com
https://facebook.com
https://twitter.com
https://mail.google.com
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
  filename="outputs/$(echo $url | cut -f 3 -d '/') $method.png"
  if [[ -f "$filename" ]]; then return 0; fi
  echo "Taking a screenshot of $url and rendered with $method"
  set -vx
  xterm -geometry 140x40 -e "$method $url" &
  echo "Press enter when ready to take a screenshot"
  read GO
  window_id=$(xdotool search --class xterm | head -n 1)
  import -window "$window_id" /tmp/screenshot.png
  convert /tmp/screenshot.png -trim -background Grey -gravity Center -pointsize 24 label:"URL: $url Method: $method" +swap -append "$filename"
  killall xterm
}

function save_original {
	set -vx
  local url=$1
  filename="outputs/$(echo $url | cut -f 3 -d '/') original.png"
  if [[ -f "$filename" ]]; then return 0; fi
  surf "$url" &
  echo "Press enter when ready to take a screenshot"
  read GO
  window_id=$(xdotool search --class surf | tail -n 1)
  import -window "$window_id" /tmp/screenshot.png
  killall surf
  convert /tmp/screenshot.png -trim  -background Grey -gravity Center -pointsize 24 label:"URL: $url Method: surf" +swap -append "$filename"
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
