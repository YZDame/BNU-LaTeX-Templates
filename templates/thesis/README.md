# 研究生学位论文模板（bnuthesis v0.0.5）

这是北京师范大学研究生学位论文 LaTeX 模板 **2026-03-01** 版（`bnuthesis` 0.0.5）的副本，只为取用方便。

官方来源是北京师范大学图书馆学位论文提交系统：<https://etdlib.bnu.edu.cn/notice/81>。学校发布的最新版优先于本仓库中的这一份。本仓库与北京师范大学没有隶属关系，也未获学校认可或授权。

模板在 [ThuThesis](https://github.com/tuna/thuthesis)（清华大学 TUNA 协会）基础上改编，许可证为 LPPL-1.3c，全文见本目录 `LICENSE`。变更记录见 `CHANGELOG.md`。

## 编译

`bnuthesis.cls` 已随目录提供，所以新克隆的仓库可以直接编译，不必先跑 DocStrip。修改 `bnuthesis.dtx` 之后，在本目录执行 `xetex bnuthesis.ins` 重新生成 `bnuthesis.cls` 和 `dtx-style.sty`。

```bash
cd templates/thesis
latexmk bnuthesis-example.tex
latexmk spine.tex
```

`Makefile` 里的包名已改为 `bnuthesis`，因此 `make thesis` 与 `make spine` 也可以。`latexmkrc` 使用 XeLaTeX（先生成 xdv，再经 xdvipdfmx 输出 PDF）并打开 shell-escape。

示例文档的元数据在 `bnusetup.tex`。当前示例是博士学位论文（`degree=doctor`）。

## 校名图

`figures/` 中的校名图按官方压缩包原样保留，没有改像素或换文件：

- `figures/BNU_name_blue.png`：研究生封面校名。`bnuthesis.cls` 的 `\bnu@titlepage@thesis` 通过 `\includegraphics{BNU_name_blue.png}` 引用，图片搜索路径是 `\graphicspath{{figures/}}`。
- `figures/BNU_name.eps`：同一官方包附带的校名矢量图。示例正文没有直接插入它。编译若触发 epstopdf，会生成 `BNU_name-eps-converted-to.pdf`，该生成文件不纳入版本库。
- `bnu-name-bachelor.pdf`（本目录根下，不在 `figures/`）：官方包中的本科生封面校名，由 `\bnu@titlepage@bachelor` 引用。

这些图来自上述图书馆系统发布的 2026-03-01 模板包，不是 `assets/bnu-logo` 里的 TikZ 重绘，请不要互相替换。

## 不要提交的生成文件

`bnuthesis-example.pdf`、`bnuthesis.pdf`、`spine.pdf`、`*.loa`、`*.hd`、`*-eps-converted-to.pdf` 以及 aux/log 都由编译生成。用户手册 `bnuthesis.pdf` 可用 `latexmk bnuthesis.dtx` 生成，不放进仓库。
