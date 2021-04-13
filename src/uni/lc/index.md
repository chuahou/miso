---
title: Lambda Calculus
---

*Based on the course taught by Hugo Paquet in Hilary Term 2021 and lecture notes
by Andrew Ker.*

Lambda calculus is a way to reason about functions, and is also a model of
computation. Its most basic form consists of variables, $\lambda$-abstractions
and applications.

* [Syntax](notes/syntax.md)
  ($\lambda$-terms [$\gets$](notes/syntax.html#lambda-terms),
  free/bound variables and capture [$\gets$](notes/syntax.html#binding-of-variables),
  contexts [$\gets$](notes/syntax.html#contexts))
* [Equational theories](notes/theories.md)
  (equalities [$\gets$](notes/theories.html#notions-of-equality),
  theories [$\gets$](notes/theories.html#theories),
  fixed points [$\gets$](notes/theories.html#fixed-points))

...

* [Reductions](notes/reductions.md) (reductions, $\lambda I$/affine/linear
  terms, $\beta$/$\eta$-reductions)
* [Normal forms](notes/nf.md) (NFs, normalizing, diamond/CR/unique-NF,
  $\beta$/$\eta$ CR, commute)
* [Consistency](notes/consistency.md) ($\lambda\beta$/$\lambda\eta$ consistent,
  $\mathcal T_{\text{NF}}$ inconsistent, Böhm's Theorem)
* [Reduction strategies](notes/redstrats.md)
