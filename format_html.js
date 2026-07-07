const fs = require('fs');
let content = fs.readFileSync('index.html', 'utf8');

content = content.replace(/(<div|<section|<header|<nav|<footer|<main|<h1|<h2|<h3|<p|<a|<ul|<li|<button)/g, '\n$1');
content = content.replace(/(<\/div|<\/section|<\/header|<\/nav|<\/footer|<\/main|<\/h1|<\/h2|<\/h3|<\/p|<\/a|<\/ul|<\/li|<\/button>)/g, '$1\n');
content = content.replace(/\n+/g, '\n');

fs.writeFileSync('index.html', content, 'utf8');
