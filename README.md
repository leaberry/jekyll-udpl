# Howto start developing

Mac or Linux. I don't know anything about ruby on Windows. Fire up a terminal and run these commands.

	cd ~/; git clone https://github.com/leaberry/jekyll-udpl.git
	cd jekyll-udpl
	sudo gem install bundler
	sudo bundle install
	./run-dev-site.sh

The website will now be running on `localhost:4000`. Any changes you make are recompliled on the fly and immediately visible. 

There is another script called `build-and-push-site.sh`. It will check the events.txt json to make sure it's valid, build the production site and push it to the webserver. If you want to just check the json there is a `check-json.sh` script that will just check the json format.

## Improvements made

All the css and javascript is automatically bundled. The javascript is 95% minified and mod_deflate is enabled in the .htaccess file. The website get's a 95% faster than other websites speed score and loads in 600ms with 6 requests. Cache busting is used on the css and javascript files so you never have to worry about old css or js files.

All files are aggressively cached. Don't re-use a file name for an image or pdf. Due to the caching it might hang around for a long time.

Files should be placed in /files. Images used for articles should be placed in /assets. Images used on the website for structure, favicons, etc... should be in /images.

The results and schedule pages use datatables with a json file. They are dynamically built to only show events in the future for the schedule page and only show events in the past for the results page. The json file is only cached 15 minutes.

Images have been compressed losslessly and in some instances quality has been reduced. Visually the files all look the same but they are 75% smaller. I used [tnypng](http://tinypng.com) and [ImageOptim](https://imageoptim.com/)

* [Original Authors Getting Started Guide](http://mmistakes.github.io/skinny-bones-jekyll/getting-started/)

You can make changes and submit a pull request.


