
### DeepMI Alumni


{% for alum in site.data.alumni %}
<hr>
<div id = "{{alum.name}}" style="padding-top: 60px; margin-top: -60px;">
<p><strong>{{alum.name}}</strong>  <br> <em>{{alum.position}}</em><br>
{% if alum.startdate %} {{alum.startdate}} - {% endif %}{{alum.enddate}} <br>
Subsequent Position: {{alum.current}} </p>
</div> {% endfor %}

{% if site.data.visitors %}
<br>
### DeepMI Visitors
{% endif %}

{% for visitor in site.data.visitors %}
<hr>
<div id = "{{visitor.name}}" style="padding-top: 60px; margin-top: -60px;">
<p><strong>{{visitor.name}}</strong>  <br> <em>{{visitor.position}} from {{visitor.current}}</em><br>
{% if visitor.startdate %} {{visitor.startdate}} - {% endif %}{{visitor.enddate}}
</p>
</div> {% endfor %}
