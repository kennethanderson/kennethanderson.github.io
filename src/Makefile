#
# Generate html snippets with markdown:
#   md --> html
# Generate the html pages with a template: 
#   yaml + mustache --> html
#

HTML := ../index.html ../ai.html ../publications.html ../robotics.html ../video.html nav.mustache

all: $(HTML)

nav.mustache: nav.md
	markdown nav.md > nav.mustache

../%.html: %.yaml template.mustache nav.mustache markdown.awk
	awk -f markdown.awk $*.yaml > .$*.yaml
	mustache .$*.yaml template.mustache > ../$*.html

#old ways
#../%.html: %.txt template.awk
#	asciidoc --conf-file=template.conf -a linkcss -o ../$*.html $*.adoc
#	awk -f template.awk $< > $@
#	mustache $< template.mustache > $@

clean:
	rm -f $(HTML) nav.mustache .*.yaml
