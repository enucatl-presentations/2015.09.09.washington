.PHONY: all clean

all: abstract100.pdf abstract500.pdf technical_summary.pdf

%.pdf: %.tex
	latexmk -pdf $<

%.pdf: %.md
	pandoc $< -o $@

clean:
	-latexmk -C
	-rm abstract100.pdf abstract500.pdf
