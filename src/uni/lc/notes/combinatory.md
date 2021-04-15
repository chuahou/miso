---
title: LC, Combinatory Logic
---

# Combinatory logic

* [5.1] **CL-terms**, $\mathcal T_\mathrm{CL}$, given by
$$
\newcommand\TCL{\mathcal T_\mathrm{CL}}
\newcommand\hspc{\hspace{1.5em}}
\frac{}{x \in \TCL} \, x \in \mathcal V \hspc
\frac{}{\mathbf K \in \TCL} \hspc
\frac{}{\mathbf S \in \TCL} \hspc
\frac{A \in \TCL \;\; B \in \TCL}{(A \cdot B) \in \TCL}
$$
	* No free variables or abstractions, no $\alpha$-conversion.
* Equality given by (cf. [$\lambda\beta$ equality](theories.html#theories))
  $CL \vdash$
$$
\newcommand\hspc{\hspace{1.5em}}
(\text{refl.}) \; \frac{}{A = A} \hspc
(\text{symm.}) \; \frac{A = B}{B = A} \hspc
(\text{trans.}) \; \frac{A = B\;\;B = C}{A = C} \\[1.8ex]
(\text{application}) \; \frac{A = A'\;\;B = B'}{AB = A'B'} \\[1.6ex]
(\mathbf K) \; \frac{}{\mathbf KAB = A} \hspc
(\mathbf S) \; \frac{}{\mathbf SABC = AC(BC)}
$$
	* Write $\mathbf I \equiv \mathbf{SKK}$.
* [5.2] **Abstraction** meta-operation (not part of syntax)
$$
\newcommand\llambda{\lambda\hspace{-0.43em}\lambda}
\begin{aligned}
\llambda x.x &\equiv \mathbf{SKK} \equiv \mathbf I \\
\llambda x.B &\equiv \mathbf KB & \text{$x$ not in $B$} \\
\llambda x.BC &\equiv \mathbf S(\llambda x.B)(\llambda x.C) & \text{$x$ in $BC$}
\end{aligned}
$$
	* **Lemma 5.2.1.** $\lambda\hspace{-0.43em}\lambda$ simulates
	  $\beta$-reduction.
		* $x$ does not occur in $\lambda\hspace{-0.43em}\lambda x.A$.
		* $CL \vdash (\lambda\hspace{-0.43em}\lambda x.A)B = A[B/x]$.
		* if $x \neq y$ and $x$ not in $B$ then
		  $CL \vdash (\lambda\hspace{-0.43em}\lambda x.A)[B/y] =
		  \lambda\hspace{-0.43em}\lambda x.(A[B/y])$.

## Translations

* [5.3] **Translations** between $\lambda$-calculus and CL
\begin{aligned}
x_{cl} &\equiv x &
x_\lambda &\equiv x \\
(\lambda x.s)_{cl} &\equiv \lambda\hspace{-0.43em}\lambda x.s_{cl} &
(AB)_\lambda &\equiv A_\lambda B_\lambda \\
(st)_{cl} &\equiv s_{cl}t_{cl} &
\mathbf K_\lambda &\equiv \mathbf k \\
&& \mathbf S_\lambda &\equiv \mathbf s
\end{aligned}
* **Lemma 5.3.1.**
	* $\lambda\beta \vdash (\lambda\hspace{-0.43em}\lambda x.A)_\lambda
	  = \lambda x.A_\lambda$
	* $\lambda\beta \vdash (s_{cl})_\lambda = s$
	* $CL \vdash A = B \implies \lambda\beta \vdash A_\lambda = B_\lambda$
	* $\lambda\beta$ equality equates more than $CL$ equality.
* Strengthening $CL$ to ~$\lambda\beta$
	* Adding extensionality: too strong, closer to $\lambda\beta\eta$
	* $CL + \text{WExt} + \text{K-Ext} + \text{S-Ext}$ perfect (see sheet 3).
	* Adding 5 axioms also works (see notes).

# Combinatory algebras

* [5.5] **Combinatory algebra** is set $\mathcal A$, binop $\bullet$,
  $K, S \in \mathcal A$ s.t.
$$
K \bullet X \bullet Y = X \hspace{1.5em}
S \bullet X \bullet Y \bullet Z = X \bullet Z (Y \bullet Z)
$$
	* Never commutative, associative or finite.
* **Denotation** $(A)_\rho$ of $A \in \mathcal T_{cl}$ in environment
  $\rho : \mathcal V \to \mathcal A$ given inductively by
$$
(x)_\rho = \rho(x) \hspace{1.5em}
(\mathbf K)_\rho = K \hspace{1.5em}
(\mathbf S)_\rho = S \hspace{1.5em}
(A \cdot B)_\rho = (A)_\rho \bullet (B)_\rho
$$
	* **Denotation of $\lambda$-term**
	  $\llbracket s \rrbracket_\rho = (s_{cl})_\rho$
* **Lemma 5.5.1.** $CL \vdash A = B \iff$ for *all* algebras and *all*
  environments, $(A)_\rho = (B)_\rho$.
* **$\lambda$-algebra** is CA s.t.
	* $\lambda\beta \vdash A_\lambda = B_\lambda \implies \forall \rho. (A)_\rho =
	  (B)_\rho$, OR
	* $\lambda\beta \vdash s = t \implies \forall \rho. \llbracket s
	  \rrbracket_\rho = \llbracket t \rrbracket_\rho$ and
	  $\llbracket\mathbf k \rrbracket = K$ and
	  $\llbracket\mathbf s \rrbracket = S$
* **Theorem 5.5.3.** Every CA is **combinatory complete**, i.e. for CL term $T$
  with free vars in $x_1, \ldots, x_n$, there is $F \in \mathcal A$ for all
  $A_i$s s.t. in $\rho : x_i \mapsto A_i$
$$
(T)_\rho = F \bullet A_1 \bullet \ldots \bullet A_n
$$
