---
title: Patterns
layout: pattern
category: index
permalink: /patterns/
---

This is a collection of all of the patterns on [this site]({{ site.url }}), organized by [color](/patterns/color/), [text](/patterns/text/), modular [components](/patterns/component/), and other [interface](/patterns/interface/) elements. These patterns serve as living documentation for this site’s present design. They also prescribe use and specification for every element on the site. The source for these patterns is [on GitHub]({{ site.link.source }}).

Browse by:

<ul>
{% assign items = site.patterns-categories | sort: 'priority', 'last' %}
{% for item in items %}
  <li><a href="{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul>
