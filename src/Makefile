#
# Generate the html pages by using a template: 
#   txt + template --> html
#

HTML := ../index.html ../ai.html ../publications.html ../robotics.html ../video.html

all: $(HTML)

../%.html: %.yaml template.html
	mustache $*.yaml template.html > ../$*.html

#old ways
#../%.html: %.txt template.awk
#	asciidoc --conf-file=template.conf -a linkcss -o ../$*.html $*.adoc
#	awk -f template.awk $< > $@
#	mustache $< template.html > $@

clean:
	rm -f $(HTML)
