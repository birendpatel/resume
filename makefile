# Copyright (C) 2021 Biren Patel
# Resume build system

.PHONY: resume clean

RNAME = resume.tex

resume:
	pdflatex $(RNAME)

clean:
	rm *.aux *.log *.out *.pdf
