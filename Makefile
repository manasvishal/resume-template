MAIN_FILE = ManasVishal_resume

# LaTeX build commands
LATEX = pdflatex
BIBTEX = bibtex
MAKEINDEX = makeindex

# Default target
all: resume 

# Build PDF
$(MAIN_FILE).pdf: $(MAIN_FILE).tex commands.tex 
	$(LATEX) $(MAIN_FILE).tex
	-$(BIBTEX) $(MAIN_FILE)
	$(LATEX) $(MAIN_FILE).tex
	$(LATEX) $(MAIN_FILE).tex

# Clean auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz *.pdf

# Clean everything including PDF
distclean: clean
	rm -f $(MAIN_FILE).pdf

# Quick build (single pass)
quick:
	$(LATEX) $(MAIN_FILE).tex

# Build resume PDF and clean auxiliary files
resume:
	$(LATEX) ManasVishal_resume.tex
	-$(BIBTEX) ManasVishal_resume
	$(LATEX) ManasVishal_resume.tex
	$(LATEX) ManasVishal_resume.tex
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz



.PHONY: all clean distclean quick resume cover
