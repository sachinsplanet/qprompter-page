$file = "g:\qprompter-landing.html"
$text = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
$missingCss = @"
<style id="injected-tailwind-fixes">
/* Critical missing tailwind classes for the mobile menu */
.translate-x-full { 
  --tw-translate-x: 100%; 
  transform: translate(var(--tw-translate-x), var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y)) !important; 
}
.-translate-x-full { 
  --tw-translate-x: -100%; 
  transform: translate(var(--tw-translate-x), var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y)) !important; 
}
@media (min-width: 768px) {
  .md\:hidden { display: none !important; }
}
</style>
</head>
"@

if (-not $text.Contains("injected-tailwind-fixes")) {
    $text = $text.Replace("</head>", $missingCss)
    [System.IO.File]::WriteAllText($file, $text, [System.Text.Encoding]::UTF8)
    Write-Host "Injected missing CSS classes to qprompter-landing.html."
}
