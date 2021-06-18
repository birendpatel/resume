# Copyright (C) 2021 Biren Patel
# Resume build system

.PHONY: open resume clean

RNAME = resume

open: resume
	xdg-open ./$(RNAME).pdf

resume:
	pdflatex $(RNAME).tex

clean:
	rm -f *.aux *.log *.out *.pdf
	clear
