---
layout: archive
# This is the article index page
# Every article should have "categories: articles" in the yaml
# Every article should provide a teaser image about 400x250
# If desired a feature image should be 1024x256
# All images should be in /assets/IMGNAME
# Example
# layout: article
# categories: articles
# image:
#   feature: assets/feature.jpg
#   teaser: assets/teaser.jpg
#   credit: "Name of Person who gets credit for photo"
#   creditlink: http://address/to/image_or_article

---

<div class="tiles">
{% for post in site.categories.articles %}
	{% include post-grid-images.html %}
{% endfor %}
</div><!-- /.tiles -->