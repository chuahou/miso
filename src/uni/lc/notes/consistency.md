---
title: Consistency
---

# [2.6] Consistency of $\lambda\beta$, $\lambda\eta$, $\mathcal T_{\text{NF}}$

We [recall](theories.html#properties) a theorem $\mathcal T$ is consistent if
exist terms $s, t$ such that $T \vdash s \neq t$.

**Theorem 2.6.1.** $\lambda\beta$ and $\lambda\beta\eta$ are consistent, as
$\mathbf k \equiv \lambda xy.x \neq \mathbf s \equiv \lambda xyz.xz(yz)$ for
both (proof by contradiction using [Lemma 2.4.1](nf.html#lemma-2.4.1)).

**Lemma 2.6.2.** The $\lambda$ theory that equates closed terms without normal
forms, $\mathcal T_{\operatorname{NF}}$, is inconsistent. Intuitively,
arbitrary closed subterms without normal forms can be equated to equate any
arbitrary terms.

# [2.7] Böhm's Theorem

**Böhm's Theorem.** If terms $s$ and $t$ are distinct closed $\beta\eta$-NFs,
then there is some sequence of terms $u_1,\ldots,u_n$ such that

\begin{aligned}
\lambda\beta \vdash su_1\ldots u_n = \mathbf t &\equiv \lambda xy.x \\
\lambda\beta \vdash tu_1\ldots u_n = \mathbf f &\equiv \lambda xy.y
\end{aligned}

It then follows that **if terms $s$ and $t$ are distinct closed $\beta\eta$-NFs,
then $\lambda\beta + \{s = t\}$ is inconsistent**, as otherwise

$$
\lambda\beta + \{s = t\} \vdash p =
\mathbf tpq = su_1\ldots u_npq = tu_1\ldots u_npq = \mathbf fpq = q
$$

for any $p, q$ and hence all terms are equated.
