   <meta name="keywords" content="{{ page.keywords }}" />
   <meta name="description" content="{{ page.description }}" />
   <meta name="copyright" content="{{ site.copyright }}" />
   <meta name="author" content="{{ site.author }}" />
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <script src="{{ javascripts_path }}/modernizr.js"></script>
   {% if site.search.enabled %}{% stylesheet_link "assets/site_search/3.0/style.css?1" static_host="true" %}{% endif %}
   {% stylesheet_link "style.css?astana1" %}
   {% if editmode %}<link href="{{ site.static_asset_host }}/assets/admin/editmode.css" media="screen" rel="stylesheet" type="text/css"/>{% endif %}

    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/ico" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<!--[if IE6]>
<style>
  #header {
  height: 57px;
  }
  </style>
<![endif]-->
<!--[if IE]><link rel="stylesheet" href="http://static.edicy.com/assets/ie.css" type="text/css" /><![endif]-->
<title>{% if article %}{{ article.title }} | {{page.site_title}}{% else %}{{page.site_title}} | {{ page.title }}{% endif %}</title>
