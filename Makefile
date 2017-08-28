SRC := _Diplomarbeit

.PHONY: clean
clean:
	rm -f *.{aux,lof,log,lot,fls,out,toc,fmt,fot,cb,cb2,bbl,cbf,blg,glo,ist,pdfsync,gls,glg}

.PHONY: compile
compile: clean
	pdflatex $(SRC)
	bibtex $(SRC)
	pdflatex $(SRC)
	pdflatex $(SRC)
	make clean

.PHONY: watch
watch:
	fswatch -o ./*.tex | xargs -n1 make compile
