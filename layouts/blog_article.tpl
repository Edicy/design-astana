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
   <table class="posthead">
    <tr>
     <td class="date">{{ article.created_at | format_date:"short" }}</td>
     <td>
      <h1>{% editable article.title plain="true" %}</h1>
      {{ article.author.name }}, <a href="#comments">{{ "comments" |lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></a>
     </td>
    </tr>
   </table>
<div class="clearfix content-hyphenate" data-search-indexing-allowed="true">
   {% editable article.excerpt %}
</div>
   <br/>
<div class="clearfix content-hyphenate" data-search-indexing-allowed="true">
   {% editable article.body %}
</div>
    {% if editmode %}
        <div class="article-tags">
            <div class="article-tag-icon"></div>
            {% editable article.tags %}
        </div>
      {% else %}
        {% unless article.tags == empty %}
            <div class="cfx article-tags">
                <div class="article-tag-icon"></div>
                {% for tag in article.tags %}
                    <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                {% endfor %}
            </div>
        {% endunless %}
    {% endif %}


   {% if article.comments %}
    
<div id="comments">
  <div id="left-comment-count"><h2>{{ "comments" |lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2></div>
  <div id="right-comments">
    <table>
      {% for comment in article.comments %}
      <tr class="edy-site-blog-comment content-hyphenate">
        <td class="author">
          <h2>{{ comment.author }}</h2>{{ comment.created_at | format_date:"short" }} {% removebutton %}</td>
        <td>{{ comment.body_html }}</td>
      </tr>
      {% endfor %}
    </table>
  </div>
</div> 
    <div class="clearfix"></div>

   {% endif %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
   {% commentform %}
   <table id="commentform">
    <tr>
     <td rowspan="4"><h2>{{ "add_a_comment" |lc }}: </h2></td>
     <td>
      {{ "name" |lc }}: </td>
     <td><input type="text" name="comment[author]" value="{{comment.author}}"/>
     </td>
    </tr>
    <tr>
     <td>{{ "email" |lc }}: </td>
     <td><input type="text" name="comment[author_email]" value="{{comment.author_email}}"/>
    </tr>
    <tr>
     <td>{{ "comment" |lc }}: </td>
     <td><textarea cols="15" rows="5" name="comment[body]">{{comment.body}}</textarea></td>
    </tr>
    <tr>
      <td></td><td><input class="submit" type="submit" value="{{ "submit" |lc }}"></td>
    </tr>
   </table>
   {% endcommentform %}
  </div>
  <div id="footer">
   <div id="footer_cont" class="clearfix content-hyphenate">
   {% content name="footer" xpage="true" %}
   </div>
   <ul id="footerul">
     <li><a class="rss" href="{{ bloglink }}.rss"><img alt="" src="{{images_path}}/rss.gif?1"/> RSS</a></li>
     <li><div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div></li>
   </ul>
    <div class="clear"></div>
  </div>
	</div>
</div>
       {% include "JS" %}
</body>
</html>
