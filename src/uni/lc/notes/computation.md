---
title: LC, Computation
---

# Encodings

## Booleans

* [4] Representation as selectors of values
\begin{aligned}
\mathbf t &\equiv \lambda xy.x &
\mathbf f &\equiv \lambda xy.y \\
\mathbf{and} &\equiv \lambda xy.xy\mathbf f &
\mathbf{or} &\equiv \lambda xy.x\mathbf ty
\end{aligned}
* If-else simply applies value, $\mathbf{cond} \equiv \mathbf i$

## Church numerals

* [4.1] Encodes natural number $n$ as $n$-fold composition,
  $\;\ulcorner\! n \!\urcorner\; \equiv
  \lambda fx.f(f(f\ldots(f\,x))\ldots)$
* Combinators given by
\begin{aligned}
\mathbf{succ} &\equiv \lambda nfx.f(nfx) &
\mathbf{zero?} &\equiv \lambda n.n(\lambda x.\mathbf f)\mathbf t \\
\mathbf{add} &\equiv \lambda mnfx.mf(nfx) &
\mathbf{mult} &\equiv \lambda mnf.m(nf)
\end{aligned}

## Lists

* Encode $\mathbf{nil}$ as $\lambda xy.y \equiv \mathbf f$
* Encode $h :: L$ as $\lambda xy.xhL$
* Operations, using $\mathbf\Omega$ to diverge for empty lists:
$$
\mathbf{isempty?} \equiv \lambda l.l(\lambda xy.\mathbf f)\mathbf t \\[.5ex]
\mathbf{head} \equiv \lambda l.l(\lambda xy.x)\mathbf\Omega \hspace{1em}
\mathbf{tail} \equiv \lambda l.l(\lambda xy.y)\mathbf\Omega
$$

# Recursion

Recursion can be implemented using
[*fixed point combinators*](theories.html#fixed-points) (example in slides).

## Total recursive functions

* [4.2] $\phi : \mathbb N^m \to \mathbb N$ is **$\lambda$-definable** by term
  $f$ if $f \;\ulcorner\! n_1 \!\urcorner\; \ldots \;\ulcorner\! n_m
  \!\urcorner\; \twoheadrightarrow_\beta \;\ulcorner\! \phi(n_1,\ldots,n_m)
  \!\urcorner\;$.
* **Total recursive functions** is set $\mathcal R_0$ inductively defined by
	* Initial functions: zero, successor, projections
	  $\langle n_1, \ldots n_m \rangle \mapsto n_i$
	* Composition ($\bm n$ is vector)
$$\frac{
	\chi: \mathbb N^m \to \mathbb N \in \mathcal R_0 \hspace{1.5em}
	\psi_i: \mathbb N^l \to \mathbb N \in \mathcal R_0
		\text{ for } 1 \leq i \leq m
}{
	\bm n \mapsto \chi(\psi_1(\bm n), \ldots, \psi_m(\bm n)) \in \mathcal R_0
}$$
	* Primitive recursion
$$\frac{
	\chi: \mathbb N^m \to \mathbb N \in \mathcal R_0 \hspace{1.5em}
	\psi: \mathbb N^{m+2} \to \mathbb N \in \mathcal R_0
}{
	\phi = \langle k, \bm n \rangle \mapsto
	\begin{cases}
		\chi(\bm n) &k = 0 \text{ (base case)} \\
		\psi(\phi(k-1, \bm n), k-1, \bm n) &k > 0 \text{ (recursive)}
	\end{cases} \in \mathcal R_0
}$$
	* Minimisation (to $0$) for $\bm n$ where $\exists k.\,\chi(k, \bm n) = 0$
$$\frac{
	\chi: \mathbb N^{m+1} \to \mathbb N \in \mathcal R_0
}{
	(\bm n \mapsto \text{least $k$ such that $\chi(k, \bm n) = 0$})
		\in \mathcal R_0
}$$
* **Theorem 4.2.1.** Function is recursive iff it is $\lambda$-definable.
	* Effectively computable functions are recursive (Church Thesis).
	* $\lambda$-definable functions closed under rules for $\mathcal R_0$.

## Partially recursive functions

* [4.4] $\phi: \mathbb N^m \to \mathbb N$ is **strongly $\lambda$-definable** by
  term $f$ if
	* $f \;\ulcorner\! n_1 \!\urcorner\; \ldots \;\ulcorner\! n_m
	  \!\urcorner\; = \;\ulcorner\! \phi(n_1,\ldots,n_m)
	  \!\urcorner\;$ if $\phi(n_1, \ldots, n_m)$ is defined
	* and is unsolvable otherwise.
* [**Partially recursive functions**](https://en.wikipedia.org/wiki/General_recursive_function)
  are the same as [total recursive functions](#total-recursive-functions) but
  partial functions are allowed.
	* Requirement for minimisation removed.
	* Composition is strict (undefined if any of the composed functions
	  undefined).
* **Turing Completeness.** Function partially recursive iff strongly
  $\lambda$-definable.

# Undecidability

* [4.3] **Gödel numbering** for $\lambda$-terms $\sharp:\Lambda \to \mathbb N$.
	* $\;\ulcorner\!\!\ulcorner\! s \!\urcorner\!\!\urcorner\;
	  = \;\ulcorner\! \sharp s \!\urcorner\;$
	* Recursive functions that are $\lambda$-definable
	  $\mathrm{app}(\sharp s, \sharp t) = \sharp(st)$ and
	  $\mathrm{gnum}(n) = \sharp \,\ulcorner\! n \!\urcorner\;$
* **Second Recursion Theorem 4.3.1.**
  Every term $f$ has term $u$ s.t.
  $\lambda\beta \vdash f \;\ulcorner\!\!\ulcorner\!u\!\urcorner\!\!\urcorner\; = u$.
* **Scott-Curry Theorem 4.3.2.**
  For nonempty $A, B \subseteq \Lambda$ closed under $\beta$, there is no $f$
  such that for $s$, $f \;\ulcorner\!\!\ulcorner\!s\!\urcorner\!\!\urcorner\; =
  \mathbf t \text{ or } \mathbf f$ and $f
  \;\ulcorner\!\!\ulcorner\!s\!\urcorner\!\!\urcorner\; = \begin{cases} \mathbf
  t & s \in A \\ \mathbf f & s \in B \end{cases}$
* **Corollary 4.3.3.** Nontrivial $A \subseteq \Lambda$ closed under $\beta$
  is not recursive.
