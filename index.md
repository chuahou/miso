---
title: miso
no-title: true

head-extra: "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://latex.now.sh/style.min.css\"/><style> .tikz { margin-left: auto; margin-right: auto; width: 60%; height: auto; } </style>"
---

<br/>

<center style="font-size:24pt">Coming soon™</center>

<br/>

```tikz
\pgfdeclarelayer{background}
\pgfsetlayers{background,main}
\tikzset{
	every node/.style={rectangle, minimum width=2cm, minimum height=0.8cm}
}
\node[fill=purple!20, draw=black] (1) at (0, 1.7) {Hakyll};
\node[fill=blue!20, draw=black] (2) at (2.3, 0.32) {Pandoc};
\node[fill=green!20, draw=black] (3) at (1.3, -1.42) {Tikz};
\node[draw=black] (4) at (-1.3, -1.42) {KaTeX};
\node[draw=black] (5) at (-2.3, 0.32) {Styles};
\node (centre) at (0, 0) {miso};

\foreach \a/\b in {1/2,2/3} {\draw (\a) -- (\b);}
\foreach \a/\b in {3/4,4/5,5/1} {\draw[dotted] (\a) -- (\b);}

\begin{pgfonlayer}{background}
\draw[fill=yellow!30, draw=none] (centre) ellipse (6mm and 3mm);
\end{pgfonlayer}
```

<br/>

<center>
*Is this really markdown if there's really more HTML and LaTeX than markdown in
the source file?*
</center>

<br/>
