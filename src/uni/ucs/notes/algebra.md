---
title: UCS, Algebra Laws
---

* [2.1] Idempotence, symmetry and associativity for each of $\square$ and
  $\sqcap$. Below illustrated for $\square$:
\begin{aligned}
P \mathbin\square P &= P &\text{$\square$-idem} \\
P \mathbin\square Q &= Q \mathbin\square P &\text{$\square$-sym} \\
P \mathbin\square (Q \mathbin\square R) &=
	(P \mathbin\square Q) \mathbin\square R &\text{$\square$-assoc}
\end{aligned}

* Distributivity over $\sqcap$: any $F(\cdot)$ is distributive if it uses *at
  most one copy* of its argument.
$$
\begin{aligned}
F(P \sqcap Q) &= F(P) \sqcap F(Q) &\text{$F$-dist} \\
F(\mathop{\large\sqcap} S) &= \mathop{\large\sqcap}\{F(P) \mid P \in S\}
	&\text{$F$-Dist}
\end{aligned}
$$
	* True for [all operators](seq.md) but recursion.
	* Distributivity of $\sqcap$ over $\square$.
$$
\begin{aligned}
P \sqcap (Q \mathbin\square R) &= (P \sqcap Q) \mathbin\square (P \sqcap R)
&\text{$\sqcap$-$\square$-dist}
\end{aligned}
$$

* **Step laws** show first step actions.
\begin{aligned}
&(?x:A \to P) \mathbin\square (?x:B \to Q) = \\
&\hspace{2em} ?x:A \cup B \to \left((P \sqcap Q)
	\mathbin{<\hspace{-0.7em}|} x \in A \cap B \mathbin{|\hspace{-0.7em}>}
	(P \mathbin{<\hspace{-0.7em}|} x \in A \mathbin{|\hspace{-0.7em}>} Q)\right)
&\text{$\square$-step} \\[1ex]
&\textit{STOP} {}={} ?x:\{\} \to P &\text{$\textit{STOP}$-step}
\end{aligned}

* $\textit{STOP}$ is a unit of $\square$.
$$\textit{STOP} \mathbin\square P = P \hspace{2em}\text{$\square$-unit}$$

* Conditional choice is idempotent and distributive over $\sqcap$, and
\begin{aligned}
	P \mathbin{<\hspace{-0.7em}|} \textrm{true} \mathbin{|\hspace{-0.7em}>} Q
	&= P
	&\text{${}\mathbin{<\hspace{-0.7em}|} \textrm{true} \mathbin{|\hspace{-0.7em}>}{}$-id} \\
	P \mathbin{<\hspace{-0.7em}|} \textrm{false} \mathbin{|\hspace{-0.7em}>} Q
	&= Q
	&\text{${}\mathbin{<\hspace{-0.7em}|} \textrm{false} \mathbin{|\hspace{-0.7em}>}{}$-id}
\end{aligned}

* Law of recursion
$$
	\mu\, p. P = P[\mu\, p.P/p] \hspace{2em} \text{$\mu$-unwind}
$$

* Some laws are not present in some models, including $\square$-idem and
  $\sqcap$-$\square$-dist. Denoted by * in the book/slides.
