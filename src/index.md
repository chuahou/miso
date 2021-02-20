---
title: miso
no-title: true
---

<br/>

<center style="font-size:24pt">Coming soon™</center>

<br/>

```{.tex .tikz}
\pgfdeclarelayer{background}
\pgfsetlayers{background,main}
\tikzset{
	every node/.style={rectangle, minimum width=2cm, minimum height=0.8cm}
}
\node[fill=purple!20, draw=black] (1) at (0, 1.7) {Hakyll};
\node[fill=blue!20, draw=black] (2) at (2.3, 0.32) {Pandoc};
\node[fill=green!20, draw=black] (3) at (1.3, -1.42) {Tikz};
\node[fill=orange!20, draw=black] (4) at (-1.3, -1.42) {KaTeX};
\node[draw=black] (5) at (-2.3, 0.32) {Styles};
\node (centre) at (0, 0) {miso};

\foreach \a/\b in {1/2,2/3,3/4} {\draw (\a) -- (\b);}
\foreach \a/\b in {4/5,5/1} {\draw[dotted] (\a) -- (\b);}

\begin{pgfonlayer}{background}
\draw[fill=yellow!30, draw=none] (centre) ellipse (6mm and 3mm);
\end{pgfonlayer}
```

<br/>

$$\bm y = \lambda f. (\lambda x.f(xx))(\lambda x.f(xx))$$

<br/>

```{.tex .algorithm}
\State \(i \gets 0\)
\If {\(i = 0\)}
	\State \(i \gets 3\)
\Else
	\State \(i \gets 2\)
\EndIf
```

<br/>

<center>
*Is this really markdown if there's really more HTML and LaTeX than markdown in
the source file?*
</center>

<br/>
