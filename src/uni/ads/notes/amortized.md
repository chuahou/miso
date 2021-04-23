---
title: ADS, Amortized Analysis
---

$\Rightarrow$ CLRS 17.

* [1.3] Sequence of operations with costs $c_1,\ldots,c_n$ has **amortized
  cost** $\leq C$ if $\sum_{k=1}^i c_k \leq Ci$ for all $i$.
	* Less crude than worst case $\max c_i$.
* [1.7] **Aggregate method**: find aggregate cost $T(n)$ of $n$ ops, then
  $T(n)/n$.
* [1.9] **Accounting/banker's method**:
	* Assign operation $i$ charge $x_i$.
	* Credit banked if $x_i > c_i$, used if $x_i < c_i$.
	* Prove credit $\geq 0$, then $\sum c \leq \sum x$ and amortized cost
	  $\leq \max x_i$.
* [1.10] **Potential method**:
	* Potential $\phi : \text{State} \to \mathbb R^+$ (cf. credit).
	* Charge $x_i = c_i + \phi_i - \phi_{i-1}$.
	* If $\phi_0 = 0$ then $\sum c \leq \sum x$ and amortized cost
	  $\leq \max x_i$.
