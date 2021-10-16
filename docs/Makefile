# SRC => randomcommands misc

SRC ?= haskelltut
ODIR ?= /tmp
export ODIR

include Makefile.in

UPLOAD_DEST ?= tacos:/var/www/htdocs/t.karchnu.fr/doc/
upload:
	scp $(ODIR)/$(SRC).pdf $(UPLOAD_DEST)
