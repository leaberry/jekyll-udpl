---
layout: home
permalink: /
title: Utah Defensive Pistol League
image:
  feature: header/home-header01.jpg
---

<div class="tiles">
{% for post in site.posts limit: 4 %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->

