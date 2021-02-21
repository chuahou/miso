---
title: Reductions
---

# [2.1] Reduction

A **notion of reduction** or **redex rule** over a set $S$ is a binary relation
on $S$. For our case, we consider reductions over $\Lambda$ [(or
$\Lambda/\!\!\equiv_\alpha$)](theories.html#alpha-conversion).

For a reduction $R$, we have

* **one-step $R$ reduction $\to_R$** defined by

\begin{aligned}
(R) &\; \frac{}{s \to_R t} \; ((s, t) \in R) \\
(\text{left-app}) &\; \frac{s \to_R t}{su \to_R tu} \\
(\text{right-app}) &\; \frac{s \to_R t}{us \to_R ut} \\
(\text{abs}) &\; \frac{s \to_R t}{\lambda x.s \to_R \lambda x.t}
\end{aligned}

* **reflexive closure** $\to_R^=$, with added rule

$$
(\text{refl}) \; \frac{}{s \to_R^= s}
$$

* **transitive closure** $\to_R^+$, with added rule

$$
(\text{trans}) \; \frac{s \to_R^+ t \hspace{1.5em} t \to_R^+ u}{s \to_R^+ u}
$$

* **reflexive and transitive closure** $\twoheadrightarrow_R$, said as "$s$
  $R$-reduces to $t$" if $s \twoheadrightarrow_R t$
* **reflexive, symmetric, transitive closure** $=_R$, "said as $s$ is
  $R$-convertible to $t$" if $s =_R t$, with added rule

$$
(\text{sym}) \; \frac{s =_R t}{t =_R s}
$$

## Alternative characterisations

### Lemma 2.1.1

* $s \to_R^+ t$ (transitive closure) iff for $n \geq 1$ and terms
  $s_0,\ldots,s_n$,

$$ s \equiv s_0 \to_R s_1 \to_R \ldots \to_R s_n \equiv t $$

* $s \twoheadrightarrow_R t$ (reflexive and transitive closure) iff the same for
  $n \geq 0$ (there can be 0 terms in between for reflexivity)

* $s =_R t$ iff there is a zig-zag for some $n \geq 0$ and terms
  $s_0, \ldots, s_{n-1}, t_1, \ldots, t_n$, given by

```{.tex .tikz width=70%}
\node[anchor=east] (s0) at (0,0) {\(s \equiv s_0\)};
\node[anchor=east] (t1) at (1,1) {\(t_1\)};
\node[anchor=east] (s1) at (2,0) {\(s_1\)};
\node[anchor=east] (t2) at (3,1) {\(t_2\)};
\node at (3.5, 0.5) {\(\ldots\)};
\node[anchor=west] (tn1) at (4,1) {\(t_{n-1}\)};
\node[anchor=west] (sn1) at (5,0) {\(s_{n-1}\)};
\node[anchor=west] (tn) at (6,1) {\(t_n \equiv t\)};

\draw[->>] (t1) -- (s0.20);
\draw[->>] (t1) -- (s1);
\draw[->>] (t2) -- (s1);
\draw[->>] (tn1) -- (sn1);
\draw[->>] (tn) -- (sn1);
```

### Lemma 2.1.2

$s \to_R t$ iff there is a one-hole unary context $C[X]$ and terms
$u, v$ such that $C[u] \equiv s$ and $C[v] \equiv t$ and $u \; R \; v$.

We call $u$ a $R$-redex that is contracted to $v$.

# [2.2] $\beta$-reduction

**$\beta$-reduction** uses the
[relation $\beta$](theories.html#beta-conversion-1), defined as

$$
\beta = \{ \langle (\lambda x.s)t, s[t/x] \rangle \mid s, t \in \Lambda \}
$$

It *implements* the
[$\lambda\beta$ theory](theories.html#standard-lambdabeta-theory), since
$s =_\beta t \iff \lambda\beta \vdash s = t$.

## [2.3] Types of reductions/terms

For $s \to_\beta t$, where some redex in $s$ given by $(\lambda x.p)q$ is
contracted to $p[q/x]$ in $t$, the reduction is

* **cancelling** if $x$ does not occur free in $p$ and hence $q$ is deleted,
* **duplicating** if $x$ occurs free in $p$ at least twice and hence $q$ is
  replicated.

If for every $\lambda x.p$ in a term $s$,

* $x$ occurs free at least once in $p$, then $s$ is a **$\lambda I$-term**
* $x$ occurs free at most once in $p$, then $s$ is **affine**/BCK
* $x$ occurs free exactly once in $p$, then $s$ is **linear**/unitary/BCI.

### Lemma 2.3.1/2.3.2

If $s$ is a ???-term and $s \to_\beta t$ (or $s \to_{\beta\eta} t$), then $t$ is
also a ???-term.

If a term is

* $\lambda I$, all $\beta$-reductions on it are non-cancelling
* affine, all $\beta$-reductions on it are non-duplicating
* linear, all $\beta$-reductions on it are non-cancelling and non-duplicating.

# [2.2] $\eta$-reduction/expansion

Based on [extensionality](theories.html#extensionality-lambdabetaeta),
we can have

* **$\eta$-reduction** given by
  $\eta^{\operatorname{red}} = \{ \langle \lambda x.sx, s \rangle \mid s \in
  \Lambda, x \notin \operatorname{FV}(s) \}$
* **$\eta$-expansion** given by
  $\eta^{\operatorname{exp}} = \{ \langle \lambda s, x.sx \rangle \mid s \in
  \Lambda, x \notin \operatorname{FV}(s) \}$
* $\beta\eta = \beta \cup \eta^{\operatorname{red}}$, which implements
  [$\lambda\beta\eta$](theories.html#extensionality-lambdabetaeta).
