#!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#special thanks to https://unix.stackexchange.com/questions/629144/how-can-i-paste-an-image-from-clipboard-directly-to-a-file
#Создаёт файл из скопированного изображения в указанной директории
#!/bin/bash
dir=$(xclip -selection clipboard -o)
# here the path to your Images folder
img_dir="/home/user/Изображения/"
img=$(ls -t "$img_dir" | head -n 1)
cp "$img_dir$img" "$dir/$img"
