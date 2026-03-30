# 语言偏好

**始终使用中文回复用户。**

# gstack

## 网页浏览

**所有网页浏览任务应使用 gstack 的 `/browse` 技能，切勿使用 `mcp__claude-in-chrome__*` 工具。**

gstack 是一个强大的技能集合，提供了各种开发和审查功能。

## 可用技能

- `/office-hours` - YC Office Hours 风格诊断
- `/plan-ceo-review` - CEO/创始人视角规划审查
- `/plan-eng-review` - 工程视角规划审查
- `/plan-design-review` - 设计视角规划审查
- `/design-consultation` - 设计系统咨询
- `/review` - PR 审查
- `/ship` - 发布流程
- `/land-and-deploy` - 合并部署流程
- `/canary` - 金丝雀监控
- `/benchmark` - 性能基准测试
- `/browse` - 网页浏览技能
- `/qa` - 质量保证
- `/qa-only` - 仅 QA 报告
- `/design-review` - 设计审查
- `/setup-browser-cookies` - 浏览器 Cookie 配置
- `/setup-deploy` - 部署配置
- `/retro` - 回顾会议
- `/investigate` - 问题调查
- `/document-release` - 发布文档
- `/codex` - OpenAI Codex 多 AI 意见
- `/cso` - 安全审计
- `/careful` - 谨慎模式
- `/freeze` - 冻结状态
- `/guard` - 防护模式
- `/unfreeze` - 解冻状态
- `/gstack-upgrade` - gstack 升级

## 故障排除

如果 gstack 技能不起作用，请运行以下命令来构建二进制文件并注册技能：

```bash
cd .claude/skills/gstack && ./setup
```

## 设计系统

在进行任何视觉或 UI 相关的修改前，务必先阅读 `DESIGN.md`。
所有字体选择、配色、间距和美学方向都在该文件中定义。
未经用户明确批准，不得偏离设计系统。
