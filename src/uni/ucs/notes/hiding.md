---
title: UCS, Hiding and Renaming
---

# Hiding

* [5.1] **Hiding**: $P \setminus X$ has events in $X$ made into $\tau$s.
	* Distributive, symmetric, $\setminus Y \setminus X$ is
	  $\setminus (X \cup Y)$, unit is $\{\}$.
	* Distributive over $\underset A\Vert$, ${}_X \Vert_Y$ when alphabets
	  disjoint from hidden set.
	* *Step law*: visible events $\rhd$ nondet choice of hidden events.
	* Traces restricted $\upharpoonright (\Sigma \setminus X)$
* **Sliding** $P \rhd Q$ offers $P$'s events, but otherwise $\tau$s into $Q$.
	* Distributive, associative, idempotent, unit is $\textit{STOP}$.
* [5.1.1] Hiding $\square$ of internal events becomes $\sqcap$.
* [5.1.1] **Divergence**: process does internal actions forever (livelock).
	* Process that only diverges: $\mathbf{div}$.
* [5.1.2] Hiding removes guardedness (and hence UFP). $P = a \to (P \setminus
  \{a\})$ is not guarded.

# Renaming

* [5.2.1] **Injective renaming**: $f[P]$ performs $f(a)$ when $P$ performs $a$
  where $f$ is 1-1 $\Sigma \to \Sigma$.
	* Changes nothing but event names.
	* Distributes over everything.
* [5.2.2] **Non-injective renaming**: can forget detail (abstraction).
* [5.2.3] **Relational renaming**: $P\llbracket R \rrbracket$ can do $b$
  when $P$ performs $a$ and $a \mathrel R b$.
	* Distributive over $\sqcap$ and $\square$.
	* May introduce nondeterminism.
	* Can be written $P \llbracket a,b / b,a \rrbracket$.
* Can rename based on context using $\Vert$ and $P\llbracket\cdot\rrbracket$.
* [5.2.3] Composition of renaming equivalent to functional/relation composition.

# Link parallel

* [5.3] $P [a \leftrightarrow b] Q =
  (P \llbracket c/a \rrbracket \underset{\{|c|\}}\Vert
  Q \llbracket c/b \rrbracket) \setminus \{|c|\}$ for fresh $c$.
* **Piping** $P \gg Q = P [\textit{right} \leftrightarrow \textit{left}] Q$.
* [Slide 5.30] **Enslavement** $P \mathbin{/\hspace{-6mu}/} Q =
  (P \mathbin{\underset{\alpha Q}\Vert} Q) \setminus \alpha Q$.

# Unbounded determinism

May be introduced by...

* [5.1.1] Infinite hiding.
* [5.2.2] Infinite-to-1 non-injective renaming.
