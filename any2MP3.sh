#!/bin/bash
if [ "$#" -ne 6 ]; then
	echo "Usage: any2mp3.sh [-i|--input] [INPUTPATH] [-e|--ext] [EXTENSION] [-o|--output] [OUTPUTPATH]"
	exit -1
fi
while [[ $# > 1 ]]
do
key="$1"
case $key in
	-i|--input)
	INPUTPATH="$2"
	shift # past argument
	;;
	-e|--ext)
	EXTENSION="$2"
	shift # past argument
	;;
	-o|--output)
	OUTPUTPATH="$2"
	shift # past argument
	;;
	*)
	# unknown option
	;;
esac
shift # past argument or value
done
echo -------------------------------------------------------
echo INPUTPATH  = "${INPUTPATH}"
echo EXTENSION  = "${EXTENSION}"
echo OUTPUTPATH = "${OUTPUTPATH}"
echo -------------------------------------------------------
echo "Number files in INPUTPATH with EXTENSION:" $(ls -1 "${INPUTPATH}"/*."${EXTENSION}" | wc -l)
echo "ffmpeg -i " *.${EXTENSION} "-ar 44100 -ac 2 -aq 0 -f mp3 *.mp3"
echo -------------------------------------------------------
for a in "${INPUTPATH}"/*."${EXTENSION}"; do
	MP3INFULL="${a[@]/%${EXTENSION}/mp3}"
	MP3NAME="$(basename "${MP3INFULL}")"
	MP3OUTFULL="${OUTPUTPATH}"/"${MP3NAME}"
	echo "${a}" "==>" "${MP3OUTFULL}"
done
echo -------------------------------------------------------
read -p "Press any key to continue. Ctrl-C to break... " -n1 -s
echo
for a in "${INPUTPATH}"/*."${EXTENSION}"; do
	MP3INFULL="${a[@]/%${EXTENSION}/mp3}"
	MP3NAME="$(basename "${MP3INFULL}")"
	MP3OUTFULL="${OUTPUTPATH}"/"${MP3NAME}"
	ffmpeg -i "${a}" -ar 44100 -ac 2 -aq 0 -f mp3 "${MP3OUTFULL}"
done