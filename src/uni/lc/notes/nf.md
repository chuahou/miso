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
