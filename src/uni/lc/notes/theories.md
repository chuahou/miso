---
title: Equational theories
---

# Syntactic equality

Two terms $s$ and $t$ are syntactically equal if they are the same string,
written $s \equiv t$.

# [1.4] $\alpha$-conversion

Two terms $s$ and $t$ are **$\alpha$-convertible/equivalent** if they are the
same term up to renaming *bound* variables, written $s \equiv_\alpha t$.

We write "swap variables $x$ and $y$" as $(x\;y)\,\boldsymbol\cdot$. Then,
$\equiv_\alpha$ is defined by

$$
\frac{}{x \equiv_\alpha x}
\hspace{2em}
\frac{s \equiv_\alpha s' \hspace{1em} t \equiv_\alpha t'}{st \equiv_\alpha s't'}
\hspace{2em}
\frac{(y\;x)\boldsymbol\cdot s \equiv_\alpha (y\;x')\boldsymbol\cdot s'}
	{\lambda x.s \equiv_\alpha \lambda x.s'}
\;y \notin \operatorname{FV}(ss')
$$

We typically consider $\alpha$-convertible terms to be identical syntactically
as well (i.e. we consider $\Lambda/\!\!\equiv_\alpha$, which is $\Lambda$
[quotiented](https://en.wikipedia.org/wiki/Equivalence_class) by
$\equiv_\alpha$.)

**Variable convention**: when countably many terms appear in a
definition/theorem/proof, we silently $\alpha$-convert to have unique bound
variables that are not the same as any other bound/free variables.

# [1.5] $\beta$-conversion

## Capture-avoiding substitution

"Substituting $t$ for every free occurrence of variable $x$ in $s$" is written
as $s[t/x]$. It is defined, for variables $x, y$, and terms $s, t, u$ as

\begin{aligned}
y[t/x] &\equiv \begin{cases}
	t & x \equiv y \\
	y & x \not\equiv y
\end{cases} \\
(su)[t/x] &\equiv (s[t/x])(u[t/x]) \\
(\lambda y.s)[t/x] &\equiv \lambda y.s[t/x] &\text{if } y \not\equiv x \text{
	and } y \notin \operatorname{FV}(t)
\end{aligned}
and performing $\alpha$-conversion when necessary.

We can compare this to [blind substitution in contexts](syntax.html#contexts),
which does not care about variable capture.

## $\beta$-conversion

Then, **$\beta$-conversion** is written infix as $\beta$, defined by

$$(\lambda x.s)t \;\,\beta\,\; s[t/x].$$

# [1.7] Theories

A **theory** $\mathcal T$ is a set of equations $s = t$, written
$\mathcal T \vdash s = t$ to indicate $s$ and $t$ are equal in the theory
$\mathcal T$.

## Standard $\lambda\beta$ theory

The standard **$\lambda\beta$ theory** is defined by

* equivalence rules
$$
(\text{reflexivity}) \; \frac{}{s = s}
\hspace{2em}
(\text{symmetry}) \; \frac{s = t}{t = s}
\hspace{2em}
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

Equality under this theory is also written $=_\beta$.

## Extensionality ($\lambda\beta\eta$)

Functions are **extensionally equal** iff they have the same output for the same
input on all inputs. This is captured by the $\eta$ rule
$$
(\eta) \; \frac{}{\lambda x.sx = s} \; x \notin \operatorname{FV}(s)
$$
which when added to $\lambda\beta$ gives the $\lambda\beta\eta$ theory.

## Properties

* A theory is a **$\lambda$ theory** if all the rules of $\lambda\beta$ are
  valid under it.
	* The **least $\lambda$ theory** containing a set of equations $A$ is given
	  by adding all equations in $A$ to the axioms of $\lambda\beta$.
* A theory is **consistent** if there are some terms $s, t$ such that under the
  theory $s \neq t$.
* A theory is **maximally consistent** (aka **Hilbert-Post complete**) if adding
  any equations to it makes it inconsistent.

# [1.9] Fixed points

A **fixed point** of $s$ is $u$ such that $s u =_\beta u$.

A **fixed point combinator** is $s$ such that, given any term $f$, $sf$ is a
fixed point of $f$, i.e. it produces a fixed point of any $f$. Examples include

* Curry's "paradoxical" combinator:
  $\mathbf y \equiv \lambda f.(\lambda x.f(xx))(\lambda x.f(xx))$
* Turing's combinator:
  $\bm \theta \equiv (\lambda xy.y(xxy))(\lambda xy.y(xxy))$

The **First Recursion Theorem** directly follows: *every term has a fixed
point* (simply apply a fixed point combinator to any term).
