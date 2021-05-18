---
title: UCS, Traces Model
---

# Traces model

* [1.4] **Trace** is a sequence of communcations of process.
* [2.2.1] $\textit{traces}(P) \subseteq \Sigma^*$ is set of all finite traces of
  $P$.
	* Nonempty (contains at minimum $\langle\rangle$) and prefix-closed.
	* Each operator has a rule (see book/notes).
		* $\square$ and $\sqcap$ have same traces semantics.
		* Recursion: $\textit{traces}(\mu\,p.Q)$ is least fixed point of $F$,
		  where $F(X)$ maps $\textit{traces}(P) \mapsto
		  \textit{traces}(Q[P/p])$.
		* Mutual recursion: same but over vectors of processes and trace-sets.
	* **Traces model** $\mathcal T$: set of all such subsets.
	* [2.2.2] Trace equality $P =_T Q$ means
	  $\textit{traces}(P) = \textit{traces}(Q)$.
		* $P = Q$ in the [algebra](algebra.md) $\implies P =_T Q$ (but not
		  $\mathord{\impliedby}$).
* [2.2.3] Guarded recursions have a **unique fixed point** (under $=_T$).
	* [2.2.1] Guarded recursion: all recursive calls preceded by event(s).

# Trace specifications

* [2.2.4] **Behavioural trace specification**:
  $P \mathrel{\textbf{sat}} R(tr)$ means
  $\forall tr \in \textit{traces}(P).\,R(tr)$.
	* Inductive proof rules by Hoare in book/notes.
	* [Slide 2.37] Recursion proof rule: $X$ is least fixed point of
	  $\mu\,P.F(P)$
		* If $\textit{STOP} \mathrel{\textbf{sat}} R(tr)$, and
		* $Y \mathrel{\textbf{sat}} R(tr) \implies F(Y) \mathrel{\textbf{sat}}
		  R(tr)$,
		* Then $X \mathrel{\textbf{sat}} R(tr)$.
		* Can also apply componentwise for mutual recursion.
	* $\textit{STOP}$ satsifies any spec that is satisfied by some processes.
* In practice, construct process $\textit{Spec} \mathrel{\textbf{sat}} R(tr)$
  and test $\textit{Spec} \sqsubseteq_T \textit{Impl}$.
* [1.4] $P$ **trace refines** $Q$: $P \sqsupseteq_T Q$ iff
  $\textit{traces}(P) \subseteq \textit{traces}(Q)$.
	* [2.2.4] Refinement is transitive and monotone.
		* Can refine each component (compositional development).
	* $P \sqsubseteq_T P'$ and $P \mathrel{\textbf{sat}} R(tr)$ implies
	  $P' \mathrel{\textbf{sat}} R(tr)$.
		* Stepwise refinement $\textit{Spec} \sqsubseteq P \sqsubseteq \ldots
		  \sqsubseteq \textit{Impl}$.
* [2.2.4] **Characteristic process** $P_R$ of specification $R$ is such that
  $Q \mathrel{\textbf{sat}} R(tr) \iff P_R \sqsubseteq_T Q$.
	* $P_R =_T \mathop{\Large\sqcap}\{P \mid P \mathrel{\textbf{sat}} R(tr)\}$.
	* Decide satisfaction of $R$ by refinement of $P_R$.

# Trace notation

* [2.2.1] Sequence notation $\langle a, b, c \rangle$.
* Concatenation ${}\mathbin{\hat{}}{}$.
* $n$-fold concatenation $s^n$.
* $s$ prefix of $t$ written $s \leq t$.
* [2.2.4] $\#s$ denotes length of sequence $s$.
* $s \upharpoonright A$ for $A \subseteq \Sigma$ means sequence $s$ restricted
  to members of $A$.
* $s \downarrow c$ for $c \in \Sigma$ means no. of occurrences of $c$ in $s$.
* $s \downarrow c$ for channel $c$ means values in $s$ communicated along $c$.
* [2.2.5] Set of initial events $\textit{initials}(P) = \{ a \mid \langle a
  \rangle \in \textit{traces}(P) \}$.
* $P / s$ is behaviour of $P$ after trace $s$:
  $\textit{traces}(P/s) = \{ t \mid s\mathbin{\hat{}}t \in \textit{traces}(P)\}$.
