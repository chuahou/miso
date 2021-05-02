---
title: L&P, Normal Forms
---

* [3.2] **Literal**: $x \in X$ or $\lnot x$.
* **Conjunctive normal form** (CNF) $\bigwedge_i \bigvee_j L_{i,j}$
* **Disjunctive normal form** (DNF) $\bigvee_i \bigwedge_j L_{i,j}$
* [3.2.1] **Normalisation theorem.** Any formula $F$ can be written in CNF/DNF.
  For CNF,
	* Use double negation and De Morgan's laws $\to$ negations only in literals.
	* Use distributivity to push $\lor$s inwards.
	* Clean up using one/zero laws.
	* Similarly for DNF but swapping $\land$/$\lor$,
	  $\textbf{true}$/$\textbf{false}$.
* [3.2.2] CNF/DNF derivable from truth tables. DNF uses 1s, CNF uses 0s.
