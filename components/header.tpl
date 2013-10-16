<!--[if IE]>
<style type="text/css">
fci-editor-menuadd img {
position: relative;
top: 3px;
}
</style>
<![endif]-->
  <div id="logo">
   <h1 class="clearfix">{% editable site.header %}</h1>
  </div>
  <div id="mainmenu">
   <p>
    {% unless site.root_item.hidden? %}<a{% if site.root_item.selected? %} class="active" {% endif %} href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>{% endunless %}
{% if site.root_item.blog? %}
{% assign bloglink = item.url %}
{% endif %}
   {% for item in site.visible_menuitems %}
    <a{% if item.selected? %} class="active" {% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %} href="{{ item.url }}">{{ item.title }}</a>
{% if item.blog? %}
        {% assign bloglink = item.url %}
      {% endif %}
   {% endfor %}
      {% menubtn site.hidden_menuitems %}
   {% menuadd %}
   </p>
  </div>
  {% for item in site.all_menuitems %}
   {% if item.selected? %}
    {% if editmode %}
  <div id="submenu">
   <p>
   {% for level2 in item.visible_children %}
    <a{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level2.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level2.url }}">{{ level2.title }}</a>
   {% endfor %}
   {% menubtn item.hidden_children %}
    {% menuadd parent="item" %}
   </p>
  </div>
    {% else %}
     {% if item.children? %}
  <div id="submenu">
   <p>
   {% for level2 in item.all_children %}
    <a{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level2.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level2.url }}">{{ level2.title }}</a>
   {% endfor %}
   </p>
  </div>
     {% endif %}
    {% endif %}
    {% for level2 in item.all_children %}
{% if level2.blog? %}
{% assign bloglink = level2.url %}
{% endif %}
     {% if level2.selected? %}
      {% if editmode %}
  <div id="thirdmenu">
   <p>
   {% for level3 in level2.visible_children %}
    <a{% if level3.selected? %} class="active"{% endif %}{% unless level3.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level3.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level3.url }}">{{ level3.title }}</a>
{% if level3.blog? %}
{% assign bloglink = level3.url %}
{% endif %}
   {% endfor %}
   {% menubtn level2.hidden_children %}
    {% menuadd parent="level2" %}
   </p>
   <div class="clear"></div>
  </div>
      {% else %}
       {% if level2.children? %}
  <div id="thirdmenu">
   <p>
   {% for level3 in level2.all_children %}
    <a{% if level3.selected? %} class="active"{% endif %}{% unless level3.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level3.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level3.url }}">{{ level3.title }}</a>
{% if level3.blog? %}
{% assign bloglink = level3.url %}
{% endif %}
   {% endfor %}
   </p>
   <div class="clear"></div>
  </div>
       {% endif %}
      {% endif %}
     {% endif %}
    {% endfor %}
   {% endif %}
  {% endfor %}
<div class="clear"></div>

