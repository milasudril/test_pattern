# Test pattern

This is a test pattern to be used for testing image processing application, and/or imaging devices.


## Generated images

The included makefile encodes the test pattern in the following formats:

| Channels | Sample type | Encoding                                      |
|----------|-------------|-----------------------------------------------|
| RGBA     | u16         | PNG                                           |
| RGBA     | f16         | EXR                                           |
| RGBA     | f32         | Header-less little-endian with no compression |

All images should be in linear color-space


## Build dependencies

In order to generate the rasterized images, you need Inkscape and ImageMagick. In order for the non-
exr versions to be correct you need to make sure that your ImageMagick includes the commit
https://github.com/ImageMagick/ImageMagick6/commit/59953e741c004f84b4a164d430a1be5ca3db2d44


## Features

The pattern can be used to test the following rendering properties

* Gamma correction
* Image aspect ratio
* Over-exposure color
* RGB channel order
* Scanline order (up-down)
* Scanline pixel order (left-right)


### Gamma correction

The image background is neutral gray in linear color. If the rendering is correct, the gradients
should blend with non-solid colorbar next to the gradient at the -3 dB mark.


### Image aspect ratio

The aspect ratio of this image is 16:10. Each cell should be a rendered as a square. In addition to
that, each corner has a diagonal line in it. This line should be 45 degrees relative to the vertical
and horizontal direction.


### Over-exposure color

The corners of the image has color fields that forms a "rainbow" if the image is tiled. When the
image is over-exposed, the sky-blue and bright turquoise fields will become cyan. The lime and and
orage fields will turn yellow. The pink and violett fields will turn into magenta. You can use this
test image to check how these hue-shifting colors behaves under different base curves.


### RGB channel exposure

The expected color of red green and blue fields are indicated in the picture. There is not mutch
more to say about this.


### Scanline order

Up and down is indicated by text.


### Scanline pixel order

Left and right is indicated by text.


## Bugs

* The color gradients has some banding visible effect. This is because Inkscape has no true HDR
support.

* When viewing the raw SVG file, colors are wrong and to dark. This is because SVG files them selfs
cannot be in linear colorspace.
