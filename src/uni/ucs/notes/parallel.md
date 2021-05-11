---
title: UCS, Parallel Operators
---

* [3.4] **Generalized/interface parallel** $P \mathbin{\underset X\Vert} Q$:
  synchronize on events in $X$.
	* Complex step law (but obvious) in book.
	* $\textit{traces}(P \mathbin{\underset X\Vert} Q) =
	  \bigcup
	  \{s \mathbin{\underset X\Vert} t \mid s \in \textit{traces}(P) \land
	  t \in \textit{traces}(Q)\}$

* [3.1] **Synchronous parallel** $P \mathbin\Vert Q$: agree on everything,
  $= P\mathbin{\underset\Sigma\Vert} Q$
	* Step law $?x:A \to P \mathbin\Vert {}?x:B \to Q =
	  ?x:A \cap B \to (P \mathbin\Vert Q)$.
	* $\textit{traces}(P \mathbin\Vert Q) = \textit{traces}(P) \cap
	  \textit{traces}(Q)$.

* [3.2] **Alphabetized parallel** $P \mathbin{{}_A\Vert_B} Q$: agree on $A \cap
  B$, $\approx P \mathbin{\underset{A \cap B}\Vert} Q$
	* $P$ and $Q$ have alphabets $A$ and $B$ respectively.
	* Indexed notation where process $P_i$ has alphabet $A_i$ written
	  $\mathop{\Large\Vert}_{i=1}^n (P_i, A_i)$
	* Step law given $P = {}?x:A \to P'$ and $Q = {}?x:B \to Q'$
$$
\begin{aligned}
C &= (A \cap (X \setminus Y)) \cup (B \cap (Y \setminus X)) \cup
	(A \cap B \cap X \cap Y) \\[1ex]
P \mathbin{{}_X\Vert_Y} Q &= {}?x:C \to (P' \mathrel{<\hspace{-0.7em}|} x \in X
	\mathrel{|\hspace{-0.7em}>} P \\[1ex]
	&\hspace{6em} {}_X\Vert_Y \\[1ex]
	&\hspace{6em} Q' \mathrel{<\hspace{-0.7em}|} x \in Y
	\mathrel{|\hspace{-0.7em}>} Q)
\end{aligned}
$$
	* Traces such that restrictions to each alphabet are traces of each process.
$$
\textit{traces}(P \mathbin{{}_X\Vert_Y} Q) = \{ s \in (X \cup Y)^* \mid \hspace{5em} \\[1ex]
\hspace{5em} s \upharpoonright X \in \textit{traces}(P) \land
s \upharpoonright Y \in \textit{traces}(Q) \}
$$

* [3.3] **Interleaving** $P \mathbin{\vert\kern-0.25ex\Vert} Q$: run
  independently, $= P \mathbin{\underset\emptyset\Vert} Q$
	* Step law
$$
\newcommand{\inter}{\mathbin{\vert\kern-0.25ex\Vert}}
\begin{aligned}
P \inter Q = {}?x:A \cup B \to{}&
(P' \inter Q) \sqcap (P \inter Q') \\[1ex]
&\mathrel{<\hspace{-0.7em}|} x \in A \cap B \mathrel{|\hspace{-0.7em}>} \\[1ex]
&(P' \inter Q) \mathrel{<\hspace{-0.7em}|} x \in A \mathrel{|\hspace{-0.7em}>}
(P \inter Q')
\end{aligned}
$$
	* $\textit{traces}(P \mathbin{\vert\kern-0.25ex\Vert} Q) =
	  \bigcup
	  \{s \mathbin{\vert\kern-0.25ex\Vert} t \mid s \in \textit{traces}(P) \land
	  t \in \textit{traces}(Q)\}$

* About parallel processes.

	* [3.1.1] Parallel processes can be converted into sequential ones.
		* Deadlock eventually reaches $\textit{STOP}$ sequentially.
	* [3.2] **Commmunication graph** has processes as nodes, and edges when
	  intersection of alphabets $\neq \emptyset$.
	* [3.5] Parallel composition used to *restrict* specifications.
		* [Slide 3.36] $\land$ on trace specifications.
	* Symmetric, associative and distributive once alphabets accounted for, not
	  idempotent. (True for all parallel operators here.)
