#!/usr/bin/env bash
#Bash script to convert .m4a files in a directory to MP3
#MIT License
#Copyright (c) 2019 HP Dietz

set -e

readonly VERSION='1.0.0'
readonly DEPENDENCIES=('ffmpeg')
readonly ARGS="${@}"

checkDependencies() {
  for dep in ${DEPENDENCIES[@]}
  do
    command -v ${dep} > /dev/null 2>&1 || (echo "Missing required dependency ${dep}. Please make sure it is installed on your system." >&2 && exit 1)
  done
}

usage() {
  cat <<-EOF
  ${0} [-hv] [dir]
  Convert m4a files in dir to mp3.
EOF
}

version() {
  echo "m4a2mp3 v${VERSION}"
}

convert() {
  local filename="${1##*/}"
  local basename="${filename%.m4a}"
  ffmpeg "${directory}${basename}.mp3" -i "${directory}${filename}" -codec:a libmp3lame -qscale:a 1
}

main() {
  local arg
  for arg
  do
    case "${arg}" in
      --help)    args="${args}-h " ;;
      --version) args="${args}-v " ;;
      *)         args="${args} ${arg} " ;;
    esac
  done

  eval set -- ${args}

  while getopts "hv" OPTION;
  do
    case ${OPTION} in
      h)
        usage
        exit 0
        ;;
      v)
        version
        exit 0
        ;;
    esac
  done

  shift $((OPTIND-1))
  local directory="${@:-./}"
  if ! [ -d "${directory}" ]; then
    echo "Directory ${directory} does not exist." >&2
    exit 1
  fi

  readonly files=$(find "$directory" -maxdepth 1 -type f -regextype posix-extended -regex ".*\.m4a$")
  IFSbkp="${IFS}"
  IFS=$'\n'

  if [ ${#files} -eq 0 ]; then
    echo "No m4a files found in ${directory}."
    exit 0
  fi

  for path in ${files};
  do
    echo ${path}
    convert "${path}"
  done

  IFS="${IFSbkp}"

  echo "Done."
}

checkDependencies
main ${ARGS}
