# 参考文献使用说明

## 基本用法

### 1. 创建参考文献文件

创建 `refs.bib` 文件，格式如下：

```bibtex
@article{einstein1905,
  author = {Albert Einstein},
  title = {Zur Elektrodynamik bewegter K{\"o}rper},
  journal = {Annalen der Physik},
  volume = {322},
  number = {10},
  pages = {891--921},
  year = {1905},
}

@book{lamport1994,
  author = {Leslie Lamport},
  title = {\LaTeX: A Document Preparation System},
  publisher = {Addison-Wesley},
  year = {1994},
}
```

### 2. 在文档中使用引用

在正文中使用 `\cite{}` 引用：

```latex
这是引用示例 \cite{einstein1905}
```

### 3. 添加参考文献附录

在主文档末尾（`\end{document}` 之前）添加：

```latex
\appendix
\begin{frame}[allowframebreaks]{参考文献}
	\bibliographystyle{plain}
	\bibliography{refs}
\end{frame}
```

## 注意事项

1. **编译顺序**：需要运行 `xelatex` 两次来正确显示引用
2. **sidebar 不显示**：`\appendix` 后的参考文献不会显示在侧边栏导航中
3. **页码不计入**：`\appendixnumberbeamer` 确保参考文献页不计入总页数
4. **目录不显示**：参考文献不会显示在目录中

## 完整示例

```latex
\documentclass{bnuslides}
\begin{document}
\section{第一章}
\begin{frame}{标题}
	内容 \cite{lamport1994}
\end{frame}

\section{致谢}
\begin{frame}
	谢谢！
\end{frame}

\appendix
\begin{frame}[allowframebreaks]{参考文献}
	\bibliographystyle{plain}
	\bibliography{refs}
\end{frame}
\end{document}
```

## 参考文献样式

支持的 `bibliographystyle`：
- `plain` - 数字编号，按引用顺序排序
- `unsrt` - 数字编号，按出现顺序排序
- `alpha` - 作者-年份风格
- `abbrv` - 缩写样式

推荐使用 `plain` 或 `unsrt`。
