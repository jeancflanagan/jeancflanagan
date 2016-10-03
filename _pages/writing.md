---
title: Selected articles
layout: selected
permalink: /writing/
description: 'Selected writing by Jean Flanagan.'

---

<div class="featured block--wide">
{% for post in site.categories.writing %}
  {% if post.option contains 'featured' %}
{% include block/item--featured.html %}
  {% endif %}
{% endfor %}
</div>

<div class="block--narrow">
<hr>
</div>

{% for post in site.categories.writing %}
  {% if post.option contains 'selected' %}
{% include block/item.html %}
  {% endif %}
{% endfor %}
