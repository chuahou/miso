---
title: Syntax
---

# Set of $\lambda$-terms

## [1.1] Inductively defined sets

* These are sets defined by being the *smallest* set for which a set of rules
  are all valid.
* A rule is **valid** if the conclusion holds whenever the side condition and
  premisses hold. The following rule has premisses $P_1, P_2$, side condition
  $S$ and conclusion $C$.

$$
\frac{P_1 \hspace{1em} P_2}{C} \; (S)
$$

* **Lemma 1.1.1.** For inductively defined sets $S$ and $T$, if every rule for
  $S$ is valid for $T$ then $S \subseteq T$.

## [1.2] $\lambda$-terms

The **set of $\lambda$ terms** $\Lambda$ are finite strings defined by

$$
\frac{}{x \in \Lambda} \; x \in \mathcal V
\hspace{2em}
\frac{s \in \Lambda \;\;\; t \in \Lambda}{(st) \in \Lambda}
\hspace{2em}
\frac{s \in \Lambda}{(\lambda x.s) \in \Lambda} \; x \in \mathcal V
$$

which represent variables, applications and abstractions respectively.

### [1.2] Subterms

**Subterms** are subsequences that are also terms, given by (based on the above
rules)
\begin{aligned}
\operatorname{sub}(x) &= \{ x \} \\
\operatorname{sub}(\lambda x.s) &= \{ \lambda x.s \} \cup \operatorname{sub}(s) \\
\operatorname{sub}(st) &=
\{ st \} \cup \operatorname{sub}(s) \cup \operatorname{sub}(t)
\end{aligned}

**Strict subterms** are subterms excluding the full term.

### [1.2] Conventions

* Omit outermost brackets $(\lambda x.s) \equiv \lambda x.s$
* Application is left-associative $(((wx)y)z) \equiv wxyz$
* $\lambda$ binds to the longest well-defined term
  $\lambda x.abc \equiv \lambda x.(abc)$
* Nested abstractions are condensed $\lambda x.\lambda y.s\equiv \lambda xy.s$
* Application on abstractions to the right do not need brackets
  $f(\lambda x.s) \equiv f\lambda x.s$

### [1.3] Construction trees

We can draw construction trees, for example like so for
$x(\lambda y.(\lambda z.z)w)$.

```{.tex style="width:15%;margin-left:auto;margin-right:auto"}
\usepackage{tikz}
\usepackage{tikz-qtree}
\begin{document}
\begin{tikzpicture}
	\Tree
	[ .@
		$x$
		[ .\(\lambda y\)
			[ .@
				[ .\(\lambda z\) \(z\) ]
				\(w\)
			]
		]
	]
\end{tikzpicture}
\end{document}
```

where variables are leaves, abstractions $\lambda x.s$ have $\lambda x$ with a
single subtree $s$, and applications $st$ have $@$ with subtrees $s$ and $t$.

## [1.2] Structural induction

Induction on $\Lambda$ will be done for property $P$ with

* **Base case**: $P(x)$ for all variables $x \in \mathcal V$
* **Inductive step**
	* Application: if $P(s)$ and $P(t)$ then $P(st)$
	* Abstraction: if $P(s)$ then $P(\lambda x.s)$ for all $x \in \mathcal V$

Strong induction can also be done where the inductive step is: if $P(s)$ for all
*strict* subterms $s$ of term $t$, then $P(t)$.

# [1.4] Free/bound variables

Variables can be

* **Bound** by a $\lambda$-abstraction (e.g. $\lambda x.s$ has bound $x$)
* **Free** otherwise, defined inductively
\begin{aligned}
\operatorname{FV}(x) &= \{x\} \\
\operatorname{FV}(st) &= \operatorname{FV}(s) \cup \operatorname{FV}(t) \\
\operatorname{FV}(\lambda x.s) &= \operatorname{FV}(s) \setminus \{x\}
\end{aligned}

A term without free variables is **closed**.

# [1.5] Contexts

Contexts are terms with "holes", where blind **contextual substitution** can
occur. For example, for a context $C[X] \equiv sX$, then
$C[xyz] \equiv s(xyz)$. Unary contexts have 1 hole, while $n$-ary
contexts have $n$ holes.

Contexts are not considered up to
[$\alpha$-equivalence](theories.html#alpha-conversion), as changing the bound
variable names will have significant impact. E.g. for
$C[X] \equiv \lambda x.xX \equiv_\alpha \lambda y.yX \equiv \mathcal
D[X]$,
$C[x] \equiv \lambda x.xx \not\equiv_\alpha \mathcal D[x] \equiv
\lambda y.yx$.

## Capture

Variables can be captured if they are blindly substituted where they would be
captured by a $\lambda$-abstraction. For example, for a context
$C[X] \equiv \lambda x.X$, we would have $C[x]$ leading to $x$
being captured in $\lambda x.x$ (it becomes a bound variable).
