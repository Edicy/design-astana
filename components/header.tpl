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
   <ul>
    {% unless site.root_item.hidden? %}<li><a{% if site.root_item.selected? %} class="active" {% endif %} href="{{ site.root_item.url }}">{{ site.root_item.title }}</a></li>{% endunless %}
{% if site.root_item.blog? %}
{% assign bloglink = item.url %}
{% endif %}
   {% for item in site.visible_menuitems %}
    <li><a{% if item.selected? %} class="active" {% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %} href="{{ item.url }}">{{ item.title }}</a></li>
{% if item.blog? %}
        {% assign bloglink = item.url %}
      {% endif %}
   {% endfor %}
      <li>{% menubtn site.hidden_menuitems %}</li>
   <li>{% menuadd %}</li>
   </ul>
  </div>
  {% for item in site.all_menuitems %}
   {% if item.selected? %}
    {% if editmode %}
  <div id="submenu">
   <ul>
   {% for level2 in item.visible_children %}
    <li><a{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level2.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level2.url }}">{{ level2.title }}</a></a></li>
   {% endfor %}
   <li>{% menubtn item.hidden_children %}</li>
    <li>{% menuadd parent="item" %}</li>
   </ul>
  </div>
    {% else %}
     {% if item.children? %}
  <div id="submenu">
   <ul>
   {% for level2 in item.all_children %}
    <li><a{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level2.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level2.url }}">{{ level2.title }}</a></li>
   {% endfor %}
   </ul>
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
   <ul>
   {% for level3 in level2.visible_children %}
    <li><a{% if level3.selected? %} class="active"{% endif %}{% unless level3.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level3.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level3.url }}">{{ level3.title }}</a></li>
{% if level3.blog? %}
{% assign bloglink = level3.url %}
{% endif %}
   {% endfor %}
   {% menubtn level2.hidden_children %}
    {% menuadd parent="level2" %}
   </ul>
   <div class="clear"></div>
  </div>
      {% else %}
       {% if level2.children? %}
  <div id="thirdmenu">
   <ul>
   {% for level3 in level2.all_children %}
    <li><a{% if level3.selected? %} class="active"{% endif %}{% unless level3.translated? %} class="untranslated fci-editor-menuadd" {% endunless %}{% unless level3.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{ level3.url }}">{{ level3.title }}</a></li>
{% if level3.blog? %}
{% assign bloglink = level3.url %}
{% endif %}
   {% endfor %}
   </ul>
   <div class="clear"></div>
  </div>
       {% endif %}
      {% endif %}
     {% endif %}
    {% endfor %}
   {% endif %}
  {% endfor %}
<div class="clear"></div>

