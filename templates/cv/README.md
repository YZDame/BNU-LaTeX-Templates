# 简历模板

XeLaTeX 简历。配色取自师大蓝，页眉校名图为 `img/BNU_name.pdf`（与 `assets/bnu-logo` 中的同名文件相同，GPL-3.0）。

本模板由 LeyuDame 改进，基于 [myCV](https://github.com/Htallone/myCV)（原模板参考了 wondercv 的版式）。请保留这一出处。

英文使用 TeX Live 自带的 TeX Gyre Heros，中文使用 TeX Live 自带的 Fandol 黑体。原先的 Helvetica Neue LT Pro 与方正兰亭黑 ProGB18030 是商业字体，已从模板和仓库中移除，请不要再加回来，也不要提交字体文件。

```bash
cd templates/cv
latexmk -xelatex main.tex
```

Overleaf 请把编译器设为 XeLaTeX。`latexmk` 会多跑几遍，以摆正首页照片和校名的绝对位置。
