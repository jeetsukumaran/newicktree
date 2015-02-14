SRC := $(wildcard *.tex)
PDF := $(patsubst %.tex,%.pdf,$(SRC))
AUX = psttest.aux,nttest.pdf
TEXC := xelatex
TEXC_OPTS += -shell-escape
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/newicktree

.PHONY: clean install

all: $(PDF)

$(PDF): newicktree.sty %.tex
	latexmk -xelatex $(basename $<)

clean:
	@rm -f $(PDF)
	@git clean -xf

install:
	mkdir -p $(INSTALL_DIR)
	cp *.sty $(INSTALL_DIR)