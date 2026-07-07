$files = @("g:\qprompter-landing.html", "g:\qprompter landing page\index.html")

foreach ($file in $files) {
    if (Test-Path $file) {
        $text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

        # Fix 1: appearance: button
        $text = $text -replace '-webkit-appearance:\s*button;\s*/\*\s*1\s*\*/', '-webkit-appearance: button; appearance: button; /* 1 */'
        $text = $text -replace '-webkit-appearance:\s*button;', '-webkit-appearance: button; appearance: button;'

        # Fix 2: appearance: textfield
        $text = $text -replace '-webkit-appearance:\s*textfield;\s*/\*\s*1\s*\*/', '-webkit-appearance: textfield; appearance: textfield; /* 1 */'
        $text = $text -replace '-webkit-appearance:\s*textfield;', '-webkit-appearance: textfield; appearance: textfield;'

        # Fix 3: vertical-align: middle (ignored because display: block)
        $text = $text -replace 'vertical-align:\s*middle;\s*/\*\s*2\s*\*/', '/* vertical-align removed for block */'
        
        # In case the comment is different or missing in index.html due to minification
        $text = $text -replace 'display:\s*block;\s*vertical-align:\s*middle;', 'display: block;'

        # Fix 4: line-clamp
        $text = $text -replace '-webkit-line-clamp:\s*1;', '-webkit-line-clamp: 1; line-clamp: 1;'

        # Fix 5: empty style attribute
        $text = $text -replace ' style=""', ''

        [System.IO.File]::WriteAllText($file, $text, [System.Text.Encoding]::UTF8)
    }
}
