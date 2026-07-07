import re

with open("index.html", "r", encoding="utf-8") as f:
    content = f.read()

# Try to insert newlines to make it somewhat readable
formatted = re.sub(r'(<div|<section|<header|<nav|<footer|<main|<h1|<h2|<h3|<p|<a|<ul|<li|<button)', r'\n\1', content)
formatted = re.sub(r'(</div|</section|</header|</nav|</footer|</main|</h1|</h2|</h3|</p|</a|</ul|</li|</button>)', r'\1\n', formatted)
# Remove multiple newlines
formatted = re.sub(r'\n+', '\n', formatted)

with open("index.html", "w", encoding="utf-8") as f:
    f.write(formatted)
