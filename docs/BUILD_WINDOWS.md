# Building the Android APK on Windows

The launcher and the game build on Windows without bash, MSYS or WSL. The Gradle task
`cargoBuild` (`android/app/build.gradle.kts`) runs `tools/android/cargo_android.ps1`
instead of the shell script; both drive the same `cargo build --lib -p th08 --target
<abi>-linux-android` with the NDK clang as linker.

## Requirements

- Rust 1.98.0 with the `aarch64-linux-android` target (`rustup`), a host linker for
  Rust builds (MSVC or a MinGW-w64 GCC), and `cargo` on `PATH`.
- JDK 17 (`JAVA_HOME`) — AGP 9.x needs it.
- Android SDK with `platforms;android-36`, `build-tools;36.0.0`, `platform-tools`
  and `ndk;27.1.12297006`, exported as `ANDROID_HOME` (or `ANDROID_SDK`) and
  `ANDROID_NDK_HOME`.
- Gradle 9.8.2 (the wrapper in `android/` downloads it, or call a local
  `gradle.bat` of the same version).

## Build

```powershell
$env:ANDROID_HOME = "C:\android-sdk"
$env:ANDROID_NDK_HOME = "C:\android-sdk\ndk\27.1.12297006"
$env:JAVA_HOME = "C:\jdk17"
$env:PATH = "C:\jdk17\bin;C:\android-sdk\platform-tools;$env:PATH"

# Public, data-free APK (release channel, com.zun.th08)
gradle.bat -p android assembleRelease `
  -Pth08.abis=arm64-v8a -Pth08.minSdk=26 -Pth08.profile=release `
  -Pth08.channel=release -Pth08.keystore=C:\path\keystore.properties `
  -Pth08.versionName=0.1.3+win.1 -Pth08.versionCode=1
```

- `-Pth08.data=<folder>` bundles `th08.dat`/`thbgm.dat` from that folder as
  uncompressed assets (the launcher then shows "Included in this app", no import).
  Such an APK contains copyrighted game data: never publish it.
- `-Pth08.minify=false` skips R8; use it on a low-memory host when the release build
  runs out of heap (the APK gets larger).
- `-Pth08.profile=dev` builds `libth08.so` without optimizations (slow game); keep
  `release`.
- `-Pth08.schemaFile=tools/android/settings_schema.json` copies the committed settings
  schema instead of running `cargo run -p th08-tools` for the host. That host build
  compiles the whole game (wgpu, winit, ...) and needs a lot of RAM; the committed
  file is the schema of this game version and is regenerated with
  `cargo run -q --release -p th08-tools --bin settings_schema -- <out>` when the host
  can afford it.

## Fork notes

- The application id is `com.zun.th08` (`.dev`/`.debug` for the other channels); the
  Kotlin package and the JNI export names follow it
  (`Java_com_zun_th08_*`, `com.zun.th08.BackBridge`, `com.zun.th08.GestureExclusion`).
- The launcher's update check is compiled off (`FORK_UPDATER` in `src/update.rs`):
  the upstream releases install as a different package and would replace a bundled
  personal build with the data-free one. Re-enable it only together with releases of
  this fork.

## Known limitations of a Windows host

- `target/` on a non-NTFS volume is slow; point `CARGO_TARGET_DIR` at an NTFS path.
- `git` needs `core.filemode=false` and a `safe.directory` entry on volumes that do
  not record ownership (exFAT).
