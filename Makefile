title = Problem

all: $(title).pdf 
mfiles: *.m

clean:
	rm -f *.toc *.aux *.out *.log *.dvi *.bbl *.gz *.blg *.xml *.bcf

archive:
	cd ..\
	zip -r  archive.zip NumMethods/
	
$(title).pdf: $(title).tex $(mfiles) 
	pdflatex $(title).tex
	pdflatex $(title).tex
		
full:
	pdflatex $(title).tex
	pdflatex $(title).tex
	pdflatex $(title).tex
	

