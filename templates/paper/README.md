# 课程论文模板

适用于课程平时论文和期末论文。正文为 `ctexart`，版式在 `BNUpapers.sty`（页边距 2.5 cm，小四）。封面校名图是 `figures/BNU_name.pdf`，与 `assets/bnu-logo/BNU_name.pdf` 相同，该图以 GPL-3.0 授权，见仓库 `assets/bnu-logo/LICENSE`。

作者 LeyuDame。样式文件在北京大学课程论文模板（Shawn Wang）基础上修改。文件头保留原作者的 CC BY 4.0 声明；本合集的维护副本同时置于根目录 LPPL-1.3c 之下，说明见仓库 README。

第一次使用时，在 `BNUpapers.sty` 里改标题、姓名、学号、院系和页眉。

```bash
cd templates/paper
latexmk -xelatex main.tex
```

等价编译顺序：`xelatex → bibtex → xelatex → xelatex`。参考文献写在 `reference.bib`。
