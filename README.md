# Howto start developing

Mac or Linux. I don't know anything about ruby on Windows. Fire up a terminal and run these commands.

	cd ~/; git clone https://github.com/leaberry/jekyll-udpl.git
	cd jekyll-udpl
	sudo gem install bundler
	sudo bundle install
	vi _config.yml (change the site url to localhost:4000)
	bundle exec jekyll serve

The website will now be running on `localhost:4000`. Any changes you make are recompliled on the fly and immediately visible.

* [Original Authors Getting Started Guide](http://mmistakes.github.io/skinny-bones-jekyll/getting-started/)

You can make changes and submit a pull request.


