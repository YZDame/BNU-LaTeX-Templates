# 北京师范大学 LaTeX 模板合集

非官方的课程论文、简历、幻灯片和研究生学位论文 LaTeX 模板。用 XeLaTeX 编译，面向 TeX Live。

**本仓库与北京师范大学没有隶属关系，未获北京师范大学认可或授权。** 校名和校徽只用于演示版式。使用标识前请自行核对学校的规范。学位论文模板以图书馆系统上的最新版为准，见下文。

**This repository is unofficial.** It is not affiliated with, endorsed by, or authorized by Beijing Normal University. The name and emblem are for layout demonstration only. Check the university’s identity rules before reuse. For the graduate thesis template, the copy dated 2026-03-01 does not replace the latest file on the library site.

## 仓库结构

| 路径 | 内容 |
| --- | --- |
| `templates/paper` | 课程论文（`ctexart`） |
| `templates/cv` | 简历 |
| `templates/slides` | 幻灯片（`bnuslides`） |
| `templates/thesis` | 研究生学位论文，bnuthesis v0.0.5（2026-03-01） |
| `assets/bnu-logo` | TikZ 校徽与校名（GPL-3.0） |
| `site/` | 说明网页 |
| `AGENTS.md` | 给 AI 代理的修改约定 |
| `llms.txt` | 给语言模型的短索引 |

站点发布后的地址是 <https://yzdame.github.io/BNU-LaTeX-Templates/>。首次启用需要在仓库设置里把 Pages 的 Source 选成 GitHub Actions，原因见下文「网页」。

## 快速开始

### 本地（TeX Live）

仓库根目录：

```bash
make all
```

或分别编译：

```bash
cd templates/paper && latexmk -xelatex main.tex
cd templates/cv && latexmk -xelatex main.tex
cd templates/slides && latexmk -xelatex main.tex
cd templates/thesis && latexmk bnuthesis-example.tex && latexmk spine.tex
```

论文与幻灯片的等价顺序是 `xelatex → bibtex → xelatex → xelatex`。学位论文的 `latexmkrc` 会自己选择 XeLaTeX。

### Overleaf

把对应的 `templates/<name>` 目录打成 zip 上传。编译器选 **XeLaTeX**。论文和幻灯片保持默认的 latexmk，这样会跑 BibTeX。简历没有参考文献。学位论文请上传 `templates/thesis` 整目录，主文件用 `bnuthesis-example.tex`。

## 课程论文

适用于平时作业和期末论文。默认 A4、页边距 2.5 cm、小四。封面、目录和参考文献是现成的。

- 主文件 `main.tex`，版式 `BNUpapers.sty`，文献库 `reference.bib`。
- 第一次使用时，在 `BNUpapers.sty` 里改标题、姓名、学号、院系和页眉。
- 封面校名是 `figures/BNU_name.pdf`，与 `assets/bnu-logo` 中的文件相同。
- 作者 LeyuDame，在 Shawn Wang 的北京大学课程论文模板上修改。样式文件头保留原 CC BY 4.0 声明。

## 简历

XeLaTeX。师大蓝配色，首页有校名和照片占位。

- 由 LeyuDame 改进，**基于 [myCV](https://github.com/Htallone/myCV)**（原模板参考了 wondercv 的版式）。请保留这一出处。
- 英文为 TeX Gyre Heros，中文为 Fandol 黑体，都随 TeX Live 提供。
- 商业字体 Helvetica Neue LT Pro 和方正兰亭黑 ProGB18030 及其字体文件已移除，不要加回去。

## 幻灯片

16:9 的师大蓝 Beamer。本目录采用 [BNUslides2026](https://github.com/YZDame/BNUslides2026)，它比 [leyudame/BNUslides](https://github.com/leyudame/BNUslides) 多了 `refs.bib`、参考文献帧和 `appendixnumberbeamer`。

- 作者 LeyuDame。右侧分节目录的做法来自 [Zhibo Wang 的 BeamerTheme](https://github.com/zbowang/BeamerTheme)。
- 封面校徽文件名是 `BNU_icon.pdf`。
- 中文不再绑定微软雅黑。类文件依次尝试 macOS（苹方、黑体-简、宋体-简）、Windows（黑体、宋体、楷体）、Linux（Noto、思源黑体、文泉驿），最后使用 TeX Live 的 Fandol。只有 TeX Live 时也能编译。
- 引用说明见 `templates/slides/REFERENCES.md`。

## 研究生学位论文

`templates/thesis` 是 **bnuthesis v0.0.5（2026-03-01）** 的副本，只为取用方便。

官方来源是北京师范大学图书馆学位论文提交系统：<https://etdlib.bnu.edu.cn/notice/81>。**学校发布的最新版优先于本仓库中的这一份。** 本合集与学校没有隶属关系。

模板在 [ThuThesis](https://github.com/tuna/thuthesis)（清华大学 TUNA 协会）基础上改编，许可证 LPPL-1.3c，全文在 `templates/thesis/LICENSE`，变更记录在 `CHANGELOG.md`。

`bnuthesis.cls` 已经放在目录里，克隆后可以直接编译。改过 `bnuthesis.dtx` 之后，执行 `xetex bnuthesis.ins` 重新生成类文件。示例配置在 `bnusetup.tex`，当前示例是博士学位论文。书脊示例是 `spine.tex`。

`figures/` 里的校名图按官方压缩包原样保留：

- `figures/BNU_name_blue.png`：研究生封面校名，由 `\bnu@titlepage@thesis` 引用。
- `figures/BNU_name.eps`：同一官方包中的校名矢量图。
- `bnu-name-bachelor.pdf`：本科生封面校名（不在 `figures/` 内）。

这些文件不是 `assets/bnu-logo` 的 TikZ 重绘，不要互相替换。

## 网页

推送到 `main` 后，GitHub Actions 会编译四份模板，把预览图、PDF 和 `llms.txt` 部署到 GitHub Pages。

工作流使用 `actions/configure-pages`，并且设置了 `enablement: true`，让它尝试自动打开 Pages。这个选项**不能使用默认的 `GITHUB_TOKEN`**：官方说明要求另备个人访问令牌（`repo` 范围或 Pages 写权限），或具有 `administration:write` 与 `pages:write` 的 GitHub App。因此在新仓库上，**需要维护者手动做一次**：

1. 打开仓库的 Settings → Pages。
2. 在 Build and deployment 里把 Source 选为 **GitHub Actions**。

完成之前，Pages 工作流会停在 configure-pages。完成之后，再推送到 `main` 即可部署到：

<https://yzdame.github.io/BNU-LaTeX-Templates/>

## 发布压缩包

推送符合 `v*` 的标签时（例如 `v1.0.0`），Release 工作流会编译并附上：

- `bnu-paper.zip`
- `bnu-cv.zip`
- `bnu-slides.zip`
- `bnu-thesis.zip`（源文件、示例 PDF 和书脊 PDF）
- `bnu-latex-templates.zip`（上述全部，外加说明和 `assets/bnu-logo`）

论文、简历、幻灯片的压缩包带有各自用到的校名或校徽 PDF、模板的 LPPL-1.3c `LICENSE`，以及校徽的 GPL-3.0 文本。

## 许可证

| 部分 | 许可证 |
| --- | --- |
| 本合集中的课程论文、简历、幻灯片模板 | 根目录 `LICENSE`：LPPL-1.3c |
| `templates/paper/BNUpapers.sty` 的原作者声明 | 文件头保留的 CC BY 4.0（LeyuDame） |
| `templates/thesis` | 目录内 `LICENSE`：LPPL-1.3c（上游文件，基于 ThuThesis） |
| `assets/bnu-logo` | 目录内 `LICENSE`：GPL-3.0，不随根许可证改变 |

LPPL 要求分发时能看出哪些文件构成作品。本合集的作品文件是 `templates/`、`assets/bnu-logo`、`README.md`、`AGENTS.md`、`llms.txt` 和根目录 `LICENSE`。编译生成的 PDF 与辅助文件不是源文件的一部分。

## 致谢

- 课程论文：LeyuDame。基础版式来自 Shawn Wang 的北京大学课程论文模板。
- 简历：LeyuDame，基于 Htallone 的 [myCV](https://github.com/Htallone/myCV)。
- 幻灯片：LeyuDame。侧栏目录参考 Zhibo Wang 的 [BeamerTheme](https://github.com/zbowang/BeamerTheme)。2026 版补上了参考文献。
- 校徽 TikZ：LeyuDame，[BNU_icon_Tikz](https://github.com/leyudame/BNU_icon_Tikz)，GPL-3.0。
- 学位论文：北京师范大学图书馆学位论文提交系统发布的 bnuthesis 0.0.5；上游为清华大学 TUNA 协会的 ThuThesis。

## English

This collection packages four XeLaTeX templates for convenient reuse.

- **Paper** (`templates/paper`): course essays with `ctexart`, `BNUpapers.sty`, and BibTeX. LeyuDame, adapted from Shawn Wang’s Peking University course-paper template. The style file still carries its original CC BY 4.0 notice.
- **CV** (`templates/cv`): LeyuDame’s layout **based on [myCV](https://github.com/Htallone/myCV)**. Latin text uses TeX Gyre Heros and Chinese uses Fandol Hei, both shipped with TeX Live. Helvetica Neue LT Pro and Founder Lan Ting Hei (ProGB18030) were removed and must not be added back.
- **Slides** (`templates/slides`): `bnuslides` from the 2026 fork, which adds `refs.bib`. Author LeyuDame. The sidebar follows Zhibo Wang’s [BeamerTheme](https://github.com/zbowang/BeamerTheme). Chinese fonts fall back through macOS, Windows (SimHei, SimSun, KaiTi), and Linux fonts, and finally TeX Live Fandol. Microsoft YaHei is not required. The emblem file is `BNU_icon.pdf`.
- **Thesis** (`templates/thesis`): bnuthesis v0.0.5 dated 2026-03-01, LPPL-1.3c, based on [ThuThesis](https://github.com/tuna/thuthesis). **Official source: <https://etdlib.bnu.edu.cn/notice/81>. The official latest version takes precedence.** This repository only carries the 2026-03-01 copy. `bnuthesis.cls` is included so a fresh checkout compiles; regenerate it with `xetex bnuthesis.ins` after changing the dtx. School-name artwork in `figures/` is unchanged from that official package (`BNU_name_blue.png` on the graduate cover, `BNU_name.eps` beside it, and `bnu-name-bachelor.pdf` for the bachelor cover).

Build locally with `make all` or with `latexmk` as shown above. On Overleaf, set the compiler to XeLaTeX.

**Disclaimer.** Unofficial. Not affiliated with, endorsed by, or authorized by Beijing Normal University. Emblems and the university name appear only to show the layout.

**License.** Paper, CV, and slides in this collection: LPPL-1.3c (`LICENSE`). The thesis directory keeps its own LPPL-1.3c `LICENSE`. `assets/bnu-logo` remains GPL-3.0.

**Pages.** The site is deployed on pushes to `main`. `actions/configure-pages` is called with `enablement: true`, but that API call needs a token other than `GITHUB_TOKEN`. A maintainer must once set Settings → Pages → Build and deployment → Source to **GitHub Actions**. The site is then <https://yzdame.github.io/BNU-LaTeX-Templates/>.

**Releases.** A `v*` tag builds `bnu-paper.zip`, `bnu-cv.zip`, `bnu-slides.zip`, `bnu-thesis.zip`, and `bnu-latex-templates.zip`. Each of the first three includes the logo PDF it needs, the LPPL-1.3c `LICENSE`, and the logo’s GPL-3.0 text. The thesis archive includes its own LPPL license and the compiled example PDF.
