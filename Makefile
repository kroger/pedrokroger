run:
	bundle exec jekyll serve

build:
	bundle exec jekyll build

clean:
	bundle exec jekyll clean

deploy: build
	rsync -av --delete _site/ deploy@pkroger.com:pedrokroger.net/
