---
title: Lambda Calculus
---

*Based on the course taught by Hugo Paquet in Hilary Term 2021 and lecture notes
by Andrew Ker.*

# Syntax

## $\lambda$-terms

* [1.1] **Inductively-defined** sets are the smallest sets for which a set of
  rules are all valid (conclusion holds whenever the side condition and
  premisses hold).
	* **Lemma 1.1.1.** For inductively defined sets $S$ and $T$, if every rule
	  for $S$ is valid for $T$ then $S \subseteq T$.
	* [1.2] Structural induction using the same rules.
* [1.2] **Set of $\lambda$ terms** ($\Lambda$) are finite strings defined by
  (notational conventions in notes)

$$
\frac{}{x \in \Lambda} \; x \in \mathcal V
\hspace{2em}
\frac{s \in \Lambda \;\;\; t \in \Lambda}{(st) \in \Lambda}
\hspace{2em}
\frac{s \in \Lambda}{(\lambda x.s) \in \Lambda} \; x \in \mathcal V
$$

* **Subterms** are substrings that are also terms, **strict** if they are not
  the full term. (Recursive rules in notes.) **Strong structural induction** on
  subterms.

## Binding of variables

* [1.4] Variables can be
	* **Bound** by a $\lambda$-abstraction (e.g. $\lambda x.s$ has bound $x$),
	  or
	* **Free** otherwise (inductive definition in notes).
* **Closed terms** ($\Lambda^0$) have no free variables.

## Contexts

* [1.6] A **context** $C[X]$ is a term with holes that can be *blindly*
  substituted for any term (**contextual substitution**).
* Blind substitution allows variables to be **captured**.
* Not considered up to [$\alpha$-equivalence](#equational-theories), as
  $C[X] \equiv \lambda x.xX \equiv_\alpha \lambda y.yX \equiv D[X]$
  but
  $C[x] \equiv \lambda x.xx \not\equiv_\alpha \lambda y.yx \equiv D[x]$.

# Equational theories

* **Syntactic equality** ($\equiv$) equates terms that are the same string.
* [1.4] Terms are **$\alpha$-convertible/equivalent** ($\equiv_\alpha$) if they
  are the same term up to renaming *bound* variables. (Slides show formal
  definition using variable swapping operation $(y\;x)\,\boldsymbol\cdot$)
* [1.5] Terms are **$\beta$-convertible** (infix $\beta$) using
  **capture-avoiding substitution** (cf. [blind contextual
  substitution](#contexts)).
	* Substituting $t$ for every *free* occurrrence of variable $x$ in $s$ is
	  written as $s[t/x]$, defined inductively in slides.
	* $\beta$-conversion: $(\lambda x.s)t \;\beta\; s[t/x]$.

## Theories

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

## Fixed points

* [1.9] A **fixed point** of $s$ is $u$ such that $s u =_\beta u$.
* A **fixed point combinator** is $s$ such that, given any term $f$, $sf$ is a
  fixed point of $f$. Examples include
	* Curry's "paradoxical" combinator:
	  $\mathbf y \equiv \lambda f.(\lambda x.f(xx))(\lambda x.f(xx))$
	* Turing's combinator:
	  $\bm \theta \equiv (\lambda xy.y(xxy))(\lambda xy.y(xxy))$
* **First Recursion Theorem**: every term has a fixed point (just apply a fixed
  point combinator to it).
