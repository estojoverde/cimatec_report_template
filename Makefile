.EXPORT_ALL_VARIABLES:
TEXINPUTS = :.:../.:

main.pdf: main.tex
	pdflatex -shell-escape main.tex