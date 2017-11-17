SRC := _Diplomarbeit

.PHONY: clean compile watch

all: compile

clean:
	find . -type f \( -name "*.run.xml" -o -name "*-blx.bib" -o -name "*.aux" -o -name "*.lof" -o -name "*.log" -o -name "*.lot" -o -name "*.fls" -o -name "*.out" -o -name "*.toc" -o -name "*.fmt" -o -name "*.fot" -o -name "*.cb" -o -name "*.cb2" -o -name "*.bbl" -o -name "*.cbf" -o -name "*.blg" -o -name "*.glo" -o -name "*.ist" -o -name "*.pdfsync" -o -name "*.gls" -o -name "*.gls" -o -name "*.td" -o -name "*.todo" -o -name "*.fdb_latexmk" -o -name "*.synctex.gz" \) -exec rm {} +;

compile: clean
	pdflatex $(SRC) || true
	bibtex $(SRC) || true
	pdflatex $(SRC) || true
	pdflatex $(SRC) || true
	make clean

watch:
	fswatch -o **/*.tex | xargs -n1 make compile
