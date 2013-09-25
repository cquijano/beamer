PDFTEX=/usr/bin/pdflatex
SVGCONVERT=/usr/bin/rsvg-convert

all:	images
	$(PDFTEX) main.tex

clean: images_clean
	rm -rf *.out *.nav *.pdf *.log *.snm *.toc *.png

images_clean:
	rm -rf images/pdf
	rm -rf images/png

images: png
	@echo "Images created"
pdf:
	mkdir -p images/pdf
	for i in images/svg/*; do $(SVGCONVERT) -f pdf  $$i -o `echo $$i | sed -e 's/svg/pdf/g'`; done
png:
	mkdir -p images/jpg
	for i in images/svg/*; do $(SVGCONVERT) -f png  $$i -o `echo $$i | sed -e 's/svg/jpg/g'`; done
