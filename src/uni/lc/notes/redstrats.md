---
title: Reduction strategies
---

# [3.1] Definitions

A **reduction strategy** $\to$ is a binary relation on $\Lambda$ such that it
has a *unique reduction/choice of redex*, i.e. if $s \to t_1$ and $s \to t_2$,
then $t_1 \equiv t_2$.

Reduction strategies are *not* compatible with term formation rules, e.g.
$s \to t$ does not mean $\lambda x.s \to \lambda x.t$.

## General form for terms

All terms can be written in the form
$$
\lambda x_1 \ldots x_m . u_1 \ldots u_n
$$
where $m \geq 0, n\geq 1$ and $u_1$ is not an application (otherwise rename and
shift).

# [3.1] Strategies for $\beta$-reduction

* **Head reduction** $\overset{\!\!h}{\to}$ reduces the *head redex*
  (underlined)
$$
\lambda x_1\ldots x_m.\underline{(\lambda y.t)u}s_1\ldots s_n
\overset{\!\!h}{\to}
\lambda x_1\ldots x_m.\underline{t[u/y]}s_1\ldots s_n
$$
* **Leftmost reduction** $\overset{\!l}{\to}$ reduces the *leftmost redex* (note
  that $\overset{\!\!h}{\to} \;\subset\; \overset{\!l}{\to}$)
* **Internal reduction** $\overset{\!i}{\to}$ is **NOT** a reduction strategy,
  defined as any $\to_\beta$ that is not a head reduction

The normal form for head reduction, **head normal form**/**hnf**, is a subset
of $\beta$-nf.

## Advancement of head reduction

(Lemma 3.1.1). If $s \twoheadrightarrow_\beta t$ then there is some $u$ such
that
$s \overset{\!\!h}{\twoheadrightarrow} u \overset{\!i}{\twoheadrightarrow} t$.

# [3.1] Reduction sequences

A **reduction sequence** for term $s$ with binary relation $\to$ is a (possibly
infinite) sequence $s \to s_1 \to s_2 \to \ldots$.

If $\to$ is a reduction *strategy*, then by definition it has a *unique* maximal
reduction sequence that ends in a $\to$-nf if finite, and infinite otherwise.

## [3.2] Standard reduction sequences

A $\beta$-reduction sequence $s \twoheadrightarrow_s t$ is standard if it
reduces redexes from left to right. More precisely,

> *Start with the term $s$ written in black, and if $s_i \to_\beta s_{i+1}$ by
reducing redex $R = (\lambda x.p)q$ in $s_i$, then all $\lambda$s to the left of
this $\lambda$ are coloured red (frozen) in $s_{i+1}$. Only redexes with a black
$\lambda$ are allowed to reduce at each step in the sequence.*

For example,
$$
\lambda x.(\underline\lambda y.(\lambda z.z)y)(\lambda w.x) \to_\beta
\red\lambda x.(\underline\lambda z.z)(\lambda w.x) \to_\beta
\red\lambda x.\lambda w.x
$$
is standard, but not the below that reduces a red $\red\lambda$.
$$
\lambda x.(\lambda y.(\underline\lambda z.z)y)(\lambda w.x) \to_\beta
\red\lambda x.(\underline\red\lambda y.y)(\lambda w.x) \to_\beta
\red\lambda x.\lambda w.x
$$

### Lemma 3.2.1

* Any subsequence of a standard reduction sequence is standard.
* Every $\overset{\!l}{\to}$-reduction sequence is standard (and hence likewise
  for $\overset{\!\!h}{\to}$).
* Every standard reduction ending in a $\beta$-nf (i.e.
  $s \twoheadrightarrow_s t$ where $t$ is a $\beta$-nf) is also a
  $\overset{\!l}{\to}$ reduction sequence.

### Standardization theorem

If $s \twoheadrightarrow_\beta t$ then $s \twoheadrightarrow_s t$ (not
necessarily the same sequence).
