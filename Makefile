.PHONY: all

all: abstract100.pdf abstract500.pdf

%.pdf: %.md
	pandoc $< -o $@
