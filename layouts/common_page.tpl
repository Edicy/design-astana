    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
{% include "SiteHeader" %}
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
  <div id="content" class="clearfix content-hyphenate" data-search-indexing-allowed="true">
   {% content %}
  </div>
  <div id="footer">
   <div id="footer_cont" class="clearfix content-hyphenate">
   {% content name="footer" xpage="true" %}
   </div>
   <ul id="footerul">
     <li><div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div></li>
   </ul>
    <div class="clear"></div>
  </div>
	</div>
</div>
  {% include "JS" %}
</body>
</html>
