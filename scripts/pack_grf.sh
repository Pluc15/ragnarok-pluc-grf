#!/bin/bash

basePath="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
scriptsPath="$basePath/scripts"
dataPath="$basePath/data"
srcPath="$basePath/src"
grfPath="$basePath/dist/pluc.grf"
wineBasePath="$(winepath -w "$basePath")"

debug () {
  echo "basePath: $basePath"
  echo "scriptsPath: $scriptsPath"
  echo "dataPath: $dataPath"
  echo "srcPath: $srcPath"
  echo "grfPath: $grfPath"
  echo "wineBasePath: $wineBasePath"
}

clean () {
  echo "=> Deleting old data directory"
  if [ -d "$dataPath" ]; then
      rm -rf "$dataPath"
  fi

  echo "=> Deleting old grf"
  if [ -f "$grfPath" ]; then
      rm -f "$grfPath"
  fi
}

prepDataFolder () {
  echo "=> Creating new data directory"
  mkdir -p "$dataPath"

  echo "=> Merging all the data folders"
  cp -r "$srcPath/audio"/* "$dataPath/"
  # cp -r "$srcPath/bg"/* "$dataPath/"
  # cp -r "$srcPath/big_geffenia"/* "$dataPath/"
  # cp -r "$srcPath/big_mvps"/* "$dataPath/"
  # cp -r "$srcPath/cursor"/* "$dataPath/"
  # cp -r "$srcPath/effect_hijacks"/* "$dataPath/"
  cp -r "$srcPath/effects"/* "$dataPath/"
  cp -r "$srcPath/grey_world"/* "$dataPath/"
  # cp -r "$srcPath/grey_world_towns"/* "$dataPath/"
  # cp -r "$srcPath/hide_headgears"/* "$dataPath/"
  cp -r "$srcPath/lgp"/* "$dataPath/"
  cp -r "$srcPath/maps_settings"/* "$dataPath/"
  cp -r "$srcPath/minimaps"/* "$dataPath/"
  # cp -r "$srcPath/override_skills_names"/* "$dataPath/"
  cp -r "$srcPath/remove_joke_scream"/* "$dataPath/"
  cp -r "$srcPath/remove_loading"/* "$dataPath/"
  cp -r "$srcPath/remove_manners"/* "$dataPath/"
  cp -r "$srcPath/remove_pets_messages"/* "$dataPath/"
  cp -r "$srcPath/square_under_cursor"/* "$dataPath/"
  cp -r "$srcPath/unknown"/* "$dataPath/"
  cp -r "$srcPath/woe_cades"/* "$dataPath/"
  # cp -r "$srcPath/woe_emp_flag"/* "$dataPath/"
}

pack () {
  echo "=> Packing the full grf"
  wineBasePath="$(winepath -w "$basePath")"
  wine "$wineBasePath\\scripts\\GrfCL.exe" \
    -breakOnExceptions true \
    -makeGrf "$wineBasePath\\dist\\pluc.grf" \
    "$wineBasePath\\data"
}

debug
# clean
# prepDataFolder
pack
