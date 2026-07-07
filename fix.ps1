$text = [System.IO.File]::ReadAllText("index.html")

# Fix 1 & 2: Queue ... Automate ... Avoid Headaches
$text = $text -replace 'Queue A.* Automate A.* Avoid Headaches', 'Queue &middot; Automate &middot; Avoid Headaches'
$text = $text -replace 'Queue A\? Automate A\? Avoid Headaches', 'Queue &middot; Automate &middot; Avoid Headaches'
$text = $text -replace 'Queue .* Automate .* Avoid Headaches', 'Queue &middot; Automate &middot; Avoid Headaches'

# Fix 3: Add to Chrome ... Free
$text = $text -replace 'Add to Chrome .* Free', 'Add to Chrome &mdash; Free'

# Fix 4: Copyright
$text = $text -replace 'A,Ac <span', '&copy; <span'
$text = $text -replace 'Ac <span', '&copy; <span'
$text = $text -replace 'Qprompter A.* All rights reserved', 'Qprompter &middot; All rights reserved'
$text = $text -replace 'Qprompter .* All rights reserved', 'Qprompter &middot; All rights reserved'

# Fix 5: Manifest V3
$text = $text -replace 'Manifest V3 A.* No data collection A.* 100% local storage', 'Manifest V3 &middot; No data collection &middot; 100% local storage'
$text = $text -replace 'Manifest V3 .* No data collection .* 100% local storage', 'Manifest V3 &middot; No data collection &middot; 100% local storage'

# Also fix "built on manifest v3 ... no deprecated hacks" which had a dash
$text = $text -replace 'built on manifest v3 .* no deprecated hacks', 'built on manifest v3 &mdash; no deprecated hacks'
$text = $text -replace 'stays in local Chrome storage on your machine. Nothing is sent to a server', 'stays in local Chrome storage on your machine. Nothing is sent to a server' # Just checking
$text = $text -replace 'The queue is bound to the tab it started on. If you close that tab, the run stops there .* reopen it and pick up', 'The queue is bound to the tab it started on. If you close that tab, the run stops there &mdash; reopen it and pick up'
$text = $text -replace 'Everything .* your queue, templates, and history .* stays in local', 'Everything &mdash; your queue, templates, and history &mdash; stays in local'
$text = $text -replace 'Close Chrome, reopen .* queue picks up where it left off', 'Close Chrome, reopen &mdash; queue picks up where it left off'
$text = $text -replace 'qprompter .* bg\.worker\.js', 'qprompter &mdash; bg.worker.js'

[System.IO.File]::WriteAllText("index.html", $text, [System.Text.Encoding]::UTF8)
