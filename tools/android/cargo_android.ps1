# Windows twin of tools/android/cargo_android.sh: builds libth08.so per ABI with the NDK clang.
# The Gradle task cargoBuild (android/app/build.gradle.kts) calls this on Windows hosts; the shell script stays for
# Linux and macOS.
# usage: cargo_android.ps1 OUT_DIR ABI...
# Environment: ANDROID_SDK (else ANDROID_HOME), TH08_ANDROID_MIN_SDK (NDK API, default 26),
#              TH08_ANDROID_PROFILE (cargo profile, default release).
param(
    [Parameter(Mandatory = $true, Position = 0)][string]$OutDir,
    [Parameter(Position = 1, ValueFromRemainingArguments = $true)][string[]]$Abis = @()
)
$ErrorActionPreference = "Stop"

$repo = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
Push-Location $repo
try {
    $sdk = $env:ANDROID_SDK
    if (-not $sdk) { $sdk = $env:ANDROID_HOME }
    if (-not $sdk) { $sdk = Join-Path $env:USERPROFILE ".local\share\android-sdk\Sdk" }
    $api = $env:TH08_ANDROID_MIN_SDK
    if (-not $api) { $api = "26" }
    $profileName = $env:TH08_ANDROID_PROFILE
    if (-not $profileName) { $profileName = "release" }

    $ndk = $env:ANDROID_NDK_HOME
    if (-not $ndk) {
        $found = @(Get-ChildItem (Join-Path $sdk "ndk") -Directory -ErrorAction SilentlyContinue |
                   Sort-Object Name | Select-Object -Last 1)
        if ($found.Count -eq 0) { throw "Android NDK not found; set ANDROID_NDK_HOME" }
        $ndk = $found[0].FullName
    }
    $ndk = $ndk.TrimEnd('\')
    $bin = Join-Path $ndk "toolchains\llvm\prebuilt\windows-x86_64\bin"
    if (-not (Test-Path -LiteralPath (Join-Path $bin "clang.exe"))) {
        throw "NDK clang not found under $bin"
    }

    $cargo = (Get-Command cargo -ErrorAction Stop).Source
    $targetRoot = $env:CARGO_TARGET_DIR
    if (-not $targetRoot) { $targetRoot = Join-Path $repo "target" }

    if (Test-Path -LiteralPath $OutDir) { Remove-Item -LiteralPath $OutDir -Recurse -Force }
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

    [Environment]::SetEnvironmentVariable("ANDROID_NDK_HOME", $ndk, "Process")
    [Environment]::SetEnvironmentVariable("ANDROID_NDK_ROOT", $ndk, "Process")

    foreach ($abi in $Abis) {
        if ($abi -eq "arm64-v8a") { $arch = "aarch64" }
        elseif ($abi -eq "x86_64") { $arch = "x86_64" }
        else { throw "unknown ABI $abi" }
        $triple = "$arch-linux-android"
        # Windows environment names are case-insensitive, so the upper-case key also serves cc's CC_<target> lookup.
        $key = $triple.Replace("-", "_").ToUpper()
        $clang = Join-Path $bin "clang.exe"
        [Environment]::SetEnvironmentVariable("CARGO_TARGET_" + $key + "_LINKER", $clang, "Process")
        [Environment]::SetEnvironmentVariable("CC_" + $key, $clang, "Process")
        [Environment]::SetEnvironmentVariable("CXX_" + $key, $clang, "Process")
        [Environment]::SetEnvironmentVariable("AR_" + $key, (Join-Path $bin "llvm-ar.exe"), "Process")
        $ccFlags = "--target=$triple$api"
        [Environment]::SetEnvironmentVariable("CFLAGS_" + $key, $ccFlags, "Process")
        [Environment]::SetEnvironmentVariable("CXXFLAGS_" + $key, $ccFlags, "Process")
        # 16 KB page alignment for Android 15+ devices (NDK r27 does not default to it).
        $env:RUSTFLAGS = "-Clink-arg=--target=$triple$api -Clink-arg=-Wl,-z,max-page-size=16384"

        Write-Host "cargo build $triple ($profileName)"
        & $cargo build --locked --profile $profileName --lib -p th08 --target $triple
        if ($LASTEXITCODE -ne 0) { throw "cargo build failed for $abi" }

        $outDirName = $profileName
        if ($profileName -eq "dev") { $outDirName = "debug" }
        $so = Join-Path $targetRoot (Join-Path $triple (Join-Path $outDirName "libth08.so"))
        if (-not (Test-Path -LiteralPath $so)) { throw "missing $so" }
        $dest = Join-Path $OutDir $abi
        New-Item -ItemType Directory -Force -Path $dest | Out-Null
        Copy-Item -LiteralPath $so -Destination (Join-Path $dest "libth08.so") -Force
        & (Join-Path $bin "llvm-strip.exe") --strip-debug (Join-Path $dest "libth08.so")
        if ($LASTEXITCODE -ne 0) { throw "llvm-strip failed for $abi" }
    }
} finally {
    Pop-Location
}
