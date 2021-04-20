---
title: LC, Simple Types
---

# Curry's $\text{TA}_\lambda$

* [6.1] Types (set $\mathbf{Typ}$) given by
$$
\frac{}{a \in \mathbf{Typ}}\;(a \in \mathcal{TV})
\hspace{2em}
\frac{A \in \mathbf{Typ} \;\;\;\; B \in \mathbf{Typ}}{(A \Rightarrow B) \in
\mathbf{Typ}}
$$
* **Type context** is $\{ x_i : A_i \}$ where $x_i \in \mathcal V$ and
  $A_i \in \mathbf{Typ}$, for distinct $x_i$.
	* Contexts **consistent** if they don't disagree on any variable's type.
	* **Subjects** are $\operatorname{Subj}(\{x_i : A_i\}) = \{x_i\}$.
	* $\Gamma \upharpoonright s$ is $\Gamma$ **restricted** to
	  $\operatorname{FV}(s)$.
* Typing relations between contexts, $\Lambda$ and $\mathbf{Typ}$ are
	* $\mapsto$
\begin{aligned}
(\text{var})\;&\frac{}{\{x:A\} \mapsto x:A} \\[2ex]
(\text{app})\;&\frac{\Gamma \mapsto s: B \Rightarrow A \;\;\;
	\Delta \mapsto t:B}
	{\Gamma \cup \Delta \mapsto st:A}
	\;\;\;\text{$\Gamma, \Delta$ consistent} \\[2ex]
(\text{abs})\;&\frac{\Gamma \mapsto s:A}
	{\Gamma - x \mapsto \lambda x.s: B \Rightarrow A}
	\;\;\;\text{$\Gamma, \{x:B\}$ consistent}
\end{aligned}
	* $\vdash$ ("proves"):
	  $\Gamma \vdash s:A \iff \exists \Gamma' \subseteq \Gamma \text{ s.t. }
	  \Gamma' \mapsto s:A$
	* $\vdash$ supports **weakening** but $\mapsto$ does not.
* **Relevance Lemma 6.1.1.**
	* If $\Gamma \mapsto s:A$ then
	  $\operatorname{Subj}(\Gamma) = \operatorname{FV}(s)$.
	* If $\Gamma \vdash s:A$ then $\Gamma \upharpoonright s \mapsto s:A$.
* **Subject Construction Lemma 6.2.1.**
	* Deduction tree for type has same structure as construction tree for term.
	* Subtree is construction tree for deduction at its root.
	* Final step is of form
\begin{aligned}
\text{If $s \equiv x$,}&&
	&\frac{}{\{x:A\} \mapsto x:A} \;\;(\text{var}) \\[2ex]
\text{If $s \equiv pq$,}&&
	&\frac{\Gamma \upharpoonright p \mapsto p: B \Rightarrow A
		\;\;\;
		\Gamma \upharpoonright q \mapsto q: B}
		{\Gamma \mapsto pq:A} \;\;(\text{app}) \\[2ex]
\text{If $s \equiv \lambda x.p$,}&&
	&\frac{\Gamma \red{\cup \{x:B\}} \mapsto p:A}
		{\Gamma \mapsto \lambda x.p : B \Rightarrow A}
		\;\;(\text{abs})\hspace{1em}\text{\red{if $x \in \operatorname{FV}(p)$}}
\end{aligned}
* **$\alpha$-invariance Lemma 6.2.2.** $\alpha$-equivalent terms have the same
  type.
* **Substitution Lemma 6.2.3.**
	* If
		* $\Gamma \cup \{x:B\} \mapsto s:A$ with
		  $x \notin \operatorname{Subj}(\Gamma)$
		* $\Delta \mapsto t:B$
		* $\Gamma$ and $\Delta$ consistent, $x \notin \operatorname{FV}(t)$
	* Then $\Gamma \cup \Delta \mapsto s[t/x] : A$.
* [6.3] **Subject Reduction Theorem.**
  If $\Gamma \vdash s:A$, and $s \to_\beta t$ then $\Gamma \vdash t:A$.
	* **Subject expansion** does *not* hold.

# Typability

* [7.1] Term **typable** if some context proves it has some type.
	* **Lemma 7.1.1.** Typability closed under *subterms, abstraction,
	  $\beta$-reduction*.
	* [Lecture 14]
	  [PCF](https://en.wikipedia.org/wiki/Programming_Computable_Functions) used
	  to make untypable things into constants instead.
* [7.2] All typable terms are [strongly normalizable](nf.html#normal-forms).
	* Long proofs given in Lecture 15/Chapter 7.
* **Corollary 7.3.1.** Equality of typable terms is decidable.
* **Corollary 7.3.2.** $\text{TA}_\lambda$ has no fixed-point combinators.
* [7.3] $\text{TA}_\lambda$ terms define the [**extended
  polynomials**](https://arxiv.org/pdf/cs/0701022.pdf).
