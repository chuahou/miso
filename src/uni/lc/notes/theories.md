---
title: LC, Equational Theories
---

# Notions of equality

* **Syntactic equality** ($\equiv$) equates terms that are the same string.
* [1.4] Terms are **$\alpha$-convertible/equivalent** ($\equiv_\alpha$) if they
  are the same term up to renaming *bound* variables. (Slides show formal
  definition using variable swapping operation $(y\;x)\,\boldsymbol\cdot$)
* [1.5] Terms are **$\beta$-convertible** (infix $\beta$) using
  **capture-avoiding substitution** (cf. [blind contextual
  substitution](syntax.html#contexts)).
	* Substituting $t$ for every *free* occurrrence of variable $x$ in $s$ is
	  written as $s[t/x]$, defined inductively in slides.
	* $\beta$-conversion: $(\lambda x.s)t \;\beta\; s[t/x]$.

# Theories

* [1.7] A **theory** $\mathcal T$ is a set of equations $s = t$, written
  $\mathcal T \vdash s = t$ to indicate $s$ and $t$ are equal in the theory
  $\mathcal T$, or written $s =_\mathcal T t$
* **Standard $\lambda\beta$ theory**, defined by
	* equivalence rules
$$
(\text{reflexivity}) \; \frac{}{s = s}
\hspace{1.3em}
(\text{symmetry}) \; \frac{s = t}{t = s}
\hspace{1.3em}
(\text{transitivity}) \; \frac{s = t\;\;\;t = u}{s = u}
$$
	* congruence rules (equality combined with inductive rules)
$$
(\text{application}) \; \frac{s = s'\;\;\;t = t'}{st = s't'}
\hspace{2em}
(\text{abstraction}) \; \frac{s = t}{\lambda x.s = \lambda x.t}
$$
	* $\beta$ rule
$$
(\beta) \; \frac{}{(\lambda x.s) t = s[t/x]}
$$
* **Extensional equality** by $\eta$ rule, which when added to $\lambda\beta$
  gives the $\lambda\beta\eta$ theory.
$$
(\eta) \; \frac{}{\lambda x.sx = s} \; x \notin \operatorname{FV}(s)
$$
* [1.8] A theory is...
	* a **$\lambda$-theory** if all the $\lambda\beta$ rules are valid under it.
	* **consistent** if not all terms are equated under it.
	* **maximally consistent/Hilbert-Post complete** if adding any equations
	  makes it inconsistent.

# Fixed points

* [1.9] A **fixed point** of $s$ is $u$ such that $s u =_\beta u$.
* A **fixed point combinator** is $s$ such that, given any term $f$, $sf$ is a
  fixed point of $f$. Examples include
	* Curry's "paradoxical" combinator:
	  $\mathbf y \equiv \lambda f.(\lambda x.f(xx))(\lambda x.f(xx))$
	* Turing's combinator:
	  $\bm \theta \equiv (\lambda xy.y(xxy))(\lambda xy.y(xxy))$
* **First Recursion Theorem**: every term has a fixed point (just apply a fixed
  point combinator to it).
