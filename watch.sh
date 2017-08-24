#!/bin/bash

fswatch -o ./*.tex | xargs -n1 pdflatex -output-directory out/ _Diplomarbeit.tex
