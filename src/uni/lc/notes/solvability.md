---
title: LC, Solvability
---

* [3.3] Closed $s$ is **solvable** if for some closed $t$s,
  $\lambda\beta \vdash st_1\ldots t_n = \mathbf i$.
	* $s$ with $\mathrm{FV}(s) \subseteq \{x_1, \ldots x_n\}$ is solvable if
	  $\lambda x_1\ldots x_n.s$ is solvable.
* **Lemma 3.3.2.** Closed $s$ is solvable iff it has a
  [head NF](redstrats.html#reduction-strategies).
* **Genericity Lemma (3.3.3).** For all unsolvable $s$ and $t$ having a
  $\beta$-NF, and all one-hole contexts $C[X]$,
  $\lambda\beta \vdash C[s] = t \implies \forall u. C[u] = t$.
	* Means unsolvalbe terms are *computationally insignificant*.
* Theories that equate unsolvables
	* $\mathcal H = \lambda\beta + \{ s = t \mid s,t \text{ closed and
	  unsolvable} \}$
	* $\mathcal H^* = \lambda\beta + \{ s = t \mid \forall C[X].\, C[s]
	  \text{ solvable} \iff C[t] \text{ solvable} \}$
	* Both are consistent (see notes).
* Theories that
	* equate all unsolvable terms are **sensible**.
	* do not equate an unsolvable term with a solvable term are
	  **semi-sensible**.
