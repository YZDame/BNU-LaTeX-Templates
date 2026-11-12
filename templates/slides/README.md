# 幻灯片模板

师大蓝 Beamer，文档类 `bnuslides`。本目录采用 [BNUslides2026](https://github.com/YZDame/BNUslides2026)（[leyudame/BNUslides](https://github.com/leyudame/BNUslides) 的分支）。2026 版在 2024 版之上增加了 `refs.bib`、参考文献帧和 `appendixnumberbeamer`，因此作为更完整的一份收录。

作者 LeyuDame。右侧分节目录的做法来自 [Zhibo Wang 的 BeamerTheme](https://github.com/zbowang/BeamerTheme)。封面校徽 `BNU_icon.pdf` 来自 `assets/bnu-logo`（GPL-3.0）。在大小写敏感的系统上，文件名必须是 `BNU_icon.pdf`。

中文不再使用微软雅黑。`bnuslides.cls` 关闭 ctex 的默认字体集，按 macOS（苹方 / 黑体-简 / 宋体-简）、Windows（黑体 / 宋体 / 楷体）、Linux（Noto、思源黑体、文泉驿）的顺序探测，最后使用 TeX Live 自带的 Fandol。这样在只有 TeX Live 的 CI 里也能编译。

```bash
cd templates/slides
latexmk -xelatex main.tex
```

等价顺序：`xelatex → bibtex → xelatex → xelatex`。引用写法见 `REFERENCES.md`。
