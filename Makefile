all: manualen

manualen: manualen.tex
	pdflatex -interaction=nonstopmode manualen.tex; \
	texindy -M manualen.xdy -C utf8 -L swedish manualen.idx; \
	pdflatex -interaction=nonstopmode manualen.tex; \
	pdflatex -interaction=nonstopmode manualen.tex
pdf: manualen.tex
	pdflatex -interaction=nonstopmode manualen.tex

index: 
	texindy -M manualen.xdy -C utf8 -L swedish manualen.idx
