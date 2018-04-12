#
# Generate the html pages by using mustache: 
#   json + template --> html
#

OBJS=../index.html ../ai.html ../publications.html ../robotics.html ../video.html

all: $(OBJS)

../%.html: %.json template.html
	awk -f template.awk $< > $@

#old way
#	mustache $< template.html > $@

clean:
	rm $(OBJS)
