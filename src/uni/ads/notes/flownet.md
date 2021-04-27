---
title: ADS, Flow Networks
---

$\Rightarrow$ Kleinberg & Tardos 7.1/7.2/7.3

# Flow Networks

* [5.3] **Flow network** is $(G, s, t, c)$
	* Digraph $G$ with source $s$, sink $t$.
	* Capacity function $c : E \to \mathbb Z^+$.
	* Assume no anti-parallel edges, no edges into $s$ or out of $t$.
* [5.4] **$s$-$t$ cut** partitions vertices $(A, B)$ with $s \in A$, $t \in B$.
	* Capacity is total capacity of edges out of $A$.
	* **Min-cut problem**: find $s$-$t$ cut with minimum capacity.
* [5.5] **Flow** is assignment $f$ on edges where
	* Capacity constraint $0 \leq f(e) \leq c(e)$.
	* Flow conservation: flow out of = flow into every vertex.
	* Value $\lvert f \rvert$ is total flow out of $s$.
* [5.6] [**Weak duality**](lp.md): max flow value $\leq$ min-cut capacity.
	* Cut with capacity = flow value certifies max flow.

# Ford-Fulkerson and friends

* [5.13] **Ford-Fulkerson** finds max flow $f^*$.
	* Algorithm:
		* [5.10] **Residual graph** $G_f$ of flow $f$ has same vertices and
			* If $f(e) < c(e)$ then $e$ with residual capacity
			  $c_f(e) = c(e) - f(e)$
			* If $f(e) > 0$ then reverse edge with capacity $c_f(e) = f(e)$
			* Augment along path $P$ with bottleneck capacity $b_P$.
		* While $\exists$ $s$-$t$ path $P$ in $G_f$, augment along $P$.
	* [6.10] Terminates for integral capacities.
	* $\mathcal O(m\lvert f^*\rvert) = \mathcal O(mnC)$ ($m$ edges, $n$
	  vertices, $C$ max capacity).
* [5.17] Final $G_f$ is cut with capacity $f^*$, certifying max flow.
* [6.12] Improve by choosing better $P$.
	* [6.13] **Capacity scaling** increases flow by at least 1/2 max $b_P$.
		* $G_f(\Delta)$ restricted to edges with $c_f \leq \Delta$.
		* Halve $\Delta$ when necessary.
		* $\mathcal O(m^2 \log C)$.
	* [6.17] **Edmonds-Karp** uses BFS to choose shortest path, $\mathcal
	  O(nm^2)$.
	* State of the art $\mathcal O(nm)$.

# Applications

$\Rightarrow$ Kleinberg & Tardos 7.5–7.13

## Bipartite matching

* [7.3] Find max cardinality matching in bipartite graph.
	* [7.4] Reduce to max-flow on $\red{s \to} L \to R \red{\to t}$.
	* [7.7] Perfect matching if flow = partition size.
* [7.9] **Hall's theorem**: Bipartite graph has perfect matching $\iff$
  for every subset of paritition, $\lvert N(S) \rvert \geq \lvert S \rvert$.
  ($N(S)$ are neighbours of $S$.)
	* [7.12] Can find $S$ s.t. $\lvert N(S) \rvert < \lvert S \rvert$ when no
	  perfect matching.
	* Use $s \to L \xrightarrow\infty R \to t$ and find min-cut $(A, B)$, and
	  have $S = L \cap A$.

## Min-cost perfect matching

* [8.3] Find perfect matching with minimum cost. (Edges have costs.)
* Adopt Ford-Fulkerson.
	* [8.7] Residual graph alternates unmatched and matched edges.
		* [8.9] Negative cost for matched reverse edges.
	* [8.13] While not perfect, augment along min-cost path, increasing
	  matching size by 1. $\mathcal O(mn^2)$.
	* [8.11] Perfect matching is min-cost $\iff G_M$ has no negative cycles.
		* [8.14] Algorithm produces no negative cycles, proof with prices.
		* [8.17] Adapted algorithm with prices $\mathcal O(mn\log n)$.

## Circulation with demands

* [7.14] Demand per vertex $d : V \to \mathbb Z$. No source/sink.
	* Flow conservation:
	  $\sum_\text{in} f(e) - \sum_\text{out} f(e) \red{= d(v)}$.
	* Does circulation exist?
	* [7.15] Reduce to flow network with added source/sink.
		* If $d(v) < 0$, $c((\red s, v)) = -d(v)$.
		* If $d(v) > 0$, $c((v, \red t)) = d(v)$.
		* Max-flow = demand = supply $\iff$ has circulation.
* [7.16] With lower bounds $\ell: E \to \mathbb Z^+$.
	* Capacity constraints: $\red{\ell(e) \leq} f(e) \leq c(e)$.
	* [7.17] Remove lower bounds. For $e = (u, v)$,
		* $d(u) \gets d(u) + \ell(e)$
		* $d(v) \gets d(v) - \ell(e)$
* [7.19] Survey/airline scheduling etc. as circulations.
