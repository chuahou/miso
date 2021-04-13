---
title: LC, Normal Forms
---

# Normal forms

* [2.4] A term $s$ is
	* in **$R$-normal form** if there is no term $t$ for which $s \to_R t$.
	* **$R$-normalizable** if $s \twoheadrightarrow_R t$ and $t$ is in $R$-NF.
	* **strongly $R$-normalizable** if there is no infinite sequence
	  $s \to_R t_1 \to_R t_2 \to_R \ldots$.
* A notion of reduction $R$ is
	* **weakly normalizing** if every term is $R$-normalizable.
	* **strongly normalizing** if every term is *strongly* $R$-normalizable.

# Diamond and Church-Rosser properties

* [2.4] The **diamond property** is satisfied by $\to_R$ if
  $$s \to_R t_1 \land s \to_R t_2 \implies t_1 \to_R u \land t_2 \to_R u$$
  for some term $u$.
* $\to_R$ is **Church-Rosser** if its reflexive/transitive closure
  $\twoheadrightarrow_R$ satisfies the diamond property.
* $\to_R$ has the **unique normal form property** if every term can only reduce
  to a unique normal form.
* **Lemma 2.4.1.**
	* If $\to_R$ satisfies diamond property then so does
	  $\twoheadrightarrow_R$ (then $\to_R$ also CR).
	* If $\to_R$ is CR, then $s =_R t$ iff for some $u$,
	  $s \twoheadrightarrow_R u$ and $t \twoheadrightarrow_R u$.
	* Church-Rosser $\implies$ unique normal form.
* [2.5] **$\beta$-reduction is CR**, as $\to_\Vert$ has diamond property (see
  notes).
* **$\eta$-reduction is CR** (see slides).
* **$\beta\eta$-reduction is CR** (see slides 6).
