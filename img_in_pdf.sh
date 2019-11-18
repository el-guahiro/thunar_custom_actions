#!/bin/bash
# Converts input images to one-page PDF files each, without changing image data.
# The image is centered on a A4 page with a 5% border.
# Adapted from https://unix.stackexchange.com/a/220114
#
# Usage: [command] image1.jpg image2.png ...
# Output: PDF files named after the images e.g. image1.pdf


# bc function to calculate maximum of two floats
bc_functions="
define max(a,b) {
  if (a>b) {
    return(a)
  } else {
    return(b)
  }
};";

# Do the calculation in string $1 and echo the result.
function calc {
  # Define bc functions so we can use it for the calc.
  echo "$bc_functions $1" | bc -l;
}


for file in "$@"; do \
  # Determine image dimensions in pixels.
  img_size_x=$(identify -format "%w" "$file");
  img_size_y=$(identify -format "%h" "$file");

  # Calculate image density (in dpi) needed to fit the image and a 5% 
  # border all around on an A4 page (8.27x11.69"). Factor 1.1 creates 
  # 2*5% borders, see https://unix.stackexchange.com/a/220114 for details.
  min_density_x=$(calc "$img_size_x / 8.27 * 1.1");
  min_density_y=$(calc "$img_size_y / 11.69 * 1.1");

  # Use the higher density to prevent any dimension exceeding the required fit.
  density=$(calc "max($min_density_x,$min_density_y)");

  # Calculate canvas dimensions in pixels.
  # (Canvas is an A4 page (8.27x11.69") with the calculated density.)
  page_size_x=$(calc "8.27 * $density");
  page_size_y=$(calc "11.69 * $density");

  offset_x=$(calc "($page_size_x - $img_size_x) / 2 * 72 / $density");
  offset_y=$(calc "($page_size_y - $img_size_y) / 2 * 72 / $density");

  # Center image on a larger canvas.
  convert "$file" \
    -page ${page_size_x}x${page_size_y}+${offset_x}+${offset_y} \
    -units PixelsPerInch -density $density \
    -format pdf -compress jpeg \
    "${file/.jpg/.pdf}";
done;

