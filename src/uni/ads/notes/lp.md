---
title: ADS, Linear Programming
---

$\Rightarrow$ Dasgupta, Papadimitriou, Vazirani 7.1.1/7.4/7.5/7.6.

# Linear Programs

* [9.3] **Optimisation problem** with linear objective function and (non-strict
  inequality) constraints.
	* [9.5] **Feasible**: feasible set $\neq \emptyset$, **bounded**: optimal
	  soln is finite.
	* **Fundamental Theorem of LP**: LP is exactly one of
		* infeasible,
		* feasible and unbounded, or
		* feasible, bounded, and $\exists$ solution achieving optimum.
	* Optimum must be at intersection of some constraints.

<style type="text/css" rel="stylesheet">
div.twocolrow:after {
	content: "";
	display: table;
	clear: both;
}
div.twocolcol {
	float: left;
	width: 50%;
}
</style>
<div class="twocolrow">
<div class="twocolcol" style="width:65%">
* [9.10, 9.16] **Primal formulation** in standard maximum form
	* Maximisation
	* $=$ becomes $\leq$ and $\geq$
	* All constraints are $\leq$
	* All variables nonnegative
</div>
<div class="twocolcol" style="padding:1em;width:35%">
$$
\begin{array}{c l}
\text{max} & c^\intercal x \\
\text{s.t.} & Ax \leq b \\
&x \geq 0
\end{array}
$$
</div>
</div>

<div class="twocolrow">
<div class="twocolcol" style="width:65%">
* [9.16] **Dual formulation** in standard min form
	* [9.17] **Weak duality**: Values feasible in primal $\leq$ values feasible
	  in dual.
	* **Strong duality**: Both optimums equal.
</div>
<div class="twocolcol" style="padding:1em;width:35%">
$$
\begin{array}{c l}
\text{min} & b^\intercal y \\
\text{s.t.} & A^\intercal y \geq c \\
&x \geq 0
\end{array}
$$
</div>
</div>

* [9.18] At most one true:
	* Primal optimum $\leq$ dual optimum
	* Primal unbounded $\implies$ dual infeasible
	* Dual unbounded $\implies$ primal infeasible

# Geometric view

* [9.21] **Polyhedra** analogous to LP constraints
  $P = \{ x \in \mathbb R^n \mid Ax \leq b \}$
	* **Extreme point** $x^*$ of $P$ if not midpoint of any 2 points in $P$.
		* Bounded feasible LPs have optimum at extreme point.
	* **Vertex** of $P$ has $n$ linearly independent active constraints.
		* Vertex $\iff$ extreme point.
* [9.24] **Simplex method**: start from vertex and move to neighbour till
  optimal.

# Applications

* [10.5] **Feasibility questions**: is region feasible?
	* [10.6] Simplex etc. needs starting point, [10.8] add slack variables.
* [10.11] **Integrality constraints** are common.
	* [10.10] Integer linear programs are NP-hard.
	* [10.11] Can round fractional solution to approximate.
	* Some problems have all vertices integral $\implies$ directly solve OK.
		* [10.14] Constraints *totally unimodular* $\to$ sufficient condition.
* [10.15] **Zero-sum games**:
	* Matrix $A$, row player $R$ picks row and likewise for column $C$.
	* $R$ payoff $= A_{ij}$, $C$ payoff $= - A_{ij}$.
	* Mixed strategy: setting probabilities for each choice, either player sets
	  first.
	* [10.18] **Von Neumann's Theorem**: minimax/maximin is Nash equilibrium,
	  order of setting does not matter. (primal-dual pair)
