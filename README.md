# 东方永夜抄 Android 移植（TH08 / Imperishable Night 1.00d）

非官方、非盈利的 Android 移植，基于 [kauri-off/th08-rs](https://github.com/kauri-off/th08-rs)
（Rust 净室重写，GPL-3.0）二次开发。包名 **`com.zun.th08`**，只读取你自己合法持有的
`th08.dat` / `thbgm.dat`，仓库与公开 APK 均不包含任何游戏数据。

## 特性

- **触控（TH07 风格）**：任意位置拖动移动（模拟量位移，方向跟手、斜向不减速）、按住即射击
  （松手后 200 ms 尾）、第二根手指低速、单侧黑边放 B、标题/暂停/菜单由手势操作
- **单一 Esc 按钮**：左上角（默认）短按 = 键盘 Esc，长按 0.6 秒 = 移植菜单（触控布局、判定框等）
- **惯用手切换**：右手（Esc 左上 / B 右侧黑边）或左手（Esc 右上 / B 左侧黑边）
- **中文界面**：启动器与设置界面简体中文（复用原俄语槽位；游戏内文本保持原版/翻译包）
- **60 fps 固定节奏**：在 90 Hz / 120 Hz 屏上请求并锁定 60 Hz
- 图标取自原版 `th08.exe`；存档、回放、音乐室均已验证

## 安装（游戏数据手动放置）

1. 自备正版《东方永夜抄》1.00d，取出 `th08.dat` 与 `thbgm.dat`
2. 在手机内部存储建目录 **`Download/th08/`**，把这两个文件放进去（文件名保持原样）
3. 安装 APK（Android 8.0+，arm64-v8a）
4. 首次打开时按提示授予 **「所有文件访问」** 权限（Android 11+；启动器里有按钮），
   状态栏会显示「已在 /Download/th08 找到 th08.dat」
5. 语言默认跟随系统：中文系统自动显示中文，其它系统可在启动器里切到「中文」

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

### 键盘 / 手柄

- 键盘：方向键移动，`Z` 射击，`X` Bomb，`Shift` 低速，`Esc` 暂停
- 手柄：摇杆/十字键移动，按键射击/Bomb/低速，`Select` 打开移植菜单

公开 Release 的 APK 不含游戏数据；请勿在任何地方上传、共享原版数据文件。

## 构建

- Windows 宿主：见 [docs/BUILD_WINDOWS.md](docs/BUILD_WINDOWS.md)（JDK 17、Android SDK 36、NDK r27b、
  Rust 1.98 + `aarch64-linux-android`；Gradle 9.8.2）
- 版本：`1.0.1`

## 已验证设备

| 设备 | 系统 | 结果 |
| --- | --- | --- |
| OnePlus PJE110 | Android 16，120 Hz 面板 | 60 Hz 锁定、触控/存档/回放正常 |
| 荣耀畅玩50 JDY-AN00 | Android 14 | 60 fps、Stage 1 + Boss、续关、回放正常 |

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

## 许可与致谢

- 代码：**GPL-3.0-or-later**（继承上游）；修改后的源码以本仓库形式提供
- 上游：`kauri-off/th08-rs`（净室重写与 Android 层）；触控方案参考 `some100/th07` 的
  reallyportable 分支（TH07 移植）
- 翻译：Touhou Patch Center（thpatch.net）及其贡献者，CC BY-SA 4.0
- 游戏文本/素材：Team Shanghai Alice / ZUN
