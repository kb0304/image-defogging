# image-defogging
Fast implementation of single image defogging in octave based on dark channel prior. The code is based on algorithm discussed in research paper titled "Fast Single-image Defogging" by Zhiming Tan and others.

It first estimates the intensity of atmospheric light by searching for sky area in the image. Then it estimates the transmission map by refining a coarse map from a fine map. Finally, it produces a clearer image from the foggy image by using the estimated intensity and transmission map.

## Usage
Give adequate path to file to be defogged.
Set or use default coffecient of defogging, representing the extent of defogging an image.
Set or use default window size, used for calculation of transmission map.
