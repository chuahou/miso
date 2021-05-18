---
title: UCS, Parallel Operators
---

* [3.4] **Generalized/interface parallel** $P \mathbin{\underset X\Vert} Q$:
  synchronize on events in $X$.

* [3.1] **Synchronous parallel** $P \mathbin\Vert Q$: agree on everything,
  $= P\mathbin{\underset\Sigma\Vert} Q$
	* $\cap$ on traces.

* [3.2] **Alphabetized parallel** $P \mathbin{{}_A\Vert_B} Q$: agree on $A \cap
  B$, $\approx P \mathbin{\underset{A \cap B}\Vert} Q$
	* $P$ and $Q$ have alphabets $A$ and $B$ respectively.
	* Indexed notation where process $P_i$ has alphabet $A_i$ written
	  $\mathop{\Large\Vert}_{i=1}^n (P_i, A_i)$
	* Traces such that restrictions to each alphabet are traces of each process.

* [3.3] **Interleaving** $P \mathbin{\vert\kern-0.25ex\Vert} Q$: run
  independently, $= P \mathbin{\underset\emptyset\Vert} Q$

* About parallel processes.

	* [3.1.1] Parallel processes can be converted into sequential ones.
		* Deadlock eventually reaches $\textit{STOP}$ sequentially.
	* [3.2] **Commmunication graph** has processes as nodes, and edges when
	  intersection of alphabets $\neq \emptyset$.
		* [4.2.1] **Deadlock graph** has directed edges from process to another
		  process it has an ungranted request to.
			* Deadlock when $\exists$ cycle in this graph.
			* Tree without *strong conflict* is deadlock-free.
	* [3.5] Parallel composition used to *restrict* specifications.
		* [Slide 3.36] $\land$ on trace specifications.
	* Symmetric, associative and distributive once alphabets accounted for, not
	  idempotent. (True for all parallel operators here.)
