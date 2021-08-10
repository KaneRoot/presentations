all: run

SRC = haskelltut
BIBLIOGRAPHY = bibliography

# -P      => move ponctuation after reference
# -S      => label and bracket-label options
# -e      => accumulate (use a reference section)
# -p bib  => bibliography file
REFER_OPTS = -PS -e -p $(BIBLIOGRAPHY)
REFER = refer $(REFER_OPTS)

# -k     => iconv conversion (did it ever worked?)
# -ms    => ms macro
# -Tpdf  => output device is PDF
GROFF_OPTS = -ms -t -Tpdf
GROFF = groff $(GROFF_OPTS)

# ghighlight brings `source-highlight` to troff
GHIGHLIGHT_OPTS =
GHIGHLIGHT = ghighlight $(GHIGHLIGHT_OPTS)

VIEWER_OPTS = -
VIEWER = zathura $(VIEWER_OPTS)

SOELIM_OPTS =
SOELIM = soelim $(SOELIM_OPTS)

# GH_INTRO: instructions before each source code provided by source-highlight
# GH_OUTRO: ------------ after  ---- ------ ---- -------- -- ----------------
# GH_INTRO/GH_OUTRO: values are separated by ';'

GH_INTRO = .nr DI 0;.DS I;.fam C
GH_OUTRO = .fam;.DE
export GH_INTRO
export GH_OUTRO

# SHOPTS: cmd line parameter given to source-highlight
SHOPTS = --outlang-def=./.source-highlight_groff-output-definition
export SHOPTS


$(SRC).pdf:
	cat $(SRC).ms | $(SOELIM) | $(GHIGHLIGHT) | $(REFER) | $(GROFF) > $@

run:
	cat $(SRC).ms | $(SOELIM) | $(GHIGHLIGHT) | $(REFER) | $(GROFF) | $(VIEWER)
