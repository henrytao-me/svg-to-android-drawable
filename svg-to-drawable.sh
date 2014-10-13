#! /bin/bash
#
# dependencies: inkscape & imagemagick
#

################################################
# current dir
################################################
DIR=$(cd $(dirname $0) && pwd)
INKSCAPE_DIR="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"

################################################
# suppport cli params
################################################
inkscape_size=
inkscape_width=
inkscape_height=
inkscape_dpi=
inkscape_input=
inkscape_output=
output_prefix=
color=

while getopts s:w:h:d:i:o:p:c: opt; do
  case $opt in
  s)
    inkscape_size=$OPTARG
    ;;
  w)
    inkscape_width=$OPTARG
    ;;
  h)
    inkscape_height=$OPTARG
    ;;
  d)
    inkscape_dpi=$OPTARG
    ;;
  i)
    inkscape_input=$OPTARG
    ;;
  o)
    inkscape_output=$OPTARG
    ;;
  p)
    output_prefix=$OPTARG
    ;;
  c)
    color=$OPTARG
    ;;
  esac
done

: ${inkscape_size:=512}
: ${inkscape_width:=$inkscape_size}
: ${inkscape_height:=$inkscape_size}
: ${inkscape_dpi:=300}
: ${inkscape_input:=$DIR}
: ${inkscape_output:=$DIR}
: ${output_prefix:=""}
: ${color:="#cccccc"}

################################################
# read input dir
################################################
for file in ${inkscape_input%%/}/*.svg; do
  filename=$(basename $file)
  extension="${filename##*.}"
  filename="${filename%.*}"
  filename="${filename//-/_}"
  output_dir="${inkscape_output%%/}/$output_prefix$filename.png"
  
  $($INKSCAPE_DIR $file -e $output_dir -w $inkscape_width -h $inkscape_height)
  # echo "$INKSCAPE_DIR $file -e $output_dir -w $inkscape_width -h $inkscape_height"

  # $(convert $output_dir -fuzz 10% -fill \"$color\" -opaque black -format png $output_dir)
  # echo "convert $output_dir -fuzz 100% -fill \"$color\" -opaque black -verbose $output_dir"
done

# ./svg-to-drawable.sh -s 512 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/origin/max
# ./svg-to-drawable.sh -s 96 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/origin/drawable-xxhdpi
# ./svg-to-drawable.sh -s 64 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/origin/drawable-xhdpi
# ./svg-to-drawable.sh -s 48 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/origin/drawable-hdpi
# ./svg-to-drawable.sh -s 32 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/origin/drawable-mdpi

# ./svg-to-drawable.sh -s 192 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/2x-origin/drawable-xxhdpi
# ./svg-to-drawable.sh -s 128 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/2x-origin/drawable-xhdpi
# ./svg-to-drawable.sh -s 96 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/2x-origin/drawable-hdpi
# ./svg-to-drawable.sh -s 64 -p "ic_action_" -i /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg -o /Volumes/iMac/workspace/android/resources/material-polymer-icons/2x-origin/drawable-mdpi


