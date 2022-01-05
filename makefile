# Copyright (C) 2021 Biren Patel
# Resume build system. The resume may be configured for either UK (default) or
# US. These configurations modify account/location details but also accomodate
# for the myriad of subtle differences in naming, spelling, and grammar between
# the two countries.

.PHONY: protect uk us docs sub create open clean

protect:
	@echo "select uk or us version to make resume"

BASEFILE = resume
UK_NAME = biren_patel_cv
US_NAME = biren_patel_resume

TARGET =
LOCATION =
CITIZENSHIP =
PHONE =
SUMMARY =

#------------------------------------------------------------------------------

uk: TARGET += $(UK_NAME)
uk: LOCATION += London, UK 
uk: CITIZENSHIP += UK Citizen 
uk: PHONE += +44 7542 193719
uk: SUMMARY += I am a UK citizen based in London.
uk: docs sub create open

us: TARGET += $(US_NAME)
us: LOCATION += Austin, TX 
us: CITIZENSHIP += US Citizen 
us: PHONE += (737) 216 - 3411
us: SUMMARY += I am a US citizen based in Austin, TX.
us: docs sub create open

#------------------------------------------------------------------------------

docs:
	mkdir -p ./docs

sub:
	sed 's/LOCATION/$(LOCATION)/g' $(BASEFILE).tex > $(TARGET).tex
	sed -i 's/CITIZENSHIP/$(CITIZENSHIP)/g' $(TARGET).tex
	sed -i 's/PHONE_NUMBER/$(PHONE)/g' $(TARGET).tex
	sed -i 's/ADD_SUMMARY/$(SUMMARY)/g' $(TARGET).tex

create:
	pdflatex $(TARGET).tex
	rm $(TARGET).tex
	mv ./$(TARGET).pdf ./docs/$(TARGET).pdf

open:
	xdg-open ./docs/$(TARGET).pdf

#-------------------------------------------------------------------------------

clean:
	rm -f *.aux *.log *.out *.pdf
	rm -rf ./docs
