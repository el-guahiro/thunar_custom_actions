#!/bin/bash
## Compress large PDF files with Zenity/Ghostsript

cd $(pwd)

get_pdf_path(){
	pdf_path=`zenity --file-selection --title="Select a PDF File"`

	case $? in
		0)
			echo "$pdf_path selected.";;
		1)
			echo "No file selected.";;
		-1)
			echo "An unexpected error has occurred.";;
	esac
}

if [[ -z $1 ]]; then
	get_pdf_path
else
	pdf_path=$1
fi

pdf_dir="$(dirname "$pdf_path")"
pdf_file="$(basename "$pdf_path")"
pdf_name="${pdf_file%.*}"

pdf_format=$(zenity --list \
	--radiolist \
	--height=320 \
	--width=480 \
	--title="Choose PDF format for $pdf_file" \
	--column="" --column="Format" --column="Description" \
	1	Print 	"Optimized for printing." \
	2	Web		"Optimized for publishing/sharing on the web." \
	3	Both 	"Create PDF files for print and web.")

echo -e "
pdf path: $pdf_path
pdf_dir: $pdf_dir
pdf file: $pdf_file
pdf_name: $pdf_name
pdf_format: $pdf_format
"
compress_print(){
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$pdf_dir/${pdf_name}_print.pdf" "$pdf_path"
}
compress_web(){
	gs -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$pdf_dir/${pdf_name}_compressed.pdf" "$pdf_path"
}

if [[ $pdf_format = "Print" ]]; then
	compress_print
	notify-send "$pdf_name converted to Print Format."
elif [[ $pdf_format = "Web" ]]; then
	echo "Web Format"
	compress_web
	notify-send "$pdf_name converted to Web Format."
elif [[ $pdf_format = "Both" ]]; then
	echo "Print/Web Format"
	compress_print
	compress_web
	notify-send "$pdf_name converted to Print and Web Formats."
else
	echo "There was an error."
	exit
fi