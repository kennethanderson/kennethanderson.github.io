
YAML := index.yaml ai.yaml publications.yaml robotics.yaml video.yaml
YAML2 := .index.yaml .ai.yaml .publications.yaml .robotics.yaml .video.yaml
PARTIALS := .nav.mustache
HTML := ../index.html ../ai.html ../publications.html ../robotics.html ../video.html

all: $(HTML) ../images/favicon.svg

# markdown --> html snippet
# also handle markdown embedded in yaml
.%.mustache: %.md
	markdown $*.md > .$*.mustache
.%.yaml: %.yaml markdown.awk
	awk -f markdown.awk $*.yaml > .$*.yaml

# yaml + template.mustache --> html page
../%.html: .%.yaml $(PARTIALS) template.mustache
	mustache .$*.yaml template.mustache > ../$*.html

# Favicon
../images/favicon.svg: favicon.gv
	dot -Tsvg favicon.gv -o ../images/favicon.svg

clean:
	rm -f $(HTML) $(PARTIALS) $(YAML2)

#.SECONDARY: $(PARTIALS) $(YAML2) # for debugging
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

