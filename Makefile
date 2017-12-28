title = Problem

all: $(title).pdf 

clean:
	rm -f *.toc *.aux *.out *.log *.dvi *.bbl *.gz *.blg *.xml *.bcf

archive:
	cd ..\
	zip -r  archive.zip NumMethods/
	
$(title).pdf: $(title).tex 
	pdflatex $(title).tex
	pdflatex $(title).tex
		
full:
	pdflatex $(title).tex
	pdflatex $(title).tex
	pdflatex $(title).tex
	

