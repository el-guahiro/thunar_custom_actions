#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
OPTION1=$(zenity --list --radiolist  --width 600 --height 650\
       --title="ТРЮКИ С ФОТОГРАФИЯМИ" \
       --text="Выберите способ" \
       --column="Отметка выбора" --column="Трюк" \
       TRUE "Сделать порезче" FALSE "Прозрачное PNG" FALSE "Исправить с чёрного на синий"  FALSE "Скруглённые углы иконки" FALSE "Грубый в чёрно-белый рисунок для A4" FALSE "Размытые края портрета" FALSE "Картина маслом" FALSE "Студийное фото" FALSE "Яркость, насыщенность, цветовой тон" FALSE "Увеличить разрешение картинки" FALSE "Предобработка чертежа или фото SKETCH - резкость" FALSE "Фильтр ФОТОКОПИЯ для чертежей" FALSE "Фильтр УБРАТЬ МУСОР для чертежей" FALSE "Улучшение глубины wavemap" FALSE "наклонное свечение" FALSE "свечение"  FALSE "Bokeh - размытие фонарей" FALSE "Cartoon - стилизация под акварель" FALSE "выйти из программы")
if [ "$OPTION1" = "Сделать порезче"  ] ; then OPTION=unsarp_rezche.sh;
	else  OPTION=transparent_PNG.sh; fi
if [ "$OPTION1" = "Исправить с чёрного на синий"   ] ; then OPTION=black2blue.sh; fi
if [ "$OPTION1" = "Скруглённые углы иконки"   ] ; then OPTION=rounded_corners75.sh; fi
if [ "$OPTION1" = "Грубый в чёрно-белый рисунок для A4"   ] ; then OPTION=white_n_black_IMG.sh; fi
if [ "$OPTION1" = "Размытые края портрета"   ] ; then OPTION=roundblurred_image.sh; fi
if [ "$OPTION1" = "Картина маслом"   ] ; then OPTION=oil_paint.sh; fi
if [ "$OPTION1" = "Студийное фото"   ] ; then OPTION=the_best_Image.sh; fi
if [ "$OPTION1" = "Яркость, насыщенность, цветовой тон"   ] ; then OPTION=light_saturation.sh; fi
if [ "$OPTION1" = "Увеличить разрешение картинки"   ] ; then OPTION=image-resizer-thunar.sh; fi
if [ "$OPTION1" = "Предобработка чертежа или фото SKETCH - резкость"   ] ; then OPTION=sketch_picture.sh; fi
if [ "$OPTION1" = "Фильтр ФОТОКОПИЯ для чертежей"   ] ; then OPTION=whiteboard_picture.sh; fi
if [ "$OPTION1" = "Фильтр УБРАТЬ МУСОР для чертежей"   ] ; then OPTION=removedots.sh; fi
if [ "$OPTION1" = "Улучшение глубины wavemap"   ] ; then OPTION=wavemap_picture.sh; fi
if [ "$OPTION1" = "наклонное свечение"   ] ; then OPTION=slantedlight_pict.sh; fi
if [ "$OPTION1" = "свечение"   ] ; then OPTION=softening_pict.sh; fi
if [ "$OPTION1" = "Bokeh - размытие фонарей"   ] ; then OPTION=bokeh_pict.sh; fi
if [ "$OPTION1" = "Cartoon - стилизация под акварель"   ] ; then OPTION=cartoon.sh; fi
if [ "$OPTION1" = "выйти из программы" ] ; then   OPTION=0 ;  rm -rvf ./backup;   fi
myArray=( "$@" )
for i in "$@"; do
	"$OPTION"  "$i" ; done 
 exit
                 fi)