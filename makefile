.PHONY: all run clean

all: Rishi_Kumar_Resume.pdf

Rishi_Kumar_Resume.pdf: Rishi_Kumar_Resume.tex
	latexmk -pdf -jobname=Rishi_Kumar_Resume Rishi_Kumar_Resume.tex

run: Rishi_Kumar_Resume.pdf
	zathura Rishi_Kumar_Resume.pdf --fork

clean: 
	latexmk -C 
