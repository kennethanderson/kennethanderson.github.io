#
# Generate the html pages by using mustache: 
#   json + template --> html
#

MUSTACHE=mustache
OBJS=../index.html ../ai.html ../publications.html ../robotics.html ../video.html

all: $(OBJS)

../%.html: %.json template.html
	$(MUSTACHE) $< template.html > $@

clean:
	rm $(OBJS)
