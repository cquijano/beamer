PDFTEX=/usr/bin/pdflatex
SVGCONVERT=/usr/bin/rsvg-convert

all:	images
	$(PDFTEX) main.tex

clean: images_clean
	rm -rf *.out *.nav *.pdf *.log *.snm *.toc

images_clean:
	rm -rf images/pdf

images: pdf
	@echo "Png images created"
pdf:
	mkdir -p images/pdf
	for i in images/svg/*; do $(SVGCONVERT) -f pdf  $$i -o `echo $$i | sed -e 's/svg/pdf/g'`; done