---
title: LC, Principal Typing
---

# Principal typing

* [8.1] **Type substitution** $\mathbb S : TV \to \mathbf{Typ}$.
	* Extended to $\mathbf{Typ} \to \mathbf{Typ}$.
	* Written $[A_1/a_1, \ldots, A_n/a_n]$ for distinct $a_i$s.
	* **Identity/empty** substitution $\mathbb E$.
	* [Lecture 16] Support $\operatorname{Supp}(\mathbb S)$ is set of variables
	  $a_i$s of non-trivial components $[A_i/a_i]$.
	* [8.2] **Composition** $\circ$ and **union** $\cup$ the obvious way.
	* [Lecture 17] **Restriction** $\upharpoonright$ to subset of $TV$.
* $A'$ is an **instance** of $A$ if $\mathbb S(A) \equiv A'$ for some
  $\mathbb S$.
	* $A$ is **generalization** of $A'$.
* **Principal type** $A$ of $s$ is such that
	* $\Gamma \vdash s:A$ for some $\Gamma$, and
	* If $\Delta \vdash s:B$ then $B$ is an instance of $A$.
* **Principal deduction** $\bm\Delta_s$ is typing deduction such that any other
  deduction is an instance of it.
	* **Lemma 8.1.1.** If $\bm\Delta$ is a typing deduction then so is
	  $\mathbb S(\bm\Delta)$.

# Unification

* [8.3] **Unifier** $\mathbb U$ of $A$ and $B$ such that
  $\mathbb U(A) \equiv \mathbb U(B)$ (called **unification**).
* **Most general unifier** $\mathbb U$ (m.g.u.) for $A$ and $B$ such that any
  $\mathbb S$ has $\mathbb T$ such that $\mathbb T \circ \mathbb U = \mathbb S$.
	* Unique up to renaming type variables.
* **Theorem 8.3.2.** Every pair of unifiable types has a m.g.u.
	* [Robinson's algorithm](https://dl.acm.org/doi/10.1145/321250.321253) for
	  finding m.g.u. given in notes. Start with $\mathbb E$ and add
	  $[C/c] \,\circ$ each iteration.

# Hindley's algorithm

* [8.4] Outputs principal deduction $\bm\Delta_s$ or that $s$ is untypable.
* Recursive on term structure
	* Variable case $x$: Pick any $a \in TV$. Proof obvious.
	  $$\overline{\{x:a\} \mapsto x:a}$$
	* Abstraction case $\lambda x.p$: Recurse on $p$. Proof by subject
	  construction. <div style="color:red">Red parts if $x \in
	  \operatorname{FV}(p)$.</div>
$$
\frac{\{\red{x:A,} \ldots\} \mapsto p:B}
	{\{\ldots\} \mapsto \lambda x.p: A \Rightarrow B}
$$
	* Application case $pq$: Recurse on $p$ and $q$, obtaining (with no common
	  type variables)
$$
\{\vec x:\vec A, \vec z:\vec C\} \mapsto p:P \\[1ex]
\{\vec y:\vec B, \vec z:\vec D\} \mapsto q:Q
$$
		* If $P \equiv E \Rightarrow F$ then unify
		  $\langle \vec C, E \rangle$ with $\langle \vec D, Q \rangle$.
$$
\frac{\mathbb U(\bm\Delta_p) \hspace{4em} \mathbb U(\bm\Delta_q)}
	{\{\vec x:\mathbb U(\vec A), \vec y:\mathbb U(B), \vec z:\mathbb U(C)\}
	\mapsto pq:\mathbb U(F)}
$$
		* Otherwise $P \equiv a$ then unify
		  $\langle \vec C, a \rangle$ with
		  $\langle \vec D, Q \Rightarrow f \rangle$.
$$
\frac{\mathbb U(\bm\Delta_p) \hspace{4em} \mathbb U(\bm\Delta_q)}
	{\{\vec x:\mathbb U(\vec A), \vec y:\mathbb U(B), \vec z:\mathbb U(C)\}
	\mapsto pq:\mathbb U(f)}
$$
* [8.5] **Corollary.** Typable terms have effectively computable principal
  types.
* **Corollary 8.5.1.** These are decidable:
	* Given $s$ and $A$, does $\Gamma \vdash s:A$?
	* Given $s$, does $\Gamma \vdash s:A$?
