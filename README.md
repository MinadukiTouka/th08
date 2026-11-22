# 东方永夜抄 Android 原生移植 / Touhou 8 Android Native Port / 東方永夜抄 Android ネイティブ移植

**语言 / Language / 言語：** [中文](#中文) · [English](#english) · [日本語](#日本語)

> **最新版本 / Latest / 最新版：v1.0.1**（2026-11-08）
> **下载 / Download / ダウンロード：** [th08-1.0.1-android-apk.apk](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/th08-1.0.1-android-apk.apk)
> **平台 / Platform / 対応：** Android 8.0+ / arm64-v8a · 约 20 MB · 公开包不含游戏数据 / public APK without game data / 公開 APK にゲームデータは含まれません
> **测试与反馈 QQ 群 / Test & feedback QQ group / テスト・フィードバック QQ グループ：1074127230**
> 以下中文、English、日本語三个章节都是完整说明 / Each section below is complete / 以下の 3 章はすべて完全版です。

---

## 中文

### 这个仓库是什么

这是 **MinadukiTouka** 个人维护的《东方永夜抄 ～ Imperishable Night.》（TH08，1.00d）**Android 原生移植**。
它不是模拟器，也不是把原版 `th08.exe` 套一层 Wine/Box64，而是基于
[kauri-off/th08-rs](https://github.com/kauri-off/th08-rs) 的 Rust 净室重写：游戏逻辑、wgpu 渲染、
AAudio 音频和输入层编译成 arm64-v8a 原生库，配一个 Kotlin Compose 启动器。包名 **`com.zun.th08`**。

关键词：东方永夜抄、TH08、Imperishable Night、东方Project、弹幕射击、Android 移植、安卓原生移植、MinadukiTouka、APK 下载。

- **是什么**：TH08 1.00d 的 Android 原生移植；支持触屏、手柄、键盘；中文启动器/设置/移植菜单；
  60 fps 锁定；存档、回放、音乐室。
- **不是什么**：不是官方作品；不是模拟器；不是原版游戏镜像；不是破解版；公开包不含
  `th08.dat` / `thbgm.dat`。
- **代码从哪来**：上游 `kauri-off/th08-rs`（GPL-3.0-or-later），本仓库是 Android 产品化分支：
  包名、启动器、触控、中文化、数据加载、签名与发布。
- **游戏数据从哪来**：需要你自己从正版《东方永夜抄》1.00d 中取出 `th08.dat` 和 `thbgm.dat`；
  本仓库的源码与公开包不包含游戏数据。
- **适合谁**：想在 Android 手机上用触屏/手柄玩 TH08、并且已经拥有正版游戏数据的玩家；
  以及想研究 Rust 游戏移植/Android NativeActivity 的开发者。

### 特性

- **触控（TH07 风格）**：任意位置拖动移动（模拟量位移，方向跟手、斜向不减速）、按住即射击
  （松手后 200 ms 尾）、第二根手指低速、单侧黑边放 B、标题/暂停/菜单由手势操作
- **单一 Esc 按钮**：左上角（默认）短按 = 键盘 Esc，长按 0.6 秒 = 移植菜单（触控布局、判定框等）
- **惯用手切换**：右手（Esc 左上 / B 右侧黑边）或左手（Esc 右上 / B 左侧黑边）
- **中文界面**：启动器、设置界面和移植菜单均为简体中文（复用原俄语槽位；游戏内文本保持原版/翻译包）
- **回放/演示输入锁定**：播放回放或标题待机 demo 时，触摸不会操控自机；回放本身仍正常驱动
- **60 fps 固定节奏**：在 90 Hz / 120 Hz 屏上请求并锁定 60 Hz
- 图标取自原版 `th08.exe`；存档、回放、音乐室可用

> 1.0.1 重点修复：回放/标题演示期间触摸仍能操控自机；移植菜单乱码；触屏录制的回放现在会
> 记录 8 方向移动（旧回放没有移动数据，见常见问题）。

### 下载

| 文件 | 大小 | SHA256 |
| --- | --- | --- |
| [th08-1.0.1-android-apk.apk](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/th08-1.0.1-android-apk.apk) | 20,503,754 B | `25c607276b0065799194887d6a4089dcfa2383250f2080ea8beef3ef85035fe0` |

- 发布页：[Releases](https://github.com/MinadukiTouka/th08/releases)
- 校验文件：[SHA256SUMS](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/SHA256SUMS)
- **公开包可以自由传播、转载、镜像**；它只含 GPL 代码和自制资源，不含 `th08.dat` / `thbgm.dat`。

### 安装

公开包不含游戏数据，下面三种方式任选一种。推荐前两种，不需要存储权限。

#### 方式一：用 MT 管理器把数据放进 APK

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

#### 方式二：启动器「导入游戏文件」

1. 打开应用，在「游戏数据」一栏点 **导入游戏文件**。
2. 选择 `th08.dat` 和 `thbgm.dat`；应用会校验并转换成 `th08.pak` / `thbgm.pak`，存到应用私有目录。
3. 转换约 1 分钟，期间保持应用在前台；需要足够的剩余空间。
4. 完成后状态显示「已导入」，直接 Play。

这个方式不需要「所有文件访问」，也不会弹权限窗；缺点是会额外占用一份私有空间，卸载应用会一起删除。

#### 方式三：手动放到 Download/th08

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

### 操作方式

#### 触屏（TH07 风格）

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

#### 键盘 / 手柄

- 键盘：方向键移动，`Z` 射击，`X` Bomb，`Shift` 低速，`Esc` 暂停
- 手柄：摇杆/十字键移动，按键射击/Bomb/低速，`Select` 打开移植菜单

### 存档与备份

- Android 的存档、回放、设置都在应用私有目录：
  `/data/user/0/com.zun.th08/files/`
- **卸载应用会删除这些文件**（包括存档）。换机、换签名、卸载前，先在启动器里
  「导出存档」，需要时再「导入存档」。
- 系统 Auto Backup 开启时，会备份 `score.dat`、`th08.cfg`、`port.cfg`、`replay/`，
  不会备份游戏数据和翻译包。

### 常见问题

**启动器说找不到游戏数据，也没有弹权限窗？**
公开包不会主动请求存储权限，也不会弹窗。用「导入游戏文件」，或者用 MT 管理器把数据放进 APK 的
`assets/`，或者手动去系统设置开「所有文件访问」再用 `Download/th08`。

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
按上面的任一方式加载。

### 从源码构建

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

### 已验证设备

| 设备 | 系统 | 结果 |
| --- | --- | --- |
| OnePlus PJE110 | Android 16，120 Hz 面板 | 1.0.0：60 Hz 锁定、中文界面、左右手切换、手动数据目录正常；1.0.1 待复测 |
| 荣耀畅玩50 JDY-AN00 | Android 14 | 1.0.1：中文启动器/移植菜单、回放播放且触摸无效、Stage 1 + Boss、续关、存档正常 |

触控、高刷、音频、安装体积都必须在真机上验证；模拟器只能做冒烟测试。

### 更新日志

**1.0.1（2026-11-08）**

- 修复：回放播放与标题待机演示期间，触摸拖动仍能操控自机
- 修复：回放/演示期间自机被完全冻结（触屏录制现在会把拖动写入 8 方向按键字；
  新录的回放可正常走位，旧回放无移动数据）
- 修复：移植菜单（长按 Esc）乱码（中文走 `ru` 槽，现在按 `ru` 安装 CJK 字体并内置
  Noto Sans 子集兜底）
- 触屏回放录制、惯用手、单 Esc、手动数据目录等 1.0.0 已有功能保持

**1.0.0（2026-11-07）**

首个正式版：TH07 风格触控、单 Esc、惯用手、中文启动器、60 fps 锁定、图标、
`Download/th08` 手动数据目录。

完整记录见 [CHANGELOG.md](CHANGELOG.md)。

### 源码结构

```text
android/                 Gradle 工程、Kotlin Compose 启动器、JNI
crates/th08-core/        输入、回放、玩家、游戏逻辑
crates/th08-render/      wgpu 渲染、文字、安全区
crates/th08-audio/       cpal/AAudio、BGM
src/platform/touch.rs    触控 overlay
src/platform/portmenu.rs 移植菜单（egui）
src/i18n.rs              语言表与 CJK 字体
i18n/ru.toml             中文（复用 ru 槽）
docs/BUILD_WINDOWS.md    Windows 构建说明
```

### 分发说明

- **公开包**（`th08-1.0.1-android-apk.apk`，不含游戏数据）：可以自由传播、转载、镜像，
  保留本仓库链接即可。
- **内置数据后的 APK**：含原版 `th08.dat` / `thbgm.dat`，属于个人副本，请不要二次分发。
- 用 MT 管理器改签过的内置数据包不能覆盖安装公开包；用官方 keystore 构建的内置包与公开包同签名，
  可以互相覆盖，但数据来源会被替换。

### 版权与联系

- 代码：**GPL-3.0-or-later**（继承上游）；修改后的源码以本仓库形式提供。
- 游戏数据：《东方永夜抄 ～ Imperishable Night.》的著作权归上海爱丽丝幻乐团及 ZUN 所有；
  本仓库的源码与公开包不包含游戏数据。
- 若权利人认为本仓库的**代码、文档或公开包**侵犯其权益，请邮件 **3658949146@qq.com**；
  核实后我会立即删除相关内容。
- 问题反馈：[GitHub Issues](https://github.com/MinadukiTouka/th08/issues)；测试群：**1074127230**。

### 许可与致谢

- 代码：**GPL-3.0-or-later**（继承上游）；修改后的源码以本仓库形式提供
- 上游：`kauri-off/th08-rs`（净室重写与 Android 层）；触控方案参考 `some100/th07` 的
  reallyportable 分支（TH07 移植）
- 翻译：Touhou Patch Center（thpatch.net）及其贡献者，CC BY-SA 4.0
- 游戏文本/素材：Team Shanghai Alice / ZUN

### 免责声明

本项目为非官方、非盈利的技术研究项目，与上海爱丽丝幻乐团及 ZUN 无任何关联。
《东方永夜抄 ～ Imperishable Night.》的著作权归上海爱丽丝幻乐团及 ZUN 所有。
公开包不包含任何原版游戏数据；使用者必须合法持有原作，仅在个人、非商业环境中使用。

---

## English

### What this repository is

This is an unofficial **Android native port of Touhou 8: Imperishable Night** (TH08, v1.00d) by
**MinadukiTouka**. It is not an emulator, and it does not wrap the original `th08.exe` in
Wine/Box64. It is built on [kauri-off/th08-rs](https://github.com/kauri-off/th08-rs), a Rust
clean-room rewrite: the game logic, wgpu rendering, AAudio output and input layer are compiled
into arm64-v8a native libraries, with a Kotlin Compose launcher. Package name: **`com.zun.th08`**.

- **What it is**: a native Android port of TH08 1.00d; touch, gamepad and keyboard input;
  Chinese launcher, settings and port menu; 60 fps pacing; saves, replays and the music room.
- **What it is not**: not an official release, not an emulator, not a game-data image, not a
  crack. The public APK does not contain `th08.dat` / `thbgm.dat`.
- **Where the code comes from**: upstream `kauri-off/th08-rs` (GPL-3.0-or-later). This repository
  is the Android productization branch: package name, launcher, touch, Chinese UI, data loading,
  signing and releases.
- **Where the game data comes from**: you must extract `th08.dat` and `thbgm.dat` from your own
  legitimate copy of Touhou 8 v1.00d. The source and the public APK in this repository contain no
  game data.
- **Who it is for**: players who own the game and want to play TH08 on Android with touch or a
  gamepad, and developers interested in Rust game ports / Android NativeActivity.

### Features

- **Touch (TH07 style)**: drag anywhere to move (1:1 analog movement, no diagonal slowdown);
  hold to shoot (200 ms tail after release); second finger focuses; bomb on one letterbox bar;
  gestures for title, pause and menus.
- **Single Esc button**: short press = keyboard Esc; long press (0.6 s) = port menu (touch layout,
  hitbox overlay, etc.).
- **Handedness**: right-handed (Esc top-left, bomb on the right bar) or left-handed (Esc top-right,
  bomb on the left bar).
- **Chinese UI**: launcher, settings and port menu in Simplified Chinese (the Russian slot is
  reused; in-game text stays original or uses a translation pack).
- **Replay/demo input lock**: while a replay or the title attract demo is running, touch cannot
  steer the player; the replay still drives it normally.
- **Fixed 60 fps pacing**: requests and locks 60 Hz on 90 Hz / 120 Hz displays.
- Icon extracted from the original `th08.exe`; saves, replays and the music room work.

> 1.0.1 fixes: touch could still steer the player during replay/title demo; tofu boxes in the port
> menu; touch-recorded replays now store 8-way movement (old replays have no movement data).

### Download

| File | Size | SHA256 |
| --- | --- | --- |
| [th08-1.0.1-android-apk.apk](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/th08-1.0.1-android-apk.apk) | 20,503,754 B | `25c607276b0065799194887d6a4089dcfa2383250f2080ea8beef3ef85035fe0` |

- Releases: [github.com/MinadukiTouka/th08/releases](https://github.com/MinadukiTouka/th08/releases)
- Checksums: [SHA256SUMS](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/SHA256SUMS)
- **The public APK may be freely redistributed, reposted and mirrored.** It contains only GPL
  code and self-made assets, no `th08.dat` / `thbgm.dat`.

### Installation

The public APK has no game data. Pick one of the three methods below. The first two need no
storage permission.

#### Method 1: add the data to the APK with MT Manager

For people who want a single installable APK and do not want to grant All files access. You need
your own `th08.dat` and `thbgm.dat`.

1. If the old build still opens, **export your saves** from the launcher first. A re-signed APK
   cannot be installed over the official one; you must uninstall it.
2. Open the public APK in **MT Manager** and go to the **`assets/`** root (not `assets/th08/`).
3. Add the two files, keeping the names lowercase:

   ```text
   assets/th08.dat
   assets/thbgm.dat
   ```

   Do not delete the existing `assets/settings_schema.json` or other files.

4. Add them **uncompressed / Store**. The game reads them through
   `AAsset_openFileDescriptor64` at their offset inside the APK; if they are zip-compressed, it
   fails with `APK asset ... is not stored uncompressed`.
5. Exit editing and use MT Manager's **APK signing** function to re-sign the APK.
6. Uninstall the old build (this deletes saves, hence step 1), then install the new APK (allow
   "unknown sources"). The launcher should report the data as included in the app.

> The resulting APK is about 493 MiB and has a different signature. It is a personal copy that
> contains the original data; please do not redistribute it.

#### Method 2: launcher "Import game files"

1. Open the app and tap **Import game files** in the Game data row.
2. Pick `th08.dat` and `thbgm.dat`; the app verifies them and converts them to `th08.pak` /
   `thbgm.pak` in its private storage.
3. The conversion takes about a minute; keep the app in the foreground and leave enough free space.
4. When the status says imported, press Play.

This method needs no All files access and shows no permission dialog. The downside is an extra
private copy, which is deleted when you uninstall the app.

#### Method 3: put the files in Download/th08

The public APK **does not pop up a storage permission dialog**. For this method you must enable
All files access manually:

1. Put `th08.dat` and `thbgm.dat` here:

   ```text
   /storage/emulated/0/Download/th08/th08.dat
   /storage/emulated/0/Download/th08/thbgm.dat
   ```

2. In the launcher tap **Allow access to Download**; it opens the system settings. Enable
   "All files access" for this app.
3. Return to the app; the status should say it found `th08.dat` in `/Download/th08`.

Without All files access the app simply ignores `Download/th08` and shows no dialog. That is a
permission issue, not a wrong path. Android 11+ has no runtime popup for this permission; it can
only be enabled in system settings.

### Controls

#### Touch (TH07 style)

| Action | Effect |
| --- | --- |
| **Drag** anywhere | The player follows your finger (1:1 analog, no diagonal slowdown) |
| Hold | Shoot (continues for 200 ms after release) |
| **Second finger** held | Focus (slow movement) |
| Tap **one letterbox bar** | Bomb (right by default; left in left-handed mode) |
| **Esc** button | Short press = pause/back (same as keyboard Esc); long press 0.6 s = port menu |
| In menus: swipe / tap / two-finger tap | Move cursor / confirm / back |
| Dialogue | Tap to advance; hold 0.5 s to skip |

Settings → **Touch controls → Handedness** switches between **right-handed** (Esc top-left, bomb
on the right bar) and **left-handed** (Esc top-right, bomb on the left bar).

During replay playback and the title attract demo, touch is ignored and the player is driven
entirely by the replay/demo input.

#### Keyboard / gamepad

- Keyboard: arrow keys move, `Z` shoots, `X` bombs, `Shift` focuses, `Esc` pauses.
- Gamepad: stick/D-pad moves, buttons shoot/bomb/focus, `Select` opens the port menu.

### Saves and backup

- On Android, saves, replays and settings live in the app's private directory:
  `/data/user/0/com.zun.th08/files/`
- **Uninstalling the app deletes them, including saves.** Before changing phones, changing
  signatures or uninstalling, use **Export saves** in the launcher and **Import saves** later.
- If Android Auto Backup is enabled, it backs up `score.dat`, `th08.cfg`, `port.cfg` and
  `replay/`; it never backs up game data or translation packs.

### FAQ

**The launcher says game data is missing, and no permission dialog appears.**
The public APK does not prompt for storage permission, so there is no dialog. Use "Import game
files", or add the data to the APK's `assets/` with MT Manager, or enable All files access
manually and use `Download/th08`.

**MT Manager's APK will not install / signature conflict.**
Editing the APK changes its signature, so it cannot be installed over the official build. Export
saves, uninstall the old build, then install the modified one. Saves are not restored
automatically; use Import saves.

**After adding data with MT Manager, the game says `not stored uncompressed`.**
`th08.dat` / `thbgm.dat` were zip-compressed. Add them again as **uncompressed / Store**; both
files must be stored uncompressed in the APK.

**The port menu shows tofu boxes.**
Fixed in 1.0.1: a bundled Noto Sans subset is used and the CJK font is installed when Chinese runs
through the `ru` slot. Make sure you are on 1.0.1, not 1.0.0.

**The player does not move during replay.**
Touch replays recorded before 1.0.1 stored no direction data and cannot be fixed retroactively.
Replays recorded with 1.0.1 store 8-way movement and move correctly (an approximation, not a 1:1
path). Keyboard/gamepad replays are unaffected.

**The game runs too fast on a high-refresh display.**
1.0.x requests and locks 60 Hz. If it still runs fast, check whether the system forces a high
refresh rate or disables the app's refresh-rate switch. On ColorOS, check the current mode under
Display & brightness → Screen refresh rate.

**Does it support gamepads?**
Yes. On Android, the gamepad's Select button opens the port menu; touch and gamepad can be used
together.

**Why is the public APK only about 20 MB?**
Because it contains no `th08.dat` / `thbgm.dat`. It contains only code and self-made assets; you
must supply the game data from your own legitimate v1.00d copy using one of the installation
methods above.

### Building from source

The full Windows-host guide (no WSL/MSYS needed) is in
[docs/BUILD_WINDOWS.md](docs/BUILD_WINDOWS.md). Requirements:

- Rust 1.98 with the `aarch64-linux-android` target, GNU host (MinGW-w64 linker)
- JDK 17, Gradle 9.8.2, Android SDK 36 / build-tools 36.0.0, NDK r27b
- `ANDROID_HOME` / `ANDROID_NDK_HOME` / `JAVA_HOME`

Public build (no data, safe to publish):

```bat
gradle.bat -p android assembleRelease ^
  -Pth08.abis=arm64-v8a -Pth08.minSdk=26 -Pth08.profile=release ^
  -Pth08.channel=release -Pth08.keystore=path\to\keystore.properties ^
  -Pth08.versionName=1.0.1 -Pth08.versionCode=446700 ^
  -Pth08.schemaFile=tools/android/settings_schema.json
```

For a personal build, add `-Pth08.data=<folder containing th08.dat/thbgm.dat>`; the data is
bundled as uncompressed assets. Such a build contains copyrighted data and is for local personal
use only.

Other notes:

- `-Pth08.minify=false` disables R8: faster on low-memory machines, larger APK.
- `-Pth08.profile=dev` produces an unoptimized `libth08.so` and a slow game; always use `release`
  for releases.
- Only `arm64-v8a` is built; add another ABI yourself for `x86_64` emulators, untested.
- `versionCode` must increase monotonically; 1.0.1 is `446700`.

### Tested devices

| Device | System | Result |
| --- | --- | --- |
| OnePlus PJE110 | Android 16, 120 Hz panel | 1.0.0: 60 Hz lock, Chinese UI, handedness switch, manual data folder work; 1.0.1 not yet retested |
| Honor Play 50 JDY-AN00 | Android 14 | 1.0.1: Chinese launcher/port menu, replay playback with touch ignored, Stage 1 + Boss, continue, saves |

Touch, high refresh, audio and install size must be verified on real devices; an emulator is only
a smoke test.

### Changelog

**1.0.1 (2026-11-08)**

- Fixed: touch could still steer the player during replay playback and the title attract demo.
- Fixed: the player was completely frozen during replay/demo (touch recording now writes the drag
  as 8-way key bits; new replays move, old replays have no movement data).
- Fixed: tofu boxes in the port menu (long-press Esc); the `ru` slot now installs a CJK font and
  a bundled Noto Sans subset is the fallback.
- 1.0.0 features remain: touch replay recording, handedness, single Esc, manual data folder.

**1.0.0 (2026-11-07)**

First release: TH07-style touch, single Esc, handedness, Chinese launcher, 60 fps lock, icon,
`Download/th08` manual data folder.

See [CHANGELOG.md](CHANGELOG.md) for the full history.

### Source layout

```text
android/                 Gradle project, Kotlin Compose launcher, JNI
crates/th08-core/        input, replay, player, game logic
crates/th08-render/      wgpu rendering, text, safe area
crates/th08-audio/       cpal/AAudio, BGM
src/platform/touch.rs    touch overlay
src/platform/portmenu.rs port menu (egui)
src/i18n.rs              language tables and CJK font
i18n/ru.toml             Chinese (reuses the ru slot)
docs/BUILD_WINDOWS.md    Windows build guide
```

### Distribution

- **Public APK** (`th08-1.0.1-android-apk.apk`, no game data): may be freely redistributed,
  reposted and mirrored; keep a link to this repository.
- **APK with bundled data**: contains the original `th08.dat` / `thbgm.dat`; it is a personal copy,
  please do not redistribute it.
- An APK re-signed with MT Manager cannot be installed over the public APK. A bundled build made
  with the official keystore has the same signature and can overwrite it, but the data source is
  replaced.

### Copyright and contact

- Code: **GPL-3.0-or-later** (inherited from upstream); the modified source is this repository.
- Game data: the copyright of *Touhou 8: Imperishable Night* belongs to Team Shanghai Alice and
  ZUN. The source and public APK in this repository contain no game data.
- If a rights holder believes the **code, documentation or public APK** in this repository
  infringes their rights, please email **3658949146@qq.com**; I will remove the relevant content
  after verification.
- Issues: [GitHub Issues](https://github.com/MinadukiTouka/th08/issues); test group: **1074127230**.

### License and credits

- Code: **GPL-3.0-or-later** (inherited from upstream); the modified source is provided in this
  repository.
- Upstream: `kauri-off/th08-rs` (clean-room rewrite and Android layer); the touch scheme follows
  `some100/th07`'s reallyportable branch (the TH07 port).
- Translations: Touhou Patch Center (thpatch.net) and its contributors, CC BY-SA 4.0.
- Game text/assets: Team Shanghai Alice / ZUN.

### Disclaimer

This is an unofficial, non-commercial technical research project, not affiliated with Team
Shanghai Alice or ZUN. Touhou 8 and all game assets belong to Team Shanghai Alice. The public APK
contains no game data: you must own a legitimate copy and use it for personal, non-commercial
purposes only.

---

## 日本語

### このリポジトリについて

これは **MinadukiTouka** による『東方永夜抄 ～ Imperishable Night.』（TH08、1.00d）の
**Android ネイティブ移植**です。エミュレータではなく、原作の `th08.exe` を Wine/Box64 で
包んだものでもありません。[kauri-off/th08-rs](https://github.com/kauri-off/th08-rs) の Rust
によるクリーンルーム実装を土台に、ゲームロジック、wgpu 描画、AAudio 音声、入力層を
arm64-v8a のネイティブライブラリへコンパイルし、Kotlin Compose のランチャーを組み合わせています。
パッケージ名は **`com.zun.th08`** です。

- **何か**：TH08 1.00d の Android ネイティブ移植。タッチ、ゲームパッド、キーボード対応。
  中国語のランチャー/設定/移植メニュー。60 fps 固定。セーブ、リプレイ、音楽室。
- **何ではないか**：公式作品ではなく、エミュレータでも、原作ゲームデータのイメージでも、
  クラックでもありません。公開 APK に `th08.dat` / `thbgm.dat` は含まれません。
- **コードの出どころ**：上流 `kauri-off/th08-rs`（GPL-3.0-or-later）。本リポジトリは
  Android 向けの製品化ブランチで、パッケージ名、ランチャー、タッチ、中国語化、データ読み込み、
  署名、リリースを担当しています。
- **ゲームデータの入手先**：正規の『東方永夜抄』1.00d から `th08.dat` と `thbgm.dat` を
  ご自身で用意してください。本リポジトリのソースと公開 APK にはゲームデータを含みません。
- **対象**：正規品を持っていて、Android のタッチ/ゲームパッドで TH08 を遊びたい人。
  Rust のゲーム移植や Android NativeActivity に興味がある開発者。

### 特徴

- **タッチ（TH07 方式）**：画面のどこでもドラッグして移動（アナログ 1:1、斜めでも減速しない）。
  押している間はショット（離してから 200 ms 継続）。2 本目の指で低速（フォーカス）。
  片側のレターボックス帯をタップでボム。タイトル、ポーズ、メニューはジェスチャー操作。
- **Esc ボタン 1 つ**：短押し = キーボードの Esc。0.6 秒の長押し = 移植メニュー
  （タッチレイアウト、当たり判定表示など）。
- **利き手切り替え**：右利き（Esc 左上、ボムは右の黒帯）または左利き（Esc 右上、ボムは左の黒帯）。
- **中国語 UI**：ランチャー、設定、移植メニューが簡体字中国語（ロシア語スロットを再利用）。
  ゲーム内テキストは原作のまま、または翻訳パックを使用。
- **リプレイ/デモ中の入力ロック**：リプレイ再生中やタイトルのアトラクトデモ中は、タッチで
  自機を操作できません。リプレイ自体は通常どおり自機を動かします。
- **60 fps 固定**：90 Hz / 120 Hz の画面でも 60 Hz を要求して固定します。
- アイコンは原作 `th08.exe` から抽出。セーブ、リプレイ、音楽室に対応。

> 1.0.1 の主な修正：リプレイ/タイトルデモ中にタッチで自機を操作できた問題。移植メニューの
> 豆腐文字。タッチで録画したリプレイが 8 方向の移動を記録するようになりました
> （古いリプレイには移動データがありません）。

### ダウンロード

| ファイル | サイズ | SHA256 |
| --- | --- | --- |
| [th08-1.0.1-android-apk.apk](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/th08-1.0.1-android-apk.apk) | 20,503,754 B | `25c607276b0065799194887d6a4089dcfa2383250f2080ea8beef3ef85035fe0` |

- リリース：[Releases](https://github.com/MinadukiTouka/th08/releases)
- チェックサム：[SHA256SUMS](https://github.com/MinadukiTouka/th08/releases/download/v1.0.1/SHA256SUMS)
- **公開 APK は自由に再配布・転載・ミラーできます。** GPL コードと自作アセットのみで、
  `th08.dat` / `thbgm.dat` は含みません。

### インストール

公開 APK にはゲームデータがありません。以下の 3 つの方法から 1 つ選んでください。
最初の 2 つはストレージ権限が不要です。

#### 方法 1：MT マネージャーで APK にデータを入れる

「インストールしてすぐ遊びたい」「すべてのファイルへのアクセスを開きたくない」人向けです。
`th08.dat` と `thbgm.dat` をご自身で用意してください。

1. 旧版がまだ起動できるなら、先にランチャーで**セーブデータを書き出し**してください。
   再署名した APK は公式版に上書きインストールできないため、旧版をアンインストールする必要が
   あります。
2. **MT マネージャー**で公開 APK を開き、**`assets/`** の直下（`assets/th08/` ではありません）
   へ移動します。
3. 次の 2 ファイルを追加します。ファイル名は小文字のままにしてください。

   ```text
   assets/th08.dat
   assets/thbgm.dat
   ```

   既存の `assets/settings_schema.json` などは削除しないでください。

4. 追加時は**圧縮しない / Store** を選びます。ゲームは `AAsset_openFileDescriptor64` で
   APK 内のオフセットから直接読むため、zip 圧縮されていると
   `APK asset ... is not stored uncompressed` で失敗します。
5. 編集を終了し、MT マネージャーの **APK 署名** 機能で再署名します。
6. 旧版をアンインストールし（セーブは消えるので手順 1 が必要）、新しい APK をインストール
   します（「提供元不明」を許可）。ランチャーにデータ内蔵として表示されれば成功です。

> できあがる APK は約 493 MiB で、署名も公式版と異なります。原作データを含む個人用の
> コピーですので、再配布はしないでください。

#### 方法 2：ランチャーの「ゲームファイルをインポート」

1. アプリを開き、「ゲームデータ」の欄で **ゲームファイルをインポート** をタップします。
2. `th08.dat` と `thbgm.dat` を選択します。アプリが検証し、`th08.pak` / `thbgm.pak` に
   変換してアプリ専用領域へ保存します。
3. 変換には約 1 分かかります。アプリを前面に置いたまま、空き容量を確保してください。
4. ステータスが「インポート済み」になったら Play を押します。

この方法は「すべてのファイルへのアクセス」が不要で、権限ダイアログも出ません。欠点は
専用領域にもう 1 部コピーを持つことと、アンインストール時に消えることです。

#### 方法 3：Download/th08 に手動で置く

公開 APK は**ストレージ権限のダイアログを自動で出しません**。この方法を使うには、
「すべてのファイルへのアクセス」を手動で有効にする必要があります。

1. `th08.dat` と `thbgm.dat` を次に置きます。

   ```text
   /storage/emulated/0/Download/th08/th08.dat
   /storage/emulated/0/Download/th08/thbgm.dat
   ```

2. ランチャーで **「Download へのアクセスを許可」** をタップするとシステム設定が開きます。
   このアプリの「すべてのファイルへのアクセス」を有効にします。
3. アプリに戻り、「/Download/th08 に th08.dat が見つかりました」と表示されれば成功です。

「すべてのファイルへのアクセス」を有効にしない場合、アプリは `Download/th08` を無視し、
ダイアログも出しません。これはパスの間違いではなく、権限が開いていないためです。
Android 11 以降、この権限には実行時ダイアログがなく、システム設定でしか有効にできません。

### 操作

#### タッチ（TH07 方式）

| 操作 | 動作 |
| --- | --- |
| 画面のどこでも**ドラッグ** | 自機が指に追従（アナログ 1:1、斜めでも減速なし） |
| 押し続ける | ショット（離して 200 ms 継続） |
| **2 本目の指**を押す | 低速（フォーカス） |
| **片側の黒帯**をタップ | ボム（右利きは右、左利きは左） |
| **Esc** ボタン | 短押し = ポーズ/戻る（キーボードの Esc と同じ）。0.6 秒長押し = 移植メニュー |
| メニューでスワイプ / タップ / 2 本指タップ | カーソル移動 / 決定 / 戻る |
| 会話 | タップで進む。0.5 秒押しでスキップ |

設定 →「タッチ操作 → 利き手」で **右利き**（Esc 左上、ボムは右の黒帯）と **左利き**
（Esc 右上、ボムは左の黒帯）を切り替えられます。

リプレイ再生中とタイトルのアトラクトデモ中はタッチが無視され、自機はリプレイ/デモの入力だけで
動きます。

#### キーボード / ゲームパッド

- キーボード：方向キーで移動、`Z` でショット、`X` でボム、`Shift` で低速、`Esc` でポーズ。
- ゲームパッド：スティック/十字キーで移動、ボタンでショット/ボム/低速、`Select` で移植メニュー。

### セーブデータとバックアップ

- Android のセーブ、リプレイ、設定はアプリ専用領域にあります。
  `/data/user/0/com.zun.th08/files/`
- **アプリをアンインストールすると、セーブを含めて削除されます。** 機種変更、署名変更、
  アンインストールの前に、ランチャーの **セーブデータを書き出し** を使い、必要なら後で
  **セーブデータをインポート** してください。
- Android の Auto Backup が有効な場合、`score.dat`、`th08.cfg`、`port.cfg`、`replay/` が
  バックアップされます。ゲームデータと翻訳パックはバックアップされません。

### よくある質問

**ランチャーにゲームデータがないと言われ、権限ダイアログも出ません。**
公開 APK はストレージ権限を自動では要求しないため、ダイアログは出ません。
「ゲームファイルをインポート」を使うか、MT マネージャーで `assets/` にデータを入れるか、
システム設定で「すべてのファイルへのアクセス」を有効にして `Download/th08` を使ってください。

**MT マネージャーで編集した APK がインストールできない / 署名が衝突する。**
APK を編集すると署名が変わるため、公式版に上書きインストールできません。セーブを書き出し、
旧版をアンインストールしてから、編集版をインストールしてください。セーブは自動では戻らないので、
「セーブデータをインポート」を使ってください。

**MT マネージャーでデータを入れたら `not stored uncompressed` が出る。**
`th08.dat` / `thbgm.dat` が zip 圧縮されています。**圧縮しない / Store** で追加し直してください。
この 2 ファイルは APK 内で非圧縮（Stored）である必要があります。

**移植メニューが豆腐文字になる。**
1.0.1 で修正済みです。Noto Sans のサブセットを内蔵し、中国語が `ru` スロット経由でも CJK
フォントをインストールします。1.0.0 ではなく 1.0.1 をインストールしているか確認してください。

**リプレイで自機が動かない。**
1.0.1 より前に録画した**タッチ**リプレイには方向データがなく、遡って修正できません。
1.0.1 以降に録画したリプレイは 8 方向の移動を記録するため、正常に動きます
（1:1 の軌跡ではなく近似です）。キーボード/ゲームパッドのリプレイは影響を受けません。

**高リフレッシュ画面で速度が速くなる。**
1.0.x は 60 Hz を要求して固定します。それでも速い場合は、システムが高リフレッシュを強制して
いないか、アプリのリフレッシュ率切り替えを無効にしていないか確認してください。ColorOS では
「表示と明るさ → 画面のリフレッシュレート」で現在のモードを確認できます。

**ゲームパッドは使えますか？**
使えます。Android ではゲームパッドの Select で移植メニューが開きます。タッチとゲームパッドは
同時に使えます。

**公開 APK が約 20 MB しかないのはなぜですか？**
`th08.dat` / `thbgm.dat` を含まないためです。公開 APK はコードと自作アセットだけです。
ゲームデータは、正規の 1.00d からご自身で用意し、上記のいずれかの方法で読み込んでください。

### ソースからビルド

Windows ホスト（WSL/MSYS 不要）の詳細は
[docs/BUILD_WINDOWS.md](docs/BUILD_WINDOWS.md) を参照してください。必要なもの：

- Rust 1.98 と `aarch64-linux-android` ターゲット、GNU ホスト（MinGW-w64 リンカー）
- JDK 17、Gradle 9.8.2、Android SDK 36 / build-tools 36.0.0、NDK r27b
- `ANDROID_HOME` / `ANDROID_NDK_HOME` / `JAVA_HOME`

公開ビルド（データなし、配布可）：

```bat
gradle.bat -p android assembleRelease ^
  -Pth08.abis=arm64-v8a -Pth08.minSdk=26 -Pth08.profile=release ^
  -Pth08.channel=release -Pth08.keystore=path\to\keystore.properties ^
  -Pth08.versionName=1.0.1 -Pth08.versionCode=446700 ^
  -Pth08.schemaFile=tools/android/settings_schema.json
```

個人用ビルドは `-Pth08.data=<th08.dat/thbgm.dat を含むフォルダ>` を追加すると、データを
非圧縮 assets として APK に埋め込みます。著作権データを含むため、ローカルの個人利用に
限定してください。

その他：

- `-Pth08.minify=false` で R8 を無効化。低メモリ環境では速いが APK は大きくなります。
- `-Pth08.profile=dev` は最適化なしの `libth08.so` になり、ゲームが遅くなります。リリースでは
  必ず `release` を使ってください。
- `arm64-v8a` のみビルドします。`x86_64` エミュレータ用はご自身で ABI を追加してください
  （未検証）。
- `versionCode` は単調増加が必要です。1.0.1 は `446700`。

### 検証済み端末

| 端末 | システム | 結果 |
| --- | --- | --- |
| OnePlus PJE110 | Android 16、120 Hz パネル | 1.0.0：60 Hz 固定、中国語 UI、利き手切り替え、手動データフォルダが動作。1.0.1 は再検証待ち |
| Honor Play 50 JDY-AN00 | Android 14 | 1.0.1：中国語ランチャー/移植メニュー、リプレイ再生（タッチ無効）、Stage 1 + Boss、コンティニュー、セーブ |

タッチ、高リフレッシュ、音声、インストールサイズは実機で確認が必要です。エミュレータは
スモークテスト程度に考えてください。

### 更新履歴

**1.0.1（2026-11-08）**

- 修正：リプレイ再生中とタイトルのアトラクトデモ中に、タッチで自機を操作できた問題。
- 修正：リプレイ/デモ中に自機が完全に停止していた問題（タッチ録画がドラッグを 8 方向の
  キー入力として記録するようになり、新しいリプレイは移動します。古いリプレイには移動データが
  ありません）。
- 修正：移植メニュー（Esc 長押し）の豆腐文字（`ru` スロットで CJK フォントをインストールし、
  Noto Sans サブセットを内蔵フォールバックに）。
- 1.0.0 の機能（タッチリプレイ録画、利き手、Esc ボタン 1 つ、手動データフォルダ）は維持。

**1.0.0（2026-11-07）**

初回リリース：TH07 方式のタッチ、Esc ボタン 1 つ、利き手、中国語ランチャー、60 fps 固定、アイコン、
`Download/th08` 手動データフォルダ。

詳細は [CHANGELOG.md](CHANGELOG.md) を参照してください。

### ソース構成

```text
android/                 Gradle プロジェクト、Kotlin Compose ランチャー、JNI
crates/th08-core/        入力、リプレイ、プレイヤー、ゲームロジック
crates/th08-render/      wgpu 描画、テキスト、セーフエリア
crates/th08-audio/       cpal/AAudio、BGM
src/platform/touch.rs    タッチオーバーレイ
src/platform/portmenu.rs 移植メニュー（egui）
src/i18n.rs              言語テーブルと CJK フォント
i18n/ru.toml             中国語（ru スロットを再利用）
docs/BUILD_WINDOWS.md    Windows ビルドガイド
```

### 配布について

- **公開 APK**（`th08-1.0.1-android-apk.apk`、ゲームデータなし）：自由に再配布、転載、
  ミラーできます。本リポジトリへのリンクを残してください。
- **データ内蔵 APK**：原作の `th08.dat` / `thbgm.dat` を含む個人用コピーです。再配布は
  しないでください。
- MT マネージャーで再署名したデータ内蔵 APK は、公開 APK に上書きインストールできません。
  公式 keystore でビルドしたデータ内蔵 APK は公開 APK と同じ署名なので上書きできますが、
  データの参照先が切り替わります。

### 著作権と連絡先

- コード：**GPL-3.0-or-later**（上流から継承）。変更後のソースは本リポジトリで提供します。
- ゲームデータ：『東方永夜抄 ～ Imperishable Night.』の著作権は上海アリス幻楽団および ZUN に
  帰属します。本リポジトリのソースと公開 APK にはゲームデータを含みません。
- 権利者の方が、本リポジトリの**コード、ドキュメント、公開 APK** が権利を侵害していると
  お考えの場合は、**3658949146@qq.com** までメールしてください。確認後、該当内容を速やかに
  削除します。
- 不具合報告：[GitHub Issues](https://github.com/MinadukiTouka/th08/issues)。テストグループ：
  **1074127230**。

### ライセンスと謝辞

- コード：**GPL-3.0-or-later**（上流から継承）。変更後のソースは本リポジトリで提供します。
- 上流：`kauri-off/th08-rs`（クリーンルーム実装と Android 層）。タッチ方式は `some100/th07` の
  reallyportable ブランチ（TH07 移植）を参考にしています。
- 翻訳：Touhou Patch Center（thpatch.net）とその貢献者、CC BY-SA 4.0。
- ゲームテキスト/素材：Team Shanghai Alice / ZUN。

### 免責事項

本プロジェクトは非公式・非営利の技術研究プロジェクトであり、上海アリス幻楽団および ZUN とは
一切関係ありません。『東方永夜抄 ～ Imperishable Night.』の著作権は上海アリス幻楽団に帰属します。
公開 APK にはゲームデータを含みません。正規品を所有する個人が非営利で利用する場合に限ります。
