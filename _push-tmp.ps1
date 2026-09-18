$ErrorActionPreference = "Stop"
$envFile = "C:\Users\isaac\.openclaw\workspace\.env"
$tok = $null
Get-Content $envFile | ForEach-Object {
  if ($_ -match '^\s*GITHUB_TOKEN_WEB_CONSER\s*=\s*(.+?)\s*$') { $tok = $Matches[1].Trim().Trim([char]34) }
}
if (-not $tok) { Write-Error "GITHUB_TOKEN_WEB_CONSER no encontrado en .env"; exit 1 }
$repo = "C:\Users\isaac\.openclaw\workspace\_amesmusicas"
git -C $repo add -A
git -C $repo -c user.name=web_conser -c user.email=web@conservatoriopurhepecha.com commit -m "Agrega ficha y portada del libro Por Santa Cecilia que suene la musica"
git -C $repo push "https://x-access-token:$tok@github.com/hiborgesm/conservatorio-site.git" main
exit $LASTEXITCODE
