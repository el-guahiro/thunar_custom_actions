#!/usr/bin/env perl
#remastered by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
#https://superuser.com/questions/570908/calculate-difference-and-file-sizes-between-two-files
#скрипт выдаёт результат в целых процентах для озвучки таким способом: | festival --tts --language russian
use strict;
use warnings;

#die "You must define at least 2 files to compare!\n" unless defined $ARGV[0] && defined $ARGV[1];
#die "File $ARGV[0] does not exist!\n" unless -e $ARGV[0];
#die "File $ARGV[1] does not exist!\n" unless -e $ARGV[1];

my ($original, $compressed) = (-s $ARGV[0], -s $ARGV[1]);

#printf "Изменение размера файла: %.0f%%\n", ($compressed / $original - 1) * -100;
printf "Процент сжатия файла: %.0f\n", ($compressed / $original - 1) * -100; 
