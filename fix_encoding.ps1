$path = "index.html"
$text = [System.IO.File]::ReadAllText($path)
$text = $text.Replace('Â·', '·')
$text = $text.Replace('Â©', '©')
$text = $text.Replace('â€”', '—')
[System.IO.File]::WriteAllText($path, $text, [System.Text.Encoding]::UTF8)
