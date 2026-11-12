% Author: LeyuDame
% Date: 2024-04-20; bibliography support from BNUslides2026 (2026-02-01)
% Github: https://github.com/leyudame/BNUslides
%         https://github.com/YZDame/BNUslides2026
% Sidebar: layout idea from Zhibo Wang, https://github.com/zbowang/BeamerTheme
% CJK: platform fallbacks, then TeX Live Fandol. Microsoft YaHei is not used.
\ProvidesClass{bnuslides}
\LoadClass[aspectratio=169,fontset=none]{ctexbeamer}

% ctex 的 windows 字体集把 beamer 的无衬线中文设成微软雅黑。
% 这里改为：macOS -> Windows（黑体/宋体/楷体）-> Linux -> TeX Live Fandol。
\newcommand{\bnuslides@usecjk}[1]{%
  \setCJKmainfont{#1}%
  \setCJKsansfont{#1}%
  \setCJKmonofont{#1}%
}
\IfFontExistsTF{PingFang SC}{\bnuslides@usecjk{PingFang SC}}{%
\IfFontExistsTF{Heiti SC}{\bnuslides@usecjk{Heiti SC}}{%
\IfFontExistsTF{Songti SC}{\bnuslides@usecjk{Songti SC}}{%
\IfFontExistsTF{SimHei}{\bnuslides@usecjk{SimHei}}{%
\IfFontExistsTF{SimSun}{\bnuslides@usecjk{SimSun}}{%
\IfFontExistsTF{KaiTi}{\bnuslides@usecjk{KaiTi}}{%
\IfFontExistsTF{Noto Sans CJK SC}{\bnuslides@usecjk{Noto Sans CJK SC}}{%
\IfFontExistsTF{Noto Serif CJK SC}{\bnuslides@usecjk{Noto Serif CJK SC}}{%
\IfFontExistsTF{Source Han Sans SC}{\bnuslides@usecjk{Source Han Sans SC}}{%
\IfFontExistsTF{WenQuanYi Zen Hei}{\bnuslides@usecjk{WenQuanYi Zen Hei}}{%
\IfFontExistsTF{WenQuanYi Micro Hei}{\bnuslides@usecjk{WenQuanYi Micro Hei}}{%
  \setCJKmainfont{FandolSong-Regular.otf}[%
    BoldFont = FandolSong-Bold.otf,%
    ItalicFont = FandolKai-Regular.otf,%
  ]%
  \setCJKsansfont{FandolHei-Regular.otf}[%
    BoldFont = FandolHei-Bold.otf,%
    ItalicFont = FandolKai-Regular.otf,%
  ]%
  \setCJKmonofont{FandolFang-Regular.otf}%
}}}}}}}}}}}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{bm}
\RequirePackage{upgreek}
\RequirePackage{mathrsfs}
\RequirePackage{commath}

% 数学字体选择
%\RequirePackage{fourier} 
\RequirePackage{fouriernc}
%\RequirePackage{mathdesign}

\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{multicol}
\RequirePackage{subcaption}

\RequirePackage[numbers]{natbib}
\RequirePackage{appendixnumberbeamer}

\useoutertheme[width=5\baselineskip,right]{sidebar}
% delete title and author
% \makeatletter
\setbeamertemplate{sidebar right}{\insertverticalnavigation{\beamer@sidebarwidth}}

% fontsize
\setbeamerfont{section in sidebar}{size=\scriptsize}
\setbeamerfont{subsection in sidebar}{size=\tiny}
% margin
\setbeamersize{sidebar width right=3.2cm}
\setbeamersize{sidebar width left=1cm}



\definecolor{BUNBlue}{RGB}{0,80,147}
\definecolor{BUNBlueLight}{RGB}{0,120,200}
\definecolor{BUNBlueDark}{RGB}{36, 55, 104}
\definecolor{BUNBlueLighter}{RGB}{0,160,240}

\usefonttheme[onlymath]{serif} % 衬线数学字体
\useinnertheme{default}
\useinnertheme[shadow]{rounded} % 阴影加圆角
%\useinnertheme[]{rounded} % 不加阴影

% 页眉与页脚
\useoutertheme{infolines}
\setbeamercolor{palette primary}{bg=BUNBlueLighter!10,fg=BUNBlue}
\setbeamercolor{palette secondary}{bg=BUNBlueLighter!20,fg=BUNBlue}
\setbeamercolor{palette tertiary}{bg=BUNBlueDark,fg=white}
\setbeamertemplate{frametitle}{\vskip1em\insertframetitle}

\usecolortheme{rose}
\setbeamercolor{title}{fg=BUNBlue,bg=BUNBlue!10}
\setbeamercolor{frametitle}{fg=BUNBlue}
\setbeamercolor{structure}{fg=BUNBlueLight}
\setbeamercolor{section in toc}{fg=BUNBlue}
\setbeamercolor{subsection in toc}{fg=BUNBlue}
\setbeamercolor{section in sidebar}{fg=BUNBlue}
\setbeamercolor{subsection in sidebar}{fg=BUNBlue}
%在每个section 前边单独插入当前章节高亮的目录页
%\AtBeginSection[]
%{
%	\begin{frame}
%		\frametitle{目录}
%		\tableofcontents[currentsection]
%	\end{frame}
%}

\newenvironment{centertikzpicture}
{\begin{center}\begin{tikzpicture}}
			{\end{tikzpicture}\end{center}}

\newcommand{\symbf}[1]{\boldsymbol{#1}}

\renewcommand{\thempfootnote}{\arabic{mpfootnote}}

% 设置行间距
\RequirePackage{setspace}
\AtBeginDocument{\setstretch{1.25}}

\title[BNUslides]{BNUslides: 一份简单的师大蓝主题Beamer}
\subtitle{}
\author[LeyuDame]{LeyuDame}
\institute[北京师范大学]{北京师范大学}
\date[\today]{\today}
\titlegraphic{\includegraphics[width=2cm]{BNU_icon.pdf}}

% 参考文献样式
\setbeamercolor{bibliography entry author}{fg=BUNBlue}
\setbeamercolor{bibliography entry title}{fg=BUNBlueDark}
\setbeamercolor{bibliography entry journal}{fg=BUNBlueLight}
\setbeamercolor{bibliography entry note}{fg=BUNBlueLighter}

% ============================================================
% 参考文献附录支持
% 使用方法（在 main.tex 中）：
%   1. 在主文档末尾使用 \appendix
%   2. 然后使用 \begin{frame}[allowframebreaks]{参考文献}
%   3. 在帧内使用 \bibliographystyle{xxx} 和 \bibliography{xxx}
% ============================================================

% 使用 \appendixnumberbeamer 包后，\appendix 后的页面不会被计入总数
% 参考文献帧的特殊处理
% 不使用 \section 命令，直接用 frame 来避免 sidebar 显示

% 参考文献条目样式
\defbeamertemplate*{bibliography item}{bnuslides}{
	\insertbiblabelitem{\color{BUNBlue}\insertbiblabel}
}

% 自定义环境：参考文献附录（不出现在 sidebar）
% 使用方法：\begin{referencesframe} ... \end{referencesframe}
\newenvironment{referencesframe}
{
	\begin{frame}[allowframebreaks,plain]{参考文献}
}
{
	\bibliographystyle{plain}
	\bibliography{refs}
	\end{frame}
}

% 自定义命令：参考文献章节标题（不出现在 sidebar）
% 用法：\referencesection
\newcommand{\referencesection}{
	% 使用 \pdfbookmark 创建 PDF 书签（可选）
	\pdfbookmark[0]{参考文献}{references}%
}
