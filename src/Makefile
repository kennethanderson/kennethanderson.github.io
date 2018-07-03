#
# Generate the html pages by using mustache: 
#   json + template --> html
#

OBJS=../index.html ../ai.html ../publications.html ../robotics.html ../video.html

all: $(OBJS)

../%.html: %.txt template.awk
	awk -f template.awk $< > $@

#old way
#	mustache $< template.html > $@

clean:
	rm $(OBJS)
