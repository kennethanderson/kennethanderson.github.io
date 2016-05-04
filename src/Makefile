#
# Generate the html pages by using mustache: 
#   json + template --> html
#

MUSTACHE=../../../idl/bin/mustache
OBJS=../index.html ../ai.html ../publications.html ../robotics.html ../video.html

all: $(OBJS)

../index.html: index.json template.html
	$(MUSTACHE) index.json template.html > ../index.html
../ai.html: ai.json template.html
	$(MUSTACHE) ai.json template.html > ../ai.html
../publications.html: publications.json template.html
	$(MUSTACHE) publications.json template.html > ../publications.html
../robotics.html: robotics.json template.html
	$(MUSTACHE) robotics.json template.html > ../robotics.html
../video.html: video.json template.html
	$(MUSTACHE) video.json template.html > ../video.html
	
clean:
	rm $(OBJS)
