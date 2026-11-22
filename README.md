# 东方永夜抄 Android 原生移植（TH08 / Imperishable Night 1.00d）— MinadukiTouka

这是 **MinadukiTouka** 制作的《东方永夜抄 ～ Imperishable Night.》（TH08，1.00d）**Android 原生移植**：
免模拟器、arm64-v8a 原生 APK，包名 **`com.zun.th08`**。基于
[kauri-off/th08-rs](https://github.com/kauri-off/th08-rs)（Rust 净室重写，GPL-3.0）二次开发，
只读取你自己合法持有的 `th08.dat` / `thbgm.dat`。

An Android native port of **Touhou 8: Imperishable Night** (TH08, 1.00d) by **MinadukiTouka** —
a native arm64-v8a APK, no emulator required.

关键词：东方永夜抄、TH08、Imperishable Night、东方Project、弹幕射击、Android 移植、安卓原生移植、MinadukiTouka、APK 下载。

> **最新版本：v1.0.1**（2026-11-08）
> 下载：[th08-1.0.1-android-apk.apk](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/th08-1.0.1-android-apk.apk)
> 平台：Android 8.0+ / arm64-v8a · 约 20 MB · 公开包不含游戏数据
> 测试与反馈 QQ 群：**1074127230**

[这个仓库是什么](#这个仓库是什么) · [下载](#下载) · [安装](#安装) · [操作](#操作方式) · [常见问题](#常见问题) · [构建](#从源码构建) · [更新日志](#更新日志)

## 这个仓库是什么

这是 **MinadukiTouka** 个人维护的《东方永夜抄》Android 原生移植项目。它不是模拟器，也不是把原版
`th08.exe` 套一层 Wine/Box64，而是基于 `kauri-off/th08-rs` 的 Rust 净室重写：游戏逻辑、wgpu 渲染、
AAudio 音频和输入层编译成 arm64-v8a 原生库，配一个 Kotlin Compose 启动器。

- **是什么**：TH08 1.00d 的 Android 原生移植；包名 `com.zun.th08`；支持触屏、手柄、键盘；
  中文启动器/设置/移植菜单；60 fps 锁定；存档、回放、音乐室。
- **不是什么**：不是官方作品；不是模拟器；不是原版游戏镜像；不是破解版；公开包不含
  `th08.dat` / `thbgm.dat`。
- **代码从哪来**：上游 `kauri-off/th08-rs`（GPL-3.0-or-later），本仓库是 Android 产品化分支：
  包名、启动器、触控、中文化、数据加载、签名与发布。
- **游戏数据从哪来**：需要你自己从正版《东方永夜抄》1.00d 中取出 `th08.dat` 和 `thbgm.dat`；
  本仓库的源码与公开包不包含游戏数据。
- **适合谁**：想在 Android 手机上用触屏/手柄玩 TH08、并且已经拥有正版游戏数据的玩家；
  以及想研究 Rust 游戏移植/Android NativeActivity 的开发者。

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
- **公开包可以自由传播、转载、镜像**；它只含 GPL 代码和自制资源，不含 `th08.dat` / `thbgm.dat`。

## 安装

公开包不含游戏数据，下面三种方式任选一种。推荐前两种，不需要改系统权限。

### 方式一：用 MT 管理器把数据放进 APK（无需存储权限）

适合想“装完即玩”、不想开「所有文件访问」的人。需要先自备 `th08.dat` 和 `thbgm.dat`。

1. 如果旧版还能打开，先在启动器里 **导出存档**；改过签名的 APK 不能覆盖安装，需要先卸载旧版。
2. 用 **MT 管理器** 打开公开 APK，进入 **`assets/`** 根目录（不是 `assets/th08/`）。
3. 添加两个文件，文件名保持小写：

   ```text
   assets/th08.dat
   assets/thbgm.dat
   ```

   不要删除原有的 `assets/settings_schema.json` 等文件。

4. 添加时保持 **不压缩 / Store**。游戏是用 `AAsset_openFileDescriptor64` 直接读 APK 内偏移的；
   如果这两个文件被 zip 压缩，启动会报 `APK asset ... is not stored uncompressed`。
5. 退出编辑，用 MT 管理器的 **APK 签名** 功能重新签名，生成新的 APK。
6. 卸载旧版（会丢存档，所以第 1 步要先导出），安装新 APK（允许「未知来源」）。启动器显示
   「已内置于本应用」即成功。

> 改完的 APK 约 493 MiB，签名与原版不同；它是含原版数据的个人副本，请不要二次分发。

### 方式二：启动器「导入游戏文件」（无需存储权限）

1. 打开应用，在「游戏数据」一栏点 **导入游戏文件**。
2. 选择 `th08.dat` 和 `thbgm.dat`；应用会校验并转换成 `th08.pak` / `thbgm.pak`，存到应用私有目录。
3. 转换约 1 分钟，期间保持应用在前台；需要足够的剩余空间。
4. 完成后状态显示「已导入」，直接 Play。

这个方式不需要「所有文件访问」，也不会弹权限窗；缺点是会额外占用一份私有空间，卸载应用会一起删除。

### 方式三：手动放到 Download/th08（需要手动开权限）

公开包**不会自动弹存储权限窗**。要用这个方式，必须手动开启「所有文件访问」：

1. 把 `th08.dat`、`thbgm.dat` 放到：

   ```text
   /storage/emulated/0/Download/th08/th08.dat
   /storage/emulated/0/Download/th08/thbgm.dat
   ```

2. 在启动器里点 **「允许访问 Download」**，会跳到系统设置；打开本应用的「所有文件访问」。
3. 回到应用，状态应显示「已在 /Download/th08 找到 th08.dat」。

如果没有开启「所有文件访问」，应用会直接忽略 `Download/th08`，也不会弹窗提醒——这不是路径写错，
是权限没开。Android 11+ 的这个权限本身就没有运行时弹窗，只能去系统设置里手动开。

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

## 存档与备份

- Android 的存档、回放、设置都在应用私有目录：
  `/data/user/0/com.zun.th08/files/`
- **卸载应用会删除这些文件**（包括存档）。换机、换签名、卸载前，先在启动器里
  「导出存档」，需要时再「导入存档」。
- 系统 Auto Backup 开启时，会备份 `score.dat`、`th08.cfg`、`port.cfg`、`replay/`，
  不会备份游戏数据和翻译包。

## 常见问题

**启动器说找不到游戏数据，也没有弹权限窗？**
公开包不会主动申请存储权限，也不会弹窗。用「导入游戏文件」，或者用 MT 管理器把数据放进 APK 的
`assets/`，或者手动去系统设置开「所有文件访问」再用 `Download/th08`。三条路见[安装](#安装)。

**MT 管理器改完 APK 装不上 / 提示签名冲突？**
改 APK 会换签名，不能覆盖安装官方包。先在旧版里导出存档，卸载旧版，再安装修改版。
安装后存档不会自动回来，需要「导入存档」。

**MT 管理器加完数据，启动报 `not stored uncompressed`？**
`th08.dat` / `thbgm.dat` 被 zip 压缩了。重新加一次，选择 **不压缩 / Store**；这两个文件必须在
APK 内以 Stored 方式保存。

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

**为什么公开包只有 20 MB？**
因为不含 `th08.dat` / `thbgm.dat`。公开包只含代码和自制资源；游戏数据需要你自己从正版 1.00d 中取出，
按[安装](#安装)里的任一方式加载。

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
这种包包含版权数据，仅用于本地自用。

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

## 分发说明

- **公开包**（`th08-1.0.1-android-apk.apk`，不含游戏数据）：可以自由传播、转载、镜像，
  保留本仓库链接即可。
- **内置数据后的 APK**：含原版 `th08.dat` / `thbgm.dat`，属于个人副本，请不要二次分发。
- 用 MT 管理器改签过的内置数据包不能覆盖安装公开包；用官方 keystore 构建的内置包与公开包同签名，
  可以互相覆盖，但数据来源会被替换。

## 版权与联系

- 代码：**GPL-3.0-or-later**（继承上游）；修改后的源码以本仓库形式提供。
- 游戏数据：《东方永夜抄 ～ Imperishable Night.》的著作权归上海爱丽丝幻乐团及 ZUN 所有；
  本仓库的源码与公开包不包含游戏数据。
- 若权利人认为本仓库的**代码、文档或公开包**侵犯其权益，请邮件 **3658949146@qq.com**；
  核实后我会立即删除相关内容。
- 问题反馈：[GitHub Issues](https://github.com/MinadukiTouka/th08/issues)；测试群：**1074127230**。

## 许可与致谢

- 代码：**GPL-3.0-or-later**（继承上游）；修改后的源码以本仓库形式提供
- 上游：`kauri-off/th08-rs`（净室重写与 Android 层）；触控方案参考 `some100/th07` 的
  reallyportable 分支（TH07 移植）
- 翻译：Touhou Patch Center（thpatch.net）及其贡献者，CC BY-SA 4.0
- 游戏文本/素材：Team Shanghai Alice / ZUN

## 免责声明 / Disclaimer / 免責事項

**中文**：本项目为非官方、非盈利的技术研究项目，与上海爱丽丝幻乐团及 ZUN 无任何关联。
《东方永夜抄 ～ Imperishable Night.》的著作权归上海爱丽丝幻乐团及 ZUN 所有。
公开包不包含任何原版游戏数据；使用者必须合法持有原作，仅在个人、非商业环境中使用。

**English**: This is an unofficial, non-commercial fan project, not affiliated with Team Shanghai
Alice or ZUN. Touhou 8 and all game assets belong to Team Shanghai Alice. The public APK contains
no game data: you must own a legitimate copy and use it for personal, non-commercial purposes only.

**日本語**：本プロジェクトは非公式・非営利の技術研究プロジェクトであり、上海アリス幻楽団および
ZUN とは一切関係ありません。『東方永夜抄 ～ Imperishable Night.』の著作権は上海アリス幻楽団に
帰属します。公開 APK にはゲームデータを含みません。正規品を所有する個人が非営利で利用する場合に
限ります。
