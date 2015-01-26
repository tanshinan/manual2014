all: manualen

manualen: manualen.tex
	xelatex -interaction=nonstopmode manualen.tex; \
	xindy -C utf8 -L swedish -M texindy -M manualen.xdy manualen.idx; \
	xelatex -interaction=nonstopmode manualen.tex; \
	xelatex -interaction=nonstopmode manualen.tex

index: 
	xindy -C utf8 -L swedish -M texindy -M manualen.xdy manualen.idx
