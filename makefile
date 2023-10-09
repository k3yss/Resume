.PHONY: all run clean

all: resume.pdf

resume.pdf: resume.tex
	latexmk -pdf resume.tex

run: resume.pdf
	zathura resume.pdf --fork

clean: 
	latexmk -C 
