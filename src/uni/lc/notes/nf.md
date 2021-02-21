---
title: Normal forms
---

# [2.4] Definitions

A term $s$ is

* in **$R$-normal form** if there is no term $t$ for which $s \to_R t$.
* **$R$-normalizable** if $s \twoheadrightarrow_R t$ and $t$ is in $R$-NF.
* **strongly $R$-normalizable** if there is no infinite sequence
  $s \to_R t_1 \to_R t_2 \to_R \ldots$ (i.e. any sequence of reductions must
  reach $R$-NF in finite steps)

A notion of reduction $R$ is

* **weakly normalizing** if every term is $R$-normalizable.
* **strongly normalizing** if every term is *strongly* $R$-normalizable.

## Diamond and Church-Rosser properties

* The **diamond property** is satisfied by $\to_R$ if
  $$s \to_R t_1 \land s \to_R t_2 \implies t_1 \to_R u \land t_2 \to_R u$$
  for some term $u$.

* $\to_R$ is **Church-Rosser** if its reflexive/transitive closure
  $\twoheadrightarrow_R$ satisfies the diamond property.

* $\to_R$ has the **unique normal form property** if for every term $s$,
  if $s \twoheadrightarrow_R t_1$ and $s \twoheadrightarrow_R t_2$ where
  $t_1,t_2$ are in $R$-NF, then $t_1 \equiv t_2$.

### Lemma 2.4.1

* If $\to_R$ satisfies the diamond property then so does
  $\twoheadrightarrow_R$ (hence $\to_R$ is also Church-Rosser).
* If $\to_R$ is Church-Rosser, then $s =_R t$ iff for some $u$,
  $s \twoheadrightarrow_R u$ and $t \twoheadrightarrow_R u$.
* Church-Rosser $\implies$ unique normal form.

# [2.5] $\beta$-reduction is Church-Rosser

We first define $\to_\Vert$, the parallel $\beta$-reduction as

\begin{aligned}
(\text{refl}) &\; \frac{}{s \to_\Vert s} \\
(\Vert\text{-app}) &\; \frac{s \to_\Vert s' \hspace{1.5em} t \to_\Vert t'}
	{st \to_\Vert s't'} \\
(\text{abs}) &\; \frac{s \to_\Vert s'}{\lambda x.s \to_\Vert \lambda x.s'} \\
(\Vert\text{-}\beta) &\; \frac{s \to_\Vert s' \hspace{1.5em} t \to_\Vert t'}
	{(\lambda x.s)t \to_\Vert s'[t'/x]}
\end{aligned}

which performs more changes in parallel.

In notes/sheet 2 we show that $\to_\Vert$ has the diamond property, and by
checking validity of rules and
[Lemma 1.1.1](syntax.html#inductively-defined-sets), we have

$$\to_\beta \; \subseteq \; \to_\Vert \; \subseteq \; \twoheadrightarrow_\beta$$

We also note that $\twoheadrightarrow_\Vert \;=\; \twoheadrightarrow_\beta$, so
finally

#. $\to_\Vert$ has diamond property $\implies$ so does
   $\twoheadrightarrow_\Vert$
#. $\twoheadrightarrow_\beta \;=\; \twoheadrightarrow_\Vert$ also has diamond
   property
#. Hence $\to_\beta$ is Church-Rosser by [Lemma 2.4.1](#lemma-2.4.1)

# $\eta$-reduction is Church-Rosser

From [Lemma 2.1.2](reductions.html#lemma-2.1.2) we have that $s \to_\eta t$ iff
$s \equiv C[\lambda x.s'x]$ and $t \equiv C[s']$ for some one-hole unary context
$C[X]$. Then by case analysis (see slides) we deduce that
$\twoheadrightarrow_\eta$ has the diamond property and hence $\to_\eta$ is
Church-Rosser.

# $\beta\eta$-reduction is Church-Rosser

Relations $R, S$ **commute** if $s \;R\; t_1$ and $s \;S\; t_2$ implies that
exists some $u$ such that $t_1 \;S\; u$ and $t_2 \;R\; u$.

```{.tex .tikz width=23%}
\tikzset{prove/.style = { thick, draw=green!60!black }}
\node (s) at (0,0) {\(s\)};
\node (t1) at (-1,-1) {\(t_1\)};
\node (t2) at (1,-1) {\(t_2\)};
\node (u) at (0,-2) {\({\color{green!60!black}\exists u}\)};

\draw[thick] (s) -- node[xshift=-8,yshift=8] {\(R\)} (t1);
\draw[thick] (s) -- node[xshift=8,yshift=8] {\(S\)} (t2);
\draw[dotted,prove] (t1) -- node[xshift=-8,yshift=-8] {\({\color{green!60!black}S}\)} (u);
\draw[dotted,prove] (t2) -- node[xshift=8,yshift=-8] {\({\color{green!60!black}R}\)} (u);
```

**Lemma.** If $R, S$ commute and have the diamond property, then so does
$R \cup S$.

Finally, since $\twoheadrightarrow_\beta$ and
$\twoheadrightarrow_\eta^{\text{red}}$ commute and have the diamond property,
$\to_{\beta\eta}$ is Church-Rosser.
