#  $^ = all prerequisites
#  $< = first prerequisite
#  $@ = file name of target

all: ott/ott2.9/index.html

ott/ott2.9/ott2.9.md:
	wget -O $@ --no-check-certificate  "https://raw.githubusercontent.com/OpenTreeOfLife/reference-taxonomy/master/doc/ott2.9.md"

tmp/Markdown.pl:
	mkdir -p tmp
	wget "http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip"
	unzip Markdown_1.0.1.zip
	mv Markdown_1.0.1/Markdown.pl $@
	rm -r Markdown_1.0.1 Markdown_1.0.1.zip

ott/ott2.9/index.html: ott/ott2.9/ott2.9.md tmp/Markdown.pl
	perl tmp/Markdown.pl --html4tags $< >$@

clean:
	rm -r tmp
	rm ott/ott2.9/ott2.9.md ott/ott2.9/index.html
