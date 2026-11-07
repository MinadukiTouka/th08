# Changelog

## 1.0.0 (2026-11-07)

首个正式版本。

### 移植与适配

- 包名 / namespace / Kotlin 包 / JNI 导出统一为 `com.zun.th08`
- Windows 宿主构建支持：`tools/android/cargo_android.ps1`、`-Pth08.minify`、预生成设置表
- 关闭上游自动更新（`FORK_UPDATER=false`），避免覆盖内置数据构建

### 触控

- 采用 TH07 移植的纯手势方案：任意拖动移动（模拟量，经速度上限裁剪并保留余量）、按住射击 +
  200 ms 尾、第二指低速、单侧黑边 Bomb、对话点按/长按跳过
- 覆盖层只保留一个 **Esc** 按钮（长按 0.6 秒 = 移植菜单），删除摇杆与其它按钮、四指暂停
- 新增 **惯用手** 设置：右手（Esc 左上 / B 右黑边）、左手（Esc 右上 / B 左黑边）
- 按钮优先于 Bomb 判定；Bomb 只在一侧黑边生效

### 界面

- 启动器与设置界面简体中文（复用 `ru` 语言槽）；语言选项显示「中文」
- 启动器图标取自原版 `th08.exe`（Reimu，自适应图标）

### 验证

- OnePlus PJE110（Android 16）：60 Hz 锁定、中文界面、左右手切换
- 荣耀畅玩50 JDY-AN00（Android 14）：Stage 1 + Boss、续关、回放、存档正常
