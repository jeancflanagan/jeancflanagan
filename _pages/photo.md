---
title: Selected photos
layout: selected
permalink: /photos/
description: 'Selected photography by Jean Flanagan.'
image:
  - src: 2012-11-04-orange-maple-leaves.jpg

---

<div class="featured block--wide">
{% for post in site.categories.photo %}
  {% if post.option contains 'featured' %}
{% include block/item--featured.html %}
  {% endif %}
{% endfor %}
</div>

<div class="block--narrow">
<hr>
</div>

{% for post in site.categories.photo %}
  {% unless post.option contains 'featured' %}
{% include block/item.html %}
  {% endunless %}
{% endfor %}
