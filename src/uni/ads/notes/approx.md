---
title: ADS, Approximation
---

* [13.2] Approximate intractable problems with rigorous guarantees of ratio.
* [13.3] $\rho$-approximation algorithm gives solutions
	* $\leq \rho \cdot \text{OPT}$ for some $\rho \geq 1$ for minimisation.
	* $\geq \rho \cdot \text{OPT}$ for some $\rho > 0$ for maximisation.
* Design methods (adapt to problem).
	* [13.6] **Combinatorial method** by observing problem structure.
	* [13.7] **LP rounding**: problem is ILP $\to$ relax to LP $\to$
	  round to $\mathbb Z$.
	* [13.12] **Greedy algorithms**.
	* [14.3] **Randomisation**. Randomly guess enough times.
		* [14.5] Repeat sufficient iterations to have large success probability.
		* [14.7] Derandomize by greedily maximizing conditional $\mathbb E$.
	* [14.9] **Randomized LP rounding**: do LP rounding, but use LP solution as
	  probabilities for randomized rounding.
	* [14.12] Randomly combining randomized algorithms that perform better for
	  different cases can improve $\mathbb E$ approx ratio.
* [14.14] Approximation can be NP-hard.
	* HamiltonianCycle $\leq$ approximating TSP within factor.
		* [14.15] MetricTSP 2-approximation not NP-hard.
	* [14.19] NP-hardness can apply to specific ratios.
