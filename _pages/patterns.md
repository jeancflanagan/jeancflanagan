---
title: Patterns
layout: pattern
permalink: /patterns/
---

{% assign category = 'text' %}
{% assign patterns = site.patterns | where: 'category', category | sort: 'priority', 'last' %}

{% for pattern in patterns %}
  {% include meta/pattern--element.html %}
{% endfor %}
