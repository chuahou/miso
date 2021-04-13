---
title: LC, Reductions
---

# Reductions

* [2.1] **Notion of reduction** or **redex rule** is a binary relation over a
  set.
* We consider reductions over $\Lambda$
  [(or $\Lambda/\!\!\equiv_\alpha$)](theories.html#notions-of-equality).

For a reduction $R$, we have

* **one-step $R$ reduction $\to_R$** defined by

$$
(R) \; \frac{}{s \to_R t} \; ((s, t) \in R) \hspace{2em}
(\text{abs}) \; \frac{s \to_R t}{\lambda x.s \to_R \lambda x.t} \\[3ex]
(\text{left-app}) \; \frac{s \to_R t}{su \to_R tu} \hspace{2em}
(\text{right-app}) \; \frac{s \to_R t}{us \to_R ut}
$$

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

* **Lemma 2.1.1.**

	* $s \to_R^+ t$ iff
	$s \equiv s_0 \to_R s_1 \to_R \ldots \to_R s_n \equiv t$ for $n \geq 1$
	* $s \twoheadrightarrow_R t$ iff the same
	  for $n \geq 0$
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

* **Lemma 2.1.2.**  $s \to_R t$ iff there is a one-hole unary context $C[X]$ and
  terms $u, v$ such that $C[u] \equiv s$ and $C[v] \equiv t$ and $u \; R \; v$.
	* $u$ is a $R$-redex contracted to $v$.

# $\beta$-reduction

* [2.2] Uses the relation $\beta$ in
  [$\beta$-conversion](theories.html#notions-of-equality)
  ($(\lambda x.s)t \;\beta\; s[t/x]$).
* Implements [$\lambda\beta$ theory](theories.html#theories)
  ($s =_\beta t \iff \lambda\beta \vdash s = t$).
* [2.3] A one-step reduction $\to_\beta$ with redex $(\lambda x.p)q$ contracted
  to $p[q/x]$ is
	* **cancelling** if $x$ does not occur free in $p$ (and is deleted), and
	* **duplicating** if $x$ occurs at least twice in $p$ (and is duplicated).
* [2.3] If for every $\lambda x.p$ in a term, $x$ occurs in $p$
	* at least once, the term is a **$\lambda I$-term**. (non-cancelling)
	* exactly once, the term is **affine**. (non-duplicating)
	* at most once, the term is **linear**. (non-cancelling and non-duplicating)
	* **Lemma 2.3.1.** If $s$ is a ???-term and $s \to_\beta t$ (or
	  $s \to_{\beta\eta} t$) then so is $t$.
	* **Lemma 2.3.2.** (bracketed results)

# $\eta$-reduction/expansion

* [2.2] Based on [extensionality](theories.html#theories), we can have
	* **$\eta$-reduction** given by $\eta^{\operatorname{red}} = \{ \langle
	  \lambda x.sx, s \rangle \mid s \in \Lambda, x \notin \operatorname{FV}(s)
	  \}$
	* **$\eta$-expansion** given by $\eta^{\operatorname{exp}} = \{ \langle
	  \lambda s, x.sx \rangle \mid s \in \Lambda, x \notin \operatorname{FV}(s)
	  \}$
	* $\beta\eta = \beta \cup \eta^{\operatorname{red}}$, which implements
	  [$\lambda\beta\eta$](theories.html#theories).
