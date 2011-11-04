MATHTEX=~/bin/mathtex.cgi
PANDOC=~/.cabal/bin/pandoc

all: html txt

html:
	$(PANDOC) -f markdown curie.md -s --toc --bibliography curie.bib --csl=curie.csl -o curie.html

epub:
	$(PANDOC) -f markdown curie.md --toc --epub-metadata=dc.xml --epub-cover-image=title.png --bibliography curie.bib --csl=curie.csl -o curie.epub
	
txt:
	$(PANDOC) -f markdown -t plain -s curie.md --bibliography curie.bib --csl=curie.csl -o t.txt
	sed -f txtconv.sed <t.txt >curie.txt

curie.md:
	$(PANDOC) -f latex curie.tex -t markdown -o curie.md

math:
	$(PANDOC) -s --mimetex=$(MATHTEX) math.md >t.html

cv:
	sed -f convert.sed <curie.tex >curie.txt

zip:
	rm -f curie.zip
	zip -r curie curie.txt curie.html images page-images

