param([string[]]$Targets)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$headless = 'C:\tools\ghidra_12.1_PUBLIC\support\analyzeHeadless.bat'
$env:JAVA_HOME = 'C:\Program Files\Eclipse Adoptium\jdk-25.0.4.101-hotspot'
$outDir = Join-Path $repo 'work\census\ghidra'
$projectRoot = Join-Path $outDir 'projects'
New-Item -ItemType Directory -Force -Path $outDir, $projectRoot | Out-Null
$env:APPDATA = Join-Path $outDir 'appdata'
$env:GHIDRA_JAVA_OPTIONS = "-Duser.home=$(Join-Path $outDir 'home')"
New-Item -ItemType Directory -Force -Path $env:APPDATA, (Join-Path $outDir 'home') | Out-Null
if (-not $Targets -or $Targets.Count -eq 0) {
    $Targets = @('circuit_ega', 'circuit_cga', 'cycles_ega', 'cycles_cga', 'cycles_tandy')
}
foreach ($target in $Targets) {
    $image = Join-Path $repo "work\oracles\$target\image.bin"
    $projectDir = Join-Path $projectRoot $target
    New-Item -ItemType Directory -Force -Path $projectDir | Out-Null
    if (-not (Test-Path -LiteralPath $image)) {
        throw "Missing canonical image: $image"
    }
    & $headless $projectDir $target `
        -import $image `
        -loader BinaryLoader `
        -processor 'x86:LE:16:Real Mode' `
        -loader-baseAddr 0x0 `
        -scriptPath $PSScriptRoot `
        -postScript ghidra_inventory.java $target $outDir `
        -overwrite
    if ($LASTEXITCODE -ne 0) {
        throw "Ghidra failed for $target with exit code $LASTEXITCODE"
    }
}
