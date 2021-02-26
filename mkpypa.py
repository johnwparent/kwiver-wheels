import os, sys, glob

pypa_index_template = """
<html>
<head><title>Kwiver Wheel</title></head>
<body>
<h1>Kwiver Wheel</h1>
<pre>
{body}
</pre>
</body>
"""

index_tag = """<a href="{link_name}" download="{link_name}">{link_name}</a>"""

wheel_list = []
os.chdir("./pages")
for f in glob.glob("*.whl"):
    wheel_list.append(f)

index = ""
for wheel in wheel_list:
    index += index_tag.format(link_name=wheel)+'\n'

with open("index.html",'w') as idx_file:
    idx_file.write(pypa_index_template.format(body=index))
