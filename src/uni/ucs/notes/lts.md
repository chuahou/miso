---
title: UCS, LTS Semantics
---

[2.3]

* An operational semantics using **labelled transition systems**.
	* States $S$, initial state $P_0 \in S$, labels $L$.
	* Transition $P \xrightarrow{x} Q$ where $x \in L$.
	* Special invisible action $\tau \in L$ unobservable/uncontrollable by
	  environment.
* Traces calculable from LTS, FDR works on LTS instead of trace-sets.
* Process in FDR
	* Starts in initial state.
	* If state has outward-pointing visible actions, offers these actions to
	  environment to synchronize.
	* Agrees to environment's offered action if no $\tau$ actions.
	* May follow $\tau$ actions instead if available.

---

$$
\mu\, p.\, (a \to p) \sqcap (b \to p)
$$

```{.tex .tikz width=30%}
\node[draw, circle] (p0) at (0,0) {};
\node[draw, fill, circle] (a) at (-1, -2) {};
\node[draw, fill, circle] (b) at (1, -2) {};
\draw[->] (p0) to node[midway, below right] {\(\tau\)} (a);
\draw[->] (p0) to node[midway, below left] {\(\tau\)} (b);
\draw[->] (a) to[bend left] node[midway, above left] {\(a\)} (p0);
\draw[->] (b) to[bend right] node[midway, above right] {\(b\)} (p0);
```
