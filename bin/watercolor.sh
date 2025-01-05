#! /bin/bash
IFS=$'\#'
for f in "$@"  ; do
#превращает фото в акварель, если не менять цифры - будут настройки по умолчанию. 
#RU: watercolor  [-s сглаживание] [-e край] [-m смешивание] [-c контраст] infile outfile
#EN: watercolor [-s smoothing] [-e edge] [-m mixing] [-c contrast] infile outfile
smoothing=`zenity --entry --title="Сглаживание" --text=" 0 5 10 15 20 25" --entry-text="0"`
edge=`zenity --entry --title="Край" --text="5 10 15" --entry-text="5"`
mixing=`zenity --entry --title="Смешивание" --text=" 33 50 60 70" --entry-text="33"`
contrast=`zenity --entry --title="Контраст" --text=" 0 5 10 15 20" --entry-text="0"`
watercolor -s $smoothing -e $edge -m $mixing -c $contrast "$f" watercolor_"$f" ; done