---
title: UCS, Sequential Process
---

* [1] Process described by how it *communicates* with external environment.

* **Alphabet of communications** $\Sigma$ is set of atomic interactions.
	* Instantaneous once "handshaken" between process and environment.

* [1.1.1] Process $\textit{STOP}$ does nothing.

---

* **Prefixing**: $a \to P$: offers $a$ (waits indefinitely till environment
  accepts) then becomes process $P$.

* [1.1.2] **Recursion**: $P = F(P)$ written $\mu\,P.F(P)$.

* [1.1.3] **Prefix choice**: $?x:A \to P(x)$ offers environment choice of
  $x \in A$ then becomes $P(x)$.
	* [Slide 1.7] $\textit{RUN}_A ={} ?x:A \to \textit{RUN}_A$

* **Guarded alternative**: $(a \to P(a) \;|\; b \to P(b) \;|\; \ldots)$ is
  choice over events $a, b, \ldots$ by environment.

* **Channels** form compound events with infix dot.
	* Channel $c$ that communicates type $T$ has set of events
	  $c.T \subseteq \Sigma$.
	* Declared $\textbf{channel } c:T$.
	* Pattern matching: write $?y : c.T \to P(y)$ as $c?x:T \to P'(x)$.
	* Output events $c.x$ written $c!x$.
	* [1.2.4] Compound channels.

* [1.1.3] Process state consist of
	* Parameters, e.g. $x$ in $P(x)$, and
	* Inputs, e.g. $x$ in $?x \to \ldots$
	* Identifiers have the same value throughout their scope.

---

* [1.2.1] **External choice**: $P \mathrel\square Q$ gives environment choice
  between *first events*.
	* Strictly generalizes guarded alternatives by replacing $\mid$ with
	  $\mathrel\square$.
	* $P \mathrel\square \textit{STOP} = P$.
	* $\mathop{\Large\square}\{P_i\} = P_1 \mathrel\square P_2 \ldots$,
	  $\mathop{\Large\square}\{\} = \textit{STOP}$.
	* If first events have nonempty intersection then internal nondeterminism.

* [1.2.2] **Internal/nondeterministic choice**: $P \sqcap Q$ may behave like
  either $P$ or $Q$. $\mathop{\Large\sqcap} \{P_i\}$ may behave like any $P_i$.
	* $\mathop{\Large\sqcap} \{\}$ does not make sense.
	* $P$ **refines** $Q$: $P \sqsupseteq Q$ if $P \sqcap Q = Q$.
		* $P$ more deterministic than $Q$.
		* $P$ can be used in place of $Q$.

* [1.2.3] **Conditional choice**: `if b then P else Q` written
  $P \mathrel{<\hspace{-0.7em}|} b \mathrel{|\hspace{-0.7em}>} Q$.
	* $P \mathrel{<\hspace{-0.7em}|} b \mathrel{|\hspace{-0.7em}>}
	  \textit{STOP}$ written $b\&P$.
