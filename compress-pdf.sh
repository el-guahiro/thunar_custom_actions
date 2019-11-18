#! /bin/bash

# AUTHOR:	(c) Ricardo Ferreira, русификация el guahiro
# NAME:		Сжатие PDF 1.4
# DESCRIPTION:	A nice Nautilus script with a GUI to compress and optimize PDF files
# REQUIRES:	ghostscript, poppler-utils, zenity
# LICENSE:	GNU GPL v3 (http://www.gnu.org/licenses/gpl.html)
# WEBSITE:	https://launchpad.net/compress-pdf

# Messages
		# Russian (ru-RU)
		error_nofiles="Не выбран файл"
		error_noquality="Не выбран уровень сжатия"
		error_ghostscript="PDF Compress requires the ghostscript package, which is not installed. Please install it and try again."
		error_nopdf="Это не PDF"
		label_filename="Сохранить PDF как..."
		label_level="Выберите уровень оптимизации"
		optimization_level="Уровень оптимизации"
		level_default="По умолчанию"
		level_screen="Среднее качество"
		level_low="Низкое качество"
		level_high="Высокое качество"
		level_color="Высокое качество (сохранение цвета)"

VERSION="1.4"

pdf_file=$(basename "$1")

# Check if Ghostscript is installed
GS="/usr/bin/ghostscript"
if [ ! -x $GS ]; then
        zenity --error --title="Сжатие PDF "$VERSION"" --text="$error_ghostscript"
        exit 0;
fi

# Check if the user has selected any files
if [ -z /usr/sbin/ ]; then
        zenity --error --title="Сжатие PDF "$VERSION"" --text="$error_nofiles"
        exit 0;
fi

# Check if the selected file is a PDF
mimetype=$(file -b -i "$1")
if [ -z "`echo $mimetype | grep -i 'pdf' `" ]; then
	zenity --error --title="Сжатие PDF "$VERSION"" --text="$error_nopdf"
        exit 0;
fi

# Ask the user to select a compressing format
selected_level=$(zenity  --list  --title="Сжатие PDF "$VERSION"" --text "$label_level" --radiolist  --column "" --column "$optimization_level" TRUE "$level_default" FALSE "$level_screen" FALSE "$level_low" FALSE "$level_high" FALSE "$level_color")
if [ -z "$selected_level" ]; then
        zenity --error --title="Сжатие PDF "$VERSION"" --text="$error_noquality"
        exit 0;
fi

# Select the optimization level to use
case $selected_level in
        "$level_default")
                COMP_COMMAND="/default"
        ;;
        "$level_screen")
                COMP_COMMAND="/screen"
        ;;
        "$level_low")
                COMP_COMMAND="/ebook"
        ;;
        "$level_high")
                COMP_COMMAND="/printer"
        ;;
        "$level_color")
                COMP_COMMAND="/prepress"
        ;;
esac

# Choose output file name
temp_filename=.temp-"$pdf_file"
suggested_filename=$(date +%b%d%H%M%S)∗"$pdf_file"
output_filename=$(zenity --file-selection --save --confirm-overwrite --filename="$suggested_filename" --title="$label_filename")

if [ "$?" = 1 ] ; then
        exit 0;
fi

# Extract metadata from the original PDF
pdfinfo "$1" | sed -e 's/^ *//;s/ *$//;s/ \{1,\}/ /g' -e 's/^/  \//' -e '/CreationDate/,$d' -e 's/$/)/' -e 's/: / (/' > .pdfmarks
sed -i '1s/^ /[/' .pdfmarks
sed -i '/:)$/d' .pdfmarks
echo "  /DOCINFO pdfmark" >> .pdfmarks

# Execute ghostscript while showing a progress bar
(echo "0" ;
 gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=$COMP_COMMAND -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$temp_filename" "$1" .pdfmarks
 rm .pdfmarks
 echo "100") | (if `zenity --progress --pulsate --auto-close --title="Сжатие PDF "$VERSION""`;
                 then
                     mv -f "$temp_filename" "$output_filename" &
                     notify-send "Сжали PDF!"
                 else
                     killall gs
                     rm "$temp_filename"
                     exit
                 fi)
