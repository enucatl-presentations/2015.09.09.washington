.PHONY: all clean

all: abstract100.pdf abstract500.pdf technical_summary.pdf

technical_summary.pdf: technical_summary.tex xnpig.sty figures/* ../library/library.bib
	latexmk -pdf $<

%.pdf: %.md
	pandoc $< -o $@

clean:
	-latexmk -C
	-rm abstract100.pdf abstract500.pdf
