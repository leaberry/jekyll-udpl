---
layout: home
permalink: /
title: Utah Defensive Pistol League
image:
  feature: home-header.jpg
---

<div class="tiles">
{% for post in site.posts limit: 8 %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->

