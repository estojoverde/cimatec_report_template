.EXPORT_ALL_VARIABLES:
TEXINPUTS = :.:../.:

# main.pdf: main.tex
#	pdflatex -shell-escape main.tex




main: main.tex
	lualatex -shell-escape -interaction=nonstopmode -synctex=1 main.tex
	lualatex -shell-escape -interaction=nonstopmode -synctex=1 main.tex
	bibtex main
	lualatex -shell-escape -interaction=nonstopmode -synctex=1 main.tex
	lualatex -shell-escape -interaction=nonstopmode -synctex=1 main.tex


clean:
	rm -f *.aux *.log *.out *.pdf *.toc *.bbl *.blg *.dvi *.ps *.snm *.nav *.vrb *.fls *.fdb_latexmk *.synctex.gz *.synctex.gz\(busy\) *.acn *.glo *.ist