
HTML := ../index.html ../ai.html ../publications.html ../robotics.html ../video.html
PARTIALS := .nav.mustache

#.INTERMEDIATE: .nav.mustache
#.SECONDARY: .nav.mustache
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:
#.SUFFIXES: .you .own .here

all: $(HTML)

#
# Generate html snippets with markdown:
#   md --> html
#
.%.mustache: %.md
	markdown $*.md > .$*.mustache
# YAML-embedded Markdown
.%.yaml: %.yaml markdown.awk
	awk -f markdown.awk $*.yaml > .$*.yaml

#
# Generate the html pages with a template: 
#   yaml + mustache --> html
#
../%.html: .%.yaml $(PARTIALS) template.mustache
	mustache .$*.yaml template.mustache > ../$*.html

#old ways
#../%.html: %.txt template.awk
#	asciidoc --conf-file=template.conf -a linkcss -o ../$*.html $*.adoc
#	awk -f template.awk $< > $@
#	mustache $< template.mustache > $@

clean:
	rm -f $(HTML) $(PARTIALS) .*.yaml

