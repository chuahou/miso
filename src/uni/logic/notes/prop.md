---
title: L&P, Propositional Logic
---

---

* [2.1] Analyses truth values of compound sentences wrt their constituents.
	* **Atomic propositions**: true or false, independent. Content irrelevant.
	* **Logical connectives**: connect sentences.

# Syntax

* [2.2.1] Set of formulas $\mathcal F(X)$
  [inductively defined](../../lc/notes/syntax.html#lambda-terms) over
  countably infinite set $X$ of **propositional variables**.
	* $\textbf{true}$, $\textbf{false}$ are formulas.
	* Members of $X$ are formulas.
	* **Negation** $\lnot F$ is formula.
	* **Conjunction** $(F \land G)$ and **disjunction** $(F \lor G)$ are
	  formulas.
* **Subformulas**: subtrees of syntax tree.
* [2.2.2] **Derived connectives**: macros, not part of syntax.
	* $\to$, $\leftrightarrow$, $\oplus$, $\bigwedge_i$, $\bigvee_i$
* [2.3.3] **Syntactically equivalent**: $F = G$ if they are same string.

# Semantics

* [2.3.1] Definitions.
	* **Truth values** $\{0, 1\}$.
	* **Assignment** $\mathcal A: X \to \{0, 1\}$, extended inductively with the
	  obvious semantics/truth tables to
	  $\mathcal A: \mathcal F(X) \to \{0, 1\}$.
	* For formula $F$ and assignment $\mathcal A$
		* $F$ **holds under** $\mathcal A$/$\mathcal A$ is **model** of $F$ if
		  $\mathcal A\llbracket F\rrbracket = 1$: $\mathcal A \vDash F$.
		* $F$ **satisfiable** if holds under some $\mathcal A$.
		* $F$ is **valid**/**tautology** if holds under all assignments.
	* **Entailment**: $S \vDash F$ if any $\mathcal A$ satisfying all formulas
	  in $S$ also satisfies $F$.
	* **Logically equivalent**: $F \equiv G$ if $\mathcal A\llbracket F
	  \rrbracket = \mathcal A\llbracket G \rrbracket$ for all $\mathcal A$.

# Boolean algebra

* [Slide 3.7] **Boolean algebra**: set $A$ with
	* Elements $\textbf{true}, \textbf{false}$
	* Unary op $\lnot$, binops $\land, \lor$
	* Satisfies Boolean algebra axioms.
* [3.1.1] **Boolean algebra axioms** for $\equiv$ listed in notes, from truth
  tables.
* **De Morgan dual** $\overline F$ such that $\overline F \equiv \lnot F$.
\begin{gathered}
\overline{\textbf{true}} = \textbf{false} \hspace{2em}
\overline{\textbf{false}} = \textbf{true} \hspace{2em}
\overline P = \lnot P \hspace{2em}
\overline{\lnot P} = P \\[0.5ex]
\overline{F \land G} = \overline F \lor \overline G \hspace{2em}
\overline{F \lor G} = \overline F \land \overline G \hspace{2em}
\overline{\lnot F} = \lnot \overline F
\end{gathered}
* [3.1.2] **Substitution** of $F$ for instances of $P$ in $G$ written $G[F/P]$.
* **Substitution Theorem.** If $F \equiv F'$ and $G \equiv G'$ then
  $G[F/P] \equiv G'[F'/P]$.
