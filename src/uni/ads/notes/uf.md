---
title: ADS, Union-Find
---

$\Rightarrow$ CLRS 21.

* [2.2] Maintain collection $\mathcal F$ of *disjoint* sets.
	* **Representative** element $\operatorname{rep}(S)$ of $S \in \mathcal F$.
	* `Make-Set(x)`: add $\{x\}$ to $\mathcal F$.
	* `Find-Set(x)`: return $\operatorname{rep}(S) \in \mathcal F$ where
	  $x \in S$.
	* `Union(x, y)`: replace $S \ni x$ and $T \ni y$ with $S \cup T$.
	* $n$ elements and $m$ operations in analysis.
* [2.5] Array and linked list methods have slow $\mathcal O(n)$ `Union`.
* [2.8] Linked list with weighted union.
	* Append shorter list to longer list.
	* Total $\mathcal O(m + n \log n)$ time.
* [2.10] **Disjoint-set forests**.
	* Each set is a tree with $\operatorname{rep}$ as root.
	* Each element has parent pointer.
	* $\mathcal O(1)$ `Make-Set`, $\mathcal O(h)$ `Find-Set` and `Union` where
	  $h$ is tree height.
	* [2.11] **Link-by-height**: link shorter tree root to taller tree.
		* [2.13] Tree with height $k$ has $\geq 2^k$ nodes.
		* $\mathcal O(h) = \mathcal O(\log n)$.
	* [2.15] **Path compression**: during `Find-Set`, set parent of every
	  element passed to root.
		* [2.17] Track **rank** as we did height, then rank $\geq h$ ($h =
		  \mathcal O(\log n)$).
		* [2.18] Amortized $\mathcal O(\log^* n)$
		  ($n \leq 2^{65536} \implies \log^* n \leq 5$).
