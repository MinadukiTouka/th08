# 东方永夜抄 Android 移植（TH08 / Imperishable Night 1.00d）

非官方、非盈利的 Android 移植，基于 [kauri-off/th08-rs](https://github.com/kauri-off/th08-rs)
（Rust 净室重写，GPL-3.0）二次开发。包名 **`com.zun.th08`**，只读取你自己合法持有的
`th08.dat` / `thbgm.dat`，仓库与公开 APK 均不包含任何游戏数据。

> **最新版本：v1.0.1**（2026-11-08）
> 下载：[th08-1.0.1-android-apk.apk](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/th08-1.0.1-android-apk.apk)
> 平台：Android 8.0+ / arm64-v8a · 约 20 MB · 不含游戏数据

[下载](#下载) · [安装](#安装) · [操作](#操作方式) · [常见问题](#常见问题) · [构建](#从源码构建) · [更新日志](#更新日志)

## 特性

- **触控（TH07 风格）**：任意位置拖动移动（模拟量位移，方向跟手、斜向不减速）、按住即射击
  （松手后 200 ms 尾）、第二根手指低速、单侧黑边放 B、标题/暂停/菜单由手势操作
- **单一 Esc 按钮**：左上角（默认）短按 = 键盘 Esc，长按 0.6 秒 = 移植菜单（触控布局、判定框等）
- **惯用手切换**：右手（Esc 左上 / B 右侧黑边）或左手（Esc 右上 / B 左侧黑边）
- **中文界面**：启动器、设置界面和移植菜单均为简体中文（复用原俄语槽位；游戏内文本保持原版/翻译包）
- **回放/演示输入锁定**：播放回放或标题待机 demo 时，触摸不会操控自机；回放本身仍正常驱动
- **60 fps 固定节奏**：在 90 Hz / 120 Hz 屏上请求并锁定 60 Hz
- 图标取自原版 `th08.exe`；存档、回放、音乐室可用

> 1.0.1 重点修复：回放/标题演示期间触摸仍能操控自机；移植菜单乱码；触屏录制的回放现在会
> 记录 8 方向移动（旧回放没有移动数据，见[常见问题](#常见问题)）。

## 下载

| 文件 | 大小 | SHA256 |
| --- | --- | --- |
| [th08-1.0.1-android-apk.apk](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/th08-1.0.1-android-apk.apk) | 20,503,754 B | `25c607276b0065799194887d6a4089dcfa2383250f2080ea8beef3ef85035fe0` |

- 发布页：[Releases](https://github.com/MinadukiTouka/th08/releases)
- 校验文件：[SHA256SUMS](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/SHA256SUMS)
- **不要下载、传播任何内含 `th08.dat` / `thbgm.dat` 的 APK**（自用包，体积约 493 MiB）。
  公开包永远不含游戏数据。

## 安装

1. 自备正版《东方永夜抄》**1.00d**，取出 `th08.dat` 与 `thbgm.dat`。
2. 在手机内部存储建目录 **`Download/th08/`**，把这两个文件放进去（文件名保持原样）：

   ```text
   /storage/emulated/0/Download/th08/th08.dat
   /storage/emulated/0/Download/th08/thbgm.dat
   ```

3. 安装 APK（Android 8.0+，arm64-v8a）。首次安装需要在系统里允许「安装未知来源应用」。
4. 打开应用，按启动器提示授予 **「所有文件访问」** 权限（Android 11+；启动器里有按钮）。
5. 启动器显示「已在 /Download/th08 找到 th08.dat」后即可开始。语言默认跟随系统：
   中文系统自动显示中文，其它系统可在启动器里切到「中文」。

也支持启动器里的「导入游戏文件」（转换到应用私有存储）作为备选，但推荐直接用 `Download/th08/`：
升级、重装、换数据都只是换文件，不用重新导入。

**仓库与公开 APK 均不含游戏数据**，请勿上传或分享原版文件。

## 操作方式

### 触屏（TH07 风格）

| 操作 | 作用 |
| --- | --- |
| 任意位置**拖动** | 自机跟手移动（模拟量 1:1，斜向不减速） |
| 按住 | 射击（松手后 200 ms 内继续射击） |
| **第二根手指**按住 | 低速（Focus） |
| 点**一侧黑边** | 放 Bomb（默认右侧；左手模式为左侧） |
| **Esc** 按钮 | 短按 = 暂停/返回（等同键盘 Esc）；长按 0.6 秒 = 移植菜单 |
| 菜单里滑动 / 点按 / 双指点击 | 移动光标 / 确认 / 返回 |
| 对话 | 点按推进，按住 0.5 秒跳过 |

设置 →「触屏操作 → 惯用手」可切换 **右手**（Esc 左上、B 右黑边）或 **左手**（Esc 右上、B 左黑边）。

回放播放和标题待机演示期间，触摸会被忽略，自机完全由回放/演示输入驱动。

### 键盘 / 手柄

- 键盘：方向键移动，`Z` 射击，`X` Bomb，`Shift` 低速，`Esc` 暂停
- 手柄：摇杆/十字键移动，按键射击/Bomb/低速，`Select` 打开移植菜单

公开 Release 的 APK 不含游戏数据；请勿在任何地方上传、共享原版数据文件。

## 存档与备份

- Android 的存档、回放、设置都在应用私有目录：
  `/data/user/0/com.zun.th08/files/`
- **卸载应用会删除这些文件**（包括存档）。换机、换签名、卸载前，先在启动器里
  「导出存档」，需要时再「导入存档」。
- 系统 Auto Backup 开启时，会备份 `score.dat`、`th08.cfg`、`port.cfg`、`replay/`，
  不会备份游戏数据和翻译包。

## 常见问题

**启动器说找不到游戏数据？**
确认路径是 `Download/th08/th08.dat`（不是 `Download/th08.dat`，也不是解压后的子目录），
文件名不要改；再确认已授予「所有文件访问」。Android 11 以下按启动器提示授予存储权限。

**安装被拒绝 / 提示未知来源？**
在系统设置里允许文件管理器或浏览器安装未知应用；荣耀等系统还会弹一次「来历不明的应用」，
需要手动点「继续」。

**移植菜单是方块字？**
1.0.1 已修复：内置了 Noto Sans 子集字体，中文走 `ru` 槽也会安装 CJK 字体。
如果仍是方块，确认装的是 1.0.1，而不是旧的 1.0.0。

**回放里自机不动？**
1.0.1 之前录制的**触屏**回放没有记录方向数据，无法追溯修复；1.0.1 之后新录的回放会记录
8 方向移动，能正常走位（近似路径，不是 1:1 轨迹）。键盘/手柄录制的回放不受影响。

**高刷屏上速度变快？**
1.0.x 会请求并锁定 60 Hz。若仍异常，检查系统显示设置里是否强制了高刷/关闭了应用的
刷新率切换；ColorOS 等系统可以在「显示与亮度 → 屏幕刷新率」里确认当前模式。

**支持手柄吗？**
支持。Android 上手柄的 Select 打开移植菜单；触屏和手柄可以同时存在。

**为什么 APK 只有 20 MB？**
因为不含 `th08.dat` / `thbgm.dat`。游戏数据需要你自己从正版 1.00d 中取出并放到
`Download/th08/`。这也是本仓库能公开分发的原因。

## 从源码构建

Windows 宿主（无需 WSL/MSYS）的完整说明见
[docs/BUILD_WINDOWS.md](docs/BUILD_WINDOWS.md)。要求：

- Rust 1.98 + `aarch64-linux-android` target，GNU host（MinGW-w64 链接器）
- JDK 17、Gradle 9.8.2、Android SDK 36 / build-tools 36.0.0、NDK r27b
- `ANDROID_HOME` / `ANDROID_NDK_HOME` / `JAVA_HOME`

公开包（无数据，可发布）：

```bat
gradle.bat -p android assembleRelease ^
  -Pth08.abis=arm64-v8a -Pth08.minSdk=26 -Pth08.profile=release ^
  -Pth08.channel=release -Pth08.keystore=path\to\keystore.properties ^
  -Pth08.versionName=1.0.1 -Pth08.versionCode=446700 ^
  -Pth08.schemaFile=tools/android/settings_schema.json
```

自用包加 `-Pth08.data=<含 th08.dat/thbgm.dat 的目录>`，会把数据作为不压缩 assets 打进 APK；
**这种包包含版权数据，绝对不能发布**。

其他说明：

- `-Pth08.minify=false` 关闭 R8，低内存机器上更快，但 APK 更大。
- `-Pth08.profile=dev` 会得到未优化的 `libth08.so`，游戏会变慢；发布务必用 `release`。
- 只打 `arm64-v8a`；`x86_64` 模拟器需要自行加 ABI，未做验证。
- 版本号规则：`versionCode` 单调递增；1.0.1 为 `446700`。

## 已验证设备

| 设备 | 系统 | 结果 |
| --- | --- | --- |
| OnePlus PJE110 | Android 16，120 Hz 面板 | 1.0.0：60 Hz 锁定、中文界面、左右手切换、手动数据目录正常；1.0.1 待复测 |
| 荣耀畅玩50 JDY-AN00 | Android 14 | 1.0.1：中文启动器/移植菜单、回放播放且触摸无效、Stage 1 + Boss、续关、存档正常 |

触控、高刷、音频、安装体积都必须在真机上验证；模拟器只能做冒烟测试。

## 更新日志

### 1.0.1（2026-11-08）

- 修复：回放播放与标题待机演示期间，触摸拖动仍能操控自机
- 修复：回放/演示期间自机被完全冻结（触屏录制现在会把拖动写入 8 方向按键字；
  新录的回放可正常走位，旧回放无移动数据）
- 修复：移植菜单（长按 Esc）乱码（中文走 `ru` 槽，现在按 `ru` 安装 CJK 字体并内置
  Noto Sans 子集兜底）
- 触屏回放录制、惯用手、单 Esc、手动数据目录等 1.0.0 已有功能保持

### 1.0.0（2026-11-07）

首个正式版：TH07 风格触控、单 Esc、惯用手、中文启动器、60 fps 锁定、图标、
`Download/th08` 手动数据目录。

完整记录见 [CHANGELOG.md](CHANGELOG.md)。

## 源码结构

```text
android/                Gradle 工程、Kotlin Compose 启动器、JNI
crates/th08-core/       输入、回放、玩家、游戏逻辑
crates/th08-render/     wgpu 渲染、文字、安全区
crates/th08-audio/      cpal/AAudio、BGM
src/platform/touch.rs   触控 overlay
src/platform/portmenu.rs 移植菜单（egui）
src/i18n.rs             语言表与 CJK 字体
i18n/ru.toml            中文（复用 ru 槽）
docs/BUILD_WINDOWS.md   Windows 构建说明
```

## 许可与致谢

- 代码：**GPL-3.0-or-later**（继承上游）；修改后的源码以本仓库形式提供
- 上游：`kauri-off/th08-rs`（净室重写与 Android 层）；触控方案参考 `some100/th07` 的
  reallyportable 分支（TH07 移植）
- 翻译：Touhou Patch Center（thpatch.net）及其贡献者，CC BY-SA 4.0
- 游戏文本/素材：Team Shanghai Alice / ZUN

问题反馈：[GitHub Issues](https://github.com/MinadukiTouka/th08/issues)

## 免责声明 / Disclaimer / 免責事項

**中文**：本项目为非官方、非盈利的技术研究项目，与上海爱丽丝幻乐团及 ZUN 无任何关联。
《东方永夜抄 ～ Imperishable Night.》的著作权归上海爱丽丝幻乐团及 ZUN 所有。
本项目不包含任何原版游戏数据；使用者必须合法持有原作，仅在个人、非商业环境中使用；
不得以任何形式分发原版游戏数据。

**English**: This is an unofficial, non-commercial fan project, not affiliated with Team Shanghai
Alice or ZUN. Touhou 8 and all game assets belong to Team Shanghai Alice. This repository and its
public APKs contain no game data: you must own a legitimate copy and use it for personal,
non-commercial purposes only. Never redistribute the original data files.

**日本語**：本プロジェクトは非公式・非営利の技術研究プロジェクトであり、上海アリス幻楽団および
ZUN とは一切関係ありません。『東方永夜抄 ～ Imperishable Night.』の著作権は上海アリス幻楽団に
帰属します。本リポジトリと公開 APK にはゲームデータを含みません。正規品を所有する個人が
非営利で利用する場合に限ります。ゲームデータの再配布は禁止です。
