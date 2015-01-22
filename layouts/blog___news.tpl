<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
</head>
<body>
<div id="wrap">
	<div id="header">
  <div id="header-inner">
   {% include "Langmenu" %}
   {% include "Search" %}
   <div class="clear"></div>
  </div>
	</div>
	<div id="container">
  {% include "Header" %}
  <div id="content">
  
  {% if tags %}
            <div class="blog tagged-list-header">
                <div class="header-tag-icon"></div>
                {% if tags == empty %}
                    {{ "no_posts_tagged" | lc }}
                {% else %}
                    {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                {% endif %}
            </div>
        {% endif %}
   {% addbutton class="add-article" %}
    
   {% for article in articles %}
   <div class="blogpost clearfix content-hyphenate">
    <table class="posthead">
     <tr>
      <td class="date">{{ article.created_at | format_date;"short" }}</td>
      <td>
       <h1><a href="{{ article.url }}">{{ article.title }}</a></h1>
       {{ article.author.name }}, <a href="{{ article.url }}#comments">{{ "comments" |lc }}: {{ article.comments_count }} </a>
      </td>
     </tr>
    </table>
     {{ article.excerpt }} <a href="{{ article.url }}">{{ "read_more" | lc }}</a>
   </div>
   {% endfor %}
  </div>
  <div id="footer">
   <div id="footer_cont" class="clearfix content-hyphenate">
   {% content name="footer"  xpage="true" %}
   </div>
   <ul id="footerul">
     <li><a class="rss" href="{{ page.url }}.rss"><img alt="" src="{{images_path}}/rss.gif?1"/> RSS</a></li>
     <li><div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div></li>
   </ul>
    <div class="clear"></div>
  </div>
	</div>
</div>
  {% include "JS" %}
</body>
</html>
