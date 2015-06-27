# How to make changes to the files.opentreeoflife.org site

The site is currently deployed on ot10.opentreeoflife.org (a.k.a
devapi.opentreeoflife.org), with a web root directory of
~opentree/files.opentreeoflife.org/.  The web root is a git checkout
of the [files.opentreeoflife.org github repository](https://github.com/OpenTreeOfLife/files.opentreeoflife.org).

There are two kinds of files in this tree on ot10: "large" and "small".

1. The small files - mostly index.html files - are maintained in the 
files.opentreeoflife.org github repository.
2. The large files (e.g. versions of OTT or the synthetic tree) are simply
copied from wherever they originate to the appropriate place in this tree.
They are backed up elsewhere (currently varela.csail.mit.edu).

The small files can be updated on ot10 in any of three ways:

### Push method

Clone the files.opentreeoflife.org repository locally, or bring it up
to date if you've already cloned it ('git pull').  Update the small
files you want to change in your local clone and commit to github.
Then refresh the web site from github by logging in to ot10 and doing
'git pull' in the ~opentree/files.opentreeoflife.org directory.

    echo "cd files.opentreeoflife.org && git pull && make" | ssh ot10

The 'make' is only necessary if you change a markdown file that
has to be converted to HTML.

Using branches and the PR process seems a bit heavyweight for this
site.  I'm OK with committing to master for now and switching to a
more rigorous process if that leads to trouble.

### Pull method

Edit the files in place on ot10.  Then copy them using scp from ot10
back to your local checkout of the files.opentreeoflife.org repo.
Branch, commit, push, PR.

### Checking your markdown

Remember that if you want to write web pages for the site in markdown
format, they have to be converted to HTML for them to work on the
web.  This is what the top level Makefile is for.

Here is how I check markdown locally before committing it to github:

    perl ~/Downloads/Markdown_1.0.1/Markdown.pl README.md  >foo.html && open foo.html

The download link is [here](http://daringfireball.net/projects/markdown/).
