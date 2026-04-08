# 设计系统 — AI 目标教练

## 产品背景
- **产品是什么：** 基于 AI 的目标追踪与教练应用
- **目标用户：** 需要目标管理和进度追踪的个人用户
- **领域/行业：** 生产力工具 / 个人成长
- **项目类型：** Flutter 移动应用（iOS + Android）

## 美学方向
- **方向：** Flat Design Mobile (Touch-First) — 扁平化移动优先
- **装饰程度：** 克制 — 2D 平面无阴影，色块分割，几何图形
- **氛围：** 清爽、高效、跨平台一致。App Store 风格，强调可访问性和性能

## 配色方案 (UI-UX-Pro-Max 推荐)
- **方案：** Teal 主色 + 橙色点缀 — 高对比度，WCAG AA 合规
- **主色：** Teal `#0D9488` — 用于主按钮、激活状态、关键数据点
- **主色阶调：**
  - Primary: `#0D9488` (--color-primary)
  - On Primary: `#FFFFFF` (--color-on-primary)
  - Secondary: `#14B8A6` (--color-secondary)
  - Accent/CTA: `#EA580C` (--color-accent)
  - Background: `#F0FDFA` (--color-background)
  - Foreground: `#134E4A` (--color-foreground)
  - Muted: `#E8F1F4` (--color-muted)
  - Border: `#99F6E4` (--color-border)
  - Destructive: `#DC2626` (--color-destructive)
  - Ring: `#0D9488` (--color-ring)

### 颜色使用规范
| 用途 | 颜色 |
|------|------|
| 主按钮背景 | `#0D9488` |
| 主按钮按压 | scale 0.97 立即反馈 |
| 次要按钮 | `#14B8A6` |
| 关键操作 (CTA) | `#EA580C` |
| 成功状态 | `#0D9488` |
| 错误状态 | `#DC2626` |
| 边框 | `#99F6E4` |
| 次要文字 | `#134E4A` |
| 主要文字 | `#134E4A` |
| 页面背景 | `#F0FDFA` |
| 卡片背景 | `#FFFFFF` |
|  muted 背景 | `#E8F1F4` |

## 字体排印
- **主字体：** Plus Jakarta Sans — Google Fonts 免费，现代几何感，支持 iOS Dynamic Type 和 Android 缩放
- **数据/表格：** JetBrains Mono — 等宽数字，tabular-nums 对齐
- **字阶：** 12/14/16/18/20/24/32px（移动优先）

### 字体加载
```html
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

### 字号规范
| 级别 | 字号 | 字重 | 用途 |
|------|------|------|------|
| 32px | Bold (700) | 主标题/页面标题 |
| 24px | SemiBold (600) | 章节标题 |
| 20px | Medium (500) | 卡片标题 |
| 16px | Regular (400) | 正文 |
| 14px | Regular (400) | 次要文字/说明 |
| 12px | Medium (500) | 标签/元数据 |

## 间距系统
- **基准单位：** 8px (4pt/8dp 系统)
- **密度：** 舒适型 — 适合移动端拇指操作，触摸目标 ≥44×44pt
- **阶梯：** 4/8/12/16/24/32/48/64px

### 间距使用规范
| 名称 | 值 | 用途 |
|------|-----|------|
| 2xs | 4px | 图标与文字的微小间距 |
| xs | 8px | 紧密元素间距 |
| sm | 12px | 表单元素内边距 |
| md | 16px | 卡片内边距、标准间距 |
| lg | 24px | 区块间距 |
| xl | 32px | 大区块间距 |
| 2xl | 48px | 页面级间距 |
| 3xl | 64px | 超大间距 |

## 布局
- **方案：** 移动优先网格 — 底部导航 + 卡片式布局 + 清晰的信息层级
- **网格：** 响应式列数（移动端 1 列，平板 2 列，桌面 3-4 列）
- **最大内容宽度：** 1200px
- **圆角：** 克制中等圆角 — sm: 8px, md: 12px, lg: 16px, full: 9999px

### 圆角使用规范
| 名称 | 值 | 用途 |
|------|-----|------|
| sm | 8px | 小型元素、标签 |
| md | 12px | 按钮、卡片、输入框 |
| lg | 16px | 大卡片、模态框 |
| full | 9999px | 头像、开关、徽章 |

## 动效
- **方案：** 功能优先 — 仅必要的状态过渡，辅助理解
- **缓动：** 进入 ease-out / 离开 ease-in / 移动 ease-in-out
- **时长：** 微交互 150ms / 短 250ms / 中 400ms
- **性能：** transform/opacity only，避免 width/height/top/left 动画

### 动效使用规范
| 场景 | 时长 | 缓动 |
|------|------|------|
| 按钮按压 | 立即 (scale 0.97) | 无延迟 |
| 按钮悬停 | 150ms | ease-out |
| 页面切换 | 250ms | ease-in-out |
| 展开/收起 | 400ms | ease-in-out |

## 关键效果 (Flat Design Mobile)
- 立即按压反馈（scale 0.97，无延迟）
- 色块分区（全宽对比色背景）
- 零阴影/无浮雕效果
- 几何图标容器（彩色方块/圆形）
- 底部标签栏实心填充（非浮动）

## 需要避免
- 复杂的新用户引导流程
- 慢性能效果（>500ms 动画）
- Emoji 作为结构图标（使用 SVG：Heroicons/Lucide）
- 灰色文字对比度不足（确保 4.5:1）

## 交付前检查清单
- [ ] 无 Emoji 图标（使用 SVG：Heroicons/Lucide）
- [ ] 所有可点击元素 cursor-pointer
- [ ] 悬停状态平滑过渡（150-300ms）
- [ ] 浅色模式：文字对比度≥4.5:1
- [ ] 焦点状态可见（键盘导航）
- [ ] prefers-reduced-motion 尊重
- [ ] 响应式测试：375px, 768px, 1024px, 1440px
- [ ] 触摸目标≥44×44pt (iOS) / ≥48×48dp (Android)

## 设计决策日志
| 日期 | 决策 | 理由 |
|------|------|------|
| 2026-03-26 | 初始设计系统创建 | 基于简洁专业方向，通过 /design-consultation 技能创建 |
| 2026-03-26 | 使用 JetBrains Mono 显示数据 | 增强专业感，等宽数字便于数据对比 |
| 2026-03-26 | 克制圆角（8px 而非 16px+） | 更严肃的工具感，区别于消费级应用 |
| 2026-03-26 | 无渐变（纯色块） | 区别于 SaaS 模板感，保持简洁 |
| 2026-04-08 | 更新为 Flat Design Mobile 风格 | UI-UX-Pro-Max 推荐，性能优秀，跨平台一致 |
| 2026-04-08 | 主色改为 Teal (#0D9488) | 更高对比度，WCAG AA 合规，现代生产力工具感 |
| 2026-04-08 | 强调色改为橙色 (#EA580C) | 与 Teal 形成互补，CTA 更醒目 |
| 2026-04-08 | 零阴影设计 | 扁平化 2D 风格，性能最优，无 GPU 效果 |
