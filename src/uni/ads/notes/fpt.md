---
title: ADS, FPT
---

* [15.2] Use (relatively) faster exponential algorithms to get exact solutions.
* [15.5] **Fixed-parameter tractable** w.r.t. [15.4] computable parameter $k$ if
  running time within $f(k) \cdot \lvert I \rvert^c$ for constant $c$,
  computable $f$.
* [15.6] **Bounded-Search-Tree** algorithms recurse on smaller instances with
  smaller parameters (exhaustive search).
	* Depth in terms of $k$ and not input size.
* [15.10] **Kernelisation** reduces instance $(I, k)$ to $(I', k')$ in
  poly-time, where $k' \leq k$ and $\lvert I' \rvert \leq$ computable $f(k)$.
  Then brute force $(I', k')$.
	* [15.12] Use relaxed LP to kernelise.
	* [15.11] FPT $\implies$ has kernelisation algorithm.
* [16.3] **Colour-coding** for finding specific subgraph.
	* Randomly colour (no. colours = no. vertices in subgraph), then find
	  colourful (1 of each) copy of subgraph. Repeat sufficiently.
* [16.6] Some parameterised problems are not known FPT.
	* Exponential Time Hypothesis: 3SAT does not admit $2^{\mathcal O(n)}$ algo.
* [16.8] Bounded-Search-Tree can be used for non-FPT problems to improve
  exponential running time.
* [16.11] Randomized algorithms can lead to faster exponential algorithms.
