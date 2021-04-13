---
title: LC, Reduction Strategies
---

# Reduction strategies

* [3.1] A binary relation on $\Lambda$ with unique choice of redex.
* **Head reduction** $\overset{\!\!h}{\to}$ reduces the *head redex*
  (underlined)
$$ \lambda x_1\ldots x_m.\underline{(\lambda y.t)u}s_1\ldots s_n
\overset{\!\!h}{\to}
\lambda x_1\ldots x_m.\underline{t[u/y]}s_1\ldots s_n
$$
* **Leftmost reduction** $\overset{\!l}{\to}$ reduces the *leftmost redex* (note
  that $\overset{\!\!h}{\to} \;\subset\; \overset{\!l}{\to}$).
* **Internal reduction** $\overset{\!i}{\to}$ is **NOT** a reduction strategy,
  defined as any $\to_\beta$ that is not a head reduction.
* **Advancement of head reduction (3.1.1).** If $s \twoheadrightarrow_\beta t$
  then there is some $u$ such that
  $s \overset{\!\!h}{\twoheadrightarrow} u \overset{\!i}{\twoheadrightarrow} t$.

# Reduction sequences

* [3.1] A **reduction sequence** for term $s$ with binary relation $\to$ is a
  (possibly infinite) sequence $s \to s_1 \to s_2 \to \ldots$.
* If $\to$ is a reduction *strategy*, then it has a *unique* maximal
  reduction sequence that ends in a $\to$-nf if finite, and infinite otherwise.
* [3.2] A **standard reduction sequence** reduces redexes from left to right.
	* **Lemma 3.2.1.**
		* Any subsequence of a standard reduction sequence is standard.
		* Every $\overset{\!l}{\to}$-reduction sequence is standard (and hence
		  likewise for $\overset{\!\!h}{\to}$).
		* Every standard reduction ending in a $\beta$-nf is a
		  $\overset{\!l}{\to}$ reduction sequence.
	* **Standardization theorem (3.2.2).** If $s \twoheadrightarrow_\beta t$
	  then $s \twoheadrightarrow_s t$ (not necessarily the same sequence).
