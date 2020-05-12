
YAML := index.yaml ai.yaml publications.yaml robotics.yaml video.yaml
YAML2 := .index.yaml .ai.yaml .publications.yaml .robotics.yaml .video.yaml
PARTIALS := .nav.mustache
HTML := ../index.html ../ai.html ../publications.html ../robotics.html ../video.html

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

clean:
	rm -f $(HTML) $(PARTIALS) $(YAML2)

#.SECONDARY: $(PARTIALS) $(YAML2) # for debugging
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

