#
# Generate the html pages by using a template: 
#   txt + template --> html
#

HTML := ../index.html ../ai.html ../publications.html ../robotics.html ../video.html

all: $(HTML)

../%.html: %.adoc template.conf
	asciidoc --conf-file=template.conf -a linkcss -o ../$*.html $*.adoc

#old ways
#../%.html: %.txt template.awk
#	awk -f template.awk $< > $@
#	mustache $< template.html > $@

clean:
	rm -f $(HTML)

