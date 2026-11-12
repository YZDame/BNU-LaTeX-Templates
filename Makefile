# Build every template from the repository root.
# Thesis latexmkrc already selects XeLaTeX, shell-escape, and xdvipdfmx.

.PHONY: all paper cv slides thesis clean

all: paper cv slides thesis

paper:
	cd templates/paper && latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex

cv:
	cd templates/cv && latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex

slides:
	cd templates/slides && latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex

thesis:
	cd templates/thesis && latexmk -interaction=nonstopmode -halt-on-error bnuthesis-example.tex
	cd templates/thesis && latexmk -interaction=nonstopmode -halt-on-error spine.tex

clean:
	-cd templates/paper && latexmk -c main.tex
	-cd templates/cv && latexmk -c main.tex
	-cd templates/slides && latexmk -c main.tex
	-cd templates/thesis && latexmk -c bnuthesis-example.tex spine.tex
	-rm -f templates/paper/main.pdf templates/cv/main.pdf templates/slides/main.pdf
	-rm -f templates/thesis/bnuthesis-example.pdf templates/thesis/bnuthesis.pdf templates/thesis/spine.pdf
	-rm -f templates/thesis/dtx-style.sty templates/thesis/bnuthesis-example.loa
	-rm -f templates/thesis/figures/*-eps-converted-to.pdf
