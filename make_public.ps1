$file = "index.html"
$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# Fix description meta tag and add OG/Twitter/Favicon
$oldMeta = '<meta name="description" content="Qprompter â€” Chrome extension for queuing and automating AI prompts across ChatGPT, Claude, Gemini and more.">'
$newMeta = @"
<meta name="description" content="Qprompter &mdash; Chrome extension for queuing and automating AI prompts across ChatGPT, Claude, Gemini and more.">
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<meta property="og:type" content="website">
<meta property="og:title" content="Qprompter | Queue, Automate, Avoid Headaches">
<meta property="og:description" content="Qprompter &mdash; Chrome extension for queuing and automating AI prompts across ChatGPT, Claude, Gemini and more.">
<meta property="og:image" content="/og-image.png">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Qprompter | Queue, Automate, Avoid Headaches">
<meta name="twitter:description" content="Qprompter &mdash; Chrome extension for queuing and automating AI prompts across ChatGPT, Claude, Gemini and more.">
<meta name="twitter:image" content="/og-image.png">
"@

if ($text.Contains($oldMeta)) {
    $text = $text.Replace($oldMeta, $newMeta)
    Write-Host "Updated meta tags."
} else {
    Write-Host "Meta tag not found! It might have been altered."
}

# Fix footer copyright and add Legal Links
$oldCopy = '<p class="font-mono text-[10px] tracking-[0.18em] uppercase text-zinc-600">Ã‚Â© <span data-ve-dynamic="true" style="display: contents;">2026</span> Qprompter &middot; All rights reserved</p>'
$newCopy = @"
<div class="flex flex-col sm:flex-row items-center gap-3 sm:gap-6">
<p class="font-mono text-[10px] tracking-[0.18em] uppercase text-zinc-600">&copy; <span data-ve-dynamic="true" style="display: contents;">2026</span> Qprompter &middot; All rights reserved</p>
<div class="flex items-center gap-4">
<a href="privacy.html" class="font-mono text-[10px] tracking-[0.18em] uppercase text-zinc-500 hover:text-white transition-colors">Privacy Policy</a>
<a href="terms.html" class="font-mono text-[10px] tracking-[0.18em] uppercase text-zinc-500 hover:text-white transition-colors">Terms of Service</a>
</div>
</div>
"@

# Note: The old html has the <p> right under the <div class="mt-12...">. We just replace the <p> with our new wrapping <div>.
if ($text.Contains($oldCopy)) {
    $text = $text.Replace($oldCopy, $newCopy)
    Write-Host "Updated footer legal links."
} else {
    Write-Host "Footer copyright line not found! Checking alternative encoding..."
    
    # Sometimes reading as UTF8 translates it differently, let's just do a regex replace
    $text = $text -replace '<p class="font-mono[^>]*>[^<]*<span data-ve-dynamic="true" style="display: contents;">2026</span> Qprompter &middot; All rights reserved</p>', $newCopy
    Write-Host "Applied regex fallback for footer."
}

[System.IO.File]::WriteAllText($file, $text, [System.Text.Encoding]::UTF8)
Write-Host "Done."
