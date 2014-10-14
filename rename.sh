#! /bin/bash
#
# dependencies: inkscape & imagemagick
#

################################################
# current dir
################################################
DIR=$(cd $(dirname $0) && pwd)

################################################
# suppport cli params
################################################
target_dir=
surfix=
replace=

while getopts s:d:r: opt; do
  case $opt in
  s)
    surfix=$OPTARG
    ;;
  d)
    target_dir=$OPTARG
    ;;
  r)
    replace=$OPTARG
    ;;
  esac
done

: ${target_dir:=""}
: ${surfix:=""}
: ${replace:=""}

################################################
# read input dir
################################################

for file in ${target_dir%%/}/*.png; do
  filename=$(basename $file)
  extension="${filename##*.}"
  filename="${filename%.*}"
  filename="${filename//-/_}"
  filename="${filename//$replace/}"
  foldername=$(dirname $file)

  dot="."
  output_dir="${foldername%%/}/$filename$surfix$dot$extension"

  echo "mv $file $output_dir"
  $(mv $file $output_dir)

done

# ./rename.sh -d /Volumes/iMac/workspace/android/resources/material-polymer-icons/svg
