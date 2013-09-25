PDFTEX=/usr/bin/pdflatex
SVGCONVERT=/usr/bin/rsvg-convert

all:	images
	$(PDFTEX) main.tex

clean: images_clean
	rm -rf *.out *.nav *.pdf *.log *.snm *.toc *.jpg

images_clean:
	rm -rf images/pdf
	rm -rf images/jpg

images: jpg
	@echo "Images created"
pdf:
	mkdir -p images/pdf
	for i in images/svg/*; do $(SVGCONVERT) -f pdf  $$i -o `echo $$i | sed -e 's/svg/pdf/g'`; done
jpg:
	mkdir -p images/jpg
	for i in images/svg/*; do $(SVGCONVERT) -f jpg  $$i -o `echo $$i | sed -e 's/svg/jpg/g'`; done
