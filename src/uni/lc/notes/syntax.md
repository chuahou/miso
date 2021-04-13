---
title: "LC, Syntax"
---

# $\lambda$-terms

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

# Binding of variables

* [1.4] Variables can be
	* **Bound** by a $\lambda$-abstraction (e.g. $\lambda x.s$ has bound $x$),
	  or
	* **Free** otherwise (inductive definition in notes).
* **Closed terms** ($\Lambda^0$) have no free variables.

# Contexts

* [1.6] A **context** $C[X]$ is a term with holes that can be *blindly*
  substituted for any term (**contextual substitution**).
* Blind substitution allows variables to be **captured**.
* Not considered up to [$\alpha$-equivalence](#equational-theories), as
  $C[X] \equiv \lambda x.xX \equiv_\alpha \lambda y.yX \equiv D[X]$
  but
  $C[x] \equiv \lambda x.xx \not\equiv_\alpha \lambda y.yx \equiv D[x]$.
