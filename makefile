all: __targets/test_pattern.rgba __targets/test_pattern.exr __targets/test_pattern.png

__targets/test_pattern.png: __targets/test_pattern_raw.png
	convert -set colorspace RGB __targets/test_pattern_raw.png -depth 16 PNG64:__targets/test_pattern.png

__targets/test_pattern.exr: __targets/test_pattern_raw.png
	convert -set colorspace RGB __targets/test_pattern_raw.png -depth 32 __targets/test_pattern.exr

__targets/test_pattern.rgba: __targets/test_pattern_raw.png
	convert -set colorspace RGB __targets/test_pattern_raw.png -depth 32 -define quantum:format=floating-point __targets/test_pattern.rgba

__targets/test_pattern_raw.png: __targets test_pattern.svg
	inkscape -o __targets/test_pattern_raw.png -d 192 --export-png-color-mode=RGBA_16 test_pattern.svg

__targets:
	mkdir -p __targets

.PHONY: clean
clean:
	rm -rf __targets

DESTDIR?=""
PREFIX?="/usr"
.PHONY: install
install: all
	mkdir -p $(DESTDIR)$(PREFIX)/share/test_pattern
	cp __targets/test_pattern.png $(DESTDIR)$(PREFIX)/share/test_pattern/test_pattern.png
	cp __targets/test_pattern.exr $(DESTDIR)$(PREFIX)/share/test_pattern/test_pattern.exr
	cp __targets/test_pattern.rgba $(DESTDIR)$(PREFIX)/share/test_pattern/test_pattern.rgba