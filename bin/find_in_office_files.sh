#!/bin/sh
########################################################################################################################
# (C) A.N.Efremov, 2014 y., [email]efremovzone@yandex.ru[/email]
# Уважаемые дамы и господа, если Вы будете использовать этот скрипт или его часть, указывайте пожалуйста авторство.
########################################################################################################################
# (SE)arching (S)cripts, version 1.00
# Скрипт поиска слов в любых файлах, в т.ч. docx, doc, xlsx, xls
########################################################################################################################
var_Find=`which find`
var_Catdoc=`which catdoc`
var_Antiword=`which antiword`
var_Grep=`which grep`
var_Sed=`which sed`
var_Cat=`which cat`
var_Xls2csv=`which xls2csv`
var_Unzip=`which unzip`
var_Awk=`which awk`
var_FindPath=${1}
var_FileMask=${2}
var_FindString=${3}
 
fncHelp()
{
    printf "\n\rСинтаксис: "
    printf "`basename ${0}` Где_ищем \"Шаблон_имени_файла\" \"-e 'Строка_поиска'\"|\"-f Файл_со_строками_поиска\"\n\r\n\r"
    printf "Шаблон_имени_файла - передается в кавычках.\n\rНапример, \"*.doc\"\n\r"
    printf "Строка_поиска - передается вместе с переключателем в кавычках, синтаксис соответствует grep.\n\rНапример, \"-e 'конкретн\|мероприят'\"\n\r"
    printf "Файл_со_строками_поиска - передается вместе с переключателем в кавычках, синтаксис соответствует grep.\n\rНапример, \"-f ./words.txt\"\n\r"
    printf "Формирование words.txt - каждое искомое слово с новой строки\n\r"
    printf "Перед модификаторами -e и -f допускаются модификаторы grep. Например, поиск без учета регистра букв - \"-i -f ./words.txt\"\n\r\n\r"
}
fncCopyright()
{
    clear
    printf "\n\r(SE)arching (S)cripts, version 1.00\n\r(C) A.N.Efremov, 2014 y.\n\r\n\r"
}
 
fncCopyright
 
# Проверяем аргументы командной строки
if [ "$#" -lt 3 ]
  then
    printf "Не хватает аргументов в командной строке:\n\r"
    echo "Где ищем: [${var_FindPath}]"
    echo "Шаблон файла: [${var_FileMask}]"
    echo "Что ищем: [${var_FindString}]"
    fncHelp
    exit 1
fi
 
${var_Find} ${var_FindPath} -type f -iname "${var_FileMask}"|while read var_File;
  do
    case `echo ${var_File} | ${var_Awk} -F. '{print tolower($NF)}'` in
      docx)
    ${var_Unzip} -p ${var_File}|${var_Grep} '<w:t'|${var_Sed} 's/<[^<]*>//g'|${var_Grep} -v '^[[:space:]]*$'|${var_Grep} -H --label="${var_File}" --color -n ${var_FindString}
    ;;
      xlsx)
    ${var_Unzip} -p ${var_File}|${var_Grep} '<t'|${var_Sed} 's/<[^<]*>//g'|${var_Grep} -v '^[[:space:]]*$'|${var_Grep} -H --label="${var_File}" --color -n ${var_FindString}
    ;;
     doc)
    ${var_Catdoc} -w "${var_File}"|grep -H --label="${var_File}" --color -n ${var_FindString}
    ;;
      xls)
    ${var_Xls2csv} "${var_File}"|grep -H --label="${var_File}" --color -n ${var_FindString}
    ;;
      *)
    ${var_Cat} "${var_File}"|grep -H --label="${var_File}" --color -n ${var_FindString}
    ;;
    esac
done