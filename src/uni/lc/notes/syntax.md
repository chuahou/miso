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

## [1.2] $\lambda$-terms

A $\lambda$-term is a **finite string** made up of symbols $\lambda$, brackets
$(,)$, $.$, and variables from countable set $\mathcal V$.

The **set of $\lambda$ terms** $\Lambda$ is then defined by

$$
\frac{}{x \in \Lambda} \; x \in \mathcal V
\hspace{2em}
\frac{s \in \Lambda \;\;\; t \in \Lambda}{(st) \in \Lambda}
\hspace{2em}
\frac{s \in \Lambda}{(\lambda x.s) \in \Lambda} \; x \in \mathcal V
$$

which represent variables, applications and abstractions respectively.

**Subterms** are subsequences that are also terms.

### [1.2] Conventions

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
