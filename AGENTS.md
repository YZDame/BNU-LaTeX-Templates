# 给 AI 代理的说明

本仓库是非官方的北京师范大学 LaTeX 模板合集。改模板时遵守下面的结构、编译方式和许可证边界。英文硬性约束在文末。

## 目录

| 路径 | 内容 |
| --- | --- |
| `templates/paper` | 课程论文。`ctexart` + `BNUpapers.sty`，参考文献 `reference.bib` |
| `templates/cv` | 简历。`article` + `fontspec` + `xeCJK` |
| `templates/slides` | 幻灯片。文档类 `bnuslides`，参考文献 `refs.bib` |
| `templates/thesis` | 研究生学位论文。`bnuthesis` v0.0.5，2026-03-01 |
| `assets/bnu-logo` | TikZ 校徽与校名，GPL-3.0 |
| `site/` | GitHub Pages 静态站源文件 |
| `.github/workflows/` | CI、Pages、Release |

不要把 myCV、BeamerTheme、LDMCM、清华学位论文模板或 Elegant 模板整棵拷进本仓库。可以在说明文字里致谢。

## 编译

在仓库根目录执行 `make all`，或进入各自目录：

```bash
cd templates/paper && latexmk -xelatex main.tex
cd templates/cv && latexmk -xelatex main.tex
cd templates/slides && latexmk -xelatex main.tex
cd templates/thesis && latexmk bnuthesis-example.tex && latexmk spine.tex
```

论文和幻灯片需要 BibTeX。`latexmk` 会按 `latexmkrc` 调用。学位论文的 `latexmkrc` 使用 XeLaTeX 生成 xdv，再交给 xdvipdfmx，并打开 shell-escape。CI 使用 TeX Live 全量镜像（`xu-cheng/latex-action`）做同样的事，编译失败则工作流失败，并把 PDF 作为 artifact 上传。

不要把 `main.pdf`、`bnuthesis-example.pdf`、`bnuthesis.pdf`、`spine.pdf`、`*.aux`、`*.log`、`*.bbl`、`*.loa`、`*.hd`、`*-eps-converted-to.pdf` 提交进 git。

## 字体

- 简历只使用 TeX Live 自带字体：英文 `texgyreheros-*.otf`（TeX Gyre Heros），中文 `FandolHei-Regular.otf` / `FandolHei-Bold.otf`。不要恢复 Helvetica Neue LT Pro、方正兰亭黑 ProGB18030，不要添加 `.otf` / `.ttf` 字体文件。
- 幻灯片不要使用微软雅黑。`bnuslides.cls` 以 `fontset=none` 加载 `ctexbeamer`，再按 macOS、Windows（黑体、宋体、楷体）、Linux、Fandol 的顺序选择中文。改字体时保留这条回退，让只有 TeX Live 的环境仍能编译。
- 学位论文类会自动选择字体。在没有 SimSun 和 Noto CJK 的 TeX Live 上会落到 Fandol 与 TeX Gyre Termes。不要为了 CI 去改官方类文件里的字体策略。

## 校徽与校名

- `assets/bnu-logo` 保持 GPL-3.0，目录内的 `LICENSE` 必须留下。论文、简历、幻灯片引用的是其中的 PDF 副本。
- 幻灯片封面文件名是 `BNU_icon.pdf`。Linux 区分大小写，不要写成 `bnu_icon.pdf`。
- `templates/thesis/figures/` 里的校名图来自图书馆论文系统的 2026-03-01 官方包，不是 TikZ 重绘。不要替换、不要重压缩、不要改名。`figures/BNU_name_blue.png` 用于研究生封面；`figures/BNU_name.eps` 是同一包里的校名矢量图；本科生封面用目录外的 `bnu-name-bachelor.pdf`。

## 学位论文

官方来源是北京师范大学图书馆学位论文提交系统：<https://etdlib.bnu.edu.cn/notice/81>。官方最新版优先。本仓库只收 2026-03-01（v0.0.5）这一份，方便离线使用，不代表学校。

`bnuthesis.cls` 随仓库提交，这样新克隆不必先跑 DocStrip 就能编译。修改 `bnuthesis.dtx` 后，在 `templates/thesis` 执行 `xetex bnuthesis.ins` 重新生成 `bnuthesis.cls`。`dtx-style.sty` 只用于编译用户手册，不要提交。用户手册 PDF 同样不要提交。

`Makefile` 的包名是 `bnuthesis`。`make thesis` 与 `make spine` 对应用户手册里的两个目标。

## 许可证与声明

- 根目录 `LICENSE` 是 LPPL-1.3c 全文，覆盖本合集对论文、简历、幻灯片模板的分发。
- `templates/thesis/LICENSE` 是上游模板自带的 LPPL-1.3c，保持原文件。
- `templates/paper/BNUpapers.sty` 文件头保留 LeyuDame 原来的 CC BY 4.0 声明。
- `assets/bnu-logo/LICENSE` 是 GPL-3.0，不要并进 LPPL。
- README、本文件和 Pages 站点都要保留中英双语声明：非官方，与北京师范大学没有隶属关系，未获认可或授权；校名和校徽只作版式演示。

## 站点与发布

- 站点源文件在 `site/`。`scripts/build-site.sh` 把它和根目录 `llms.txt`、四份 PDF 组装到 `_site/`。Pages 工作流在推送到 `main` 时编译并部署。
- `actions/configure-pages` 使用 `enablement: true`。该选项不能靠默认的 `GITHUB_TOKEN` 成功创建 Pages 站点，维护者仍需在仓库 Settings → Pages → Source 选择 GitHub Actions。预期地址：<https://yzdame.github.io/BNU-LaTeX-Templates/>。
- 推送 `v*` 标签时，Release 工作流上传 `bnu-paper.zip`、`bnu-cv.zip`、`bnu-slides.zip`、`bnu-thesis.zip` 和 `bnu-latex-templates.zip`。不要在日常修改里自己推标签。

## Hard rules

- Unofficial. Do not describe the collection as issued or endorsed by Beijing Normal University.
- Thesis copy is bnuthesis v0.0.5 dated 2026-03-01 only. The library page https://etdlib.bnu.edu.cn/notice/81 wins when versions differ. Leave `figures/` school marks byte-for-byte unchanged.
- No commercial or non-redistributable fonts. CV: TeX Gyre Heros + Fandol. Slides: platform fallback ending in Fandol, never Microsoft YaHei.
- `assets/bnu-logo` stays GPL-3.0. Root license stays LPPL-1.3c.
- Do not commit build artifacts. CI must keep compiling all four templates with XeLaTeX.
