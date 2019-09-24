param (
    [switch]$all = $false
)

if ($all) {
    $files = Get-ChildItem -file -recurse -include *.png
}
else {
    $files = git diff --name-only HEAD "*.png"
}

foreach ($file in $files) {
    .\optipng.exe -o7 -nc -strip all $file
}