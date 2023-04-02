#!/bin/bash

cd ..

for i in $1; do
    echo "Compiling $i tex file"
    xelatex -shell-escape -synctex=1 -interaction=nonstopmode -no-pdf  $i
    xelatex -shell-escape -synctex=1 -interaction=nonstopmode -no-pdf  $i
    xelatex -shell-escape -synctex=1 -interaction=nonstopmode -no-pdf  $i 
    #lualatex -shell-escape -interaction=nonstopmode $i
    #lualatex -shell-escape -interaction=nonstopmode $i
    #lualatex -shell-escape -interaction=nonstopmode $i
done

xdvipdfmx *.xdv

for F in *.pdf
do
   mv "$F" ./build
done


rm *.log
rm *.aux
rm *.out
rm *.synctex.gz
rm *.toc
rm *.pyg
rm *.pdf
rm -rf ./_minted*
