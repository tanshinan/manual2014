all: manualen

manualen: manualen.tex
	pdflatex -interaction=nonstopmode manualen.tex; \
	texindy -C utf8 -L swedish manualen.idx; \
	pdflatex -interaction=nonstopmode manualen.tex; \
	pdflatex -interaction=nonstopmode manualen.tex
pdf: manualen.tex
	pdflatex -interaction=nonstopmode manualen.tex

index: 
	texindy -C utf8 -L swedish manualen.idx

joined:
	pdfjoin --rotateoversize 'false'  empty.pdf manualen.pdf
