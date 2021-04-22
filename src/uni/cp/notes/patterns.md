---
title: CP, Design Patterns
---

# Bag of tasks

*Best illustrated by `2_2/cp/lec/03/Trapezium.scala`.*

* [3.32] Controller has bag of tasks, distributing to workers.
	* Faster workers can do more tasks.
* [3.36] Receiving results from workers can be separate process.

# Client/server

* [5.2] Server repeatedly handles requests from clients.
* [5.3, 5.20] `Option[Response]` or wait till available (beware deadlock).
* [5.17] Client can create ephemeral reply channel.
* [5.26] [Buffered channels](message.md) enable useful work while client
  waiting.
* [5.29] Multiple channels vs single channel with multiple types.

# Interacting peers

* [5.6] Reason about
	* Invariants
	* Total messages
	* Maximum length (totally-ordered) chain of $\prec$ messages (rounds)
* [5.7] Centralized pattern (star), [5.14] fully-connected/symmetric,
  [5.19] ring topology, [5.28] tree/heap topology.
```{.tex .tikz width=70%}
\node[draw, circle] (1) at (0.5,0.5) {};
\foreach \x in {0,1}
	\foreach \y in {0,1}
		{
			\node[draw, circle] (1\x\y) at (\x,\y) {};
			\draw[<->] (1) -- (1\x\y);
		}

\foreach \x in {2,3}
	\foreach \y in {0,1}
		{
			\node[draw, circle] (2\x\y) at (\x,\y) {};
		}
\draw[<->] (220) -- (221);
\draw[<->] (220) -- (230);
\draw[<->] (220) -- (231);
\draw[<->] (221) -- (230);
\draw[<->] (221) -- (231);
\draw[<->] (230) -- (231);

\foreach \x in {4,5}
	\foreach \y in {0,1}
		{
			\node[draw, circle] (3\x\y) at (\x,\y) {};
		}
\draw[<->] (340) -- (350);
\draw[<->] (341) -- (351);
\draw[<->] (340) -- (341);
\draw[<->] (350) -- (351);

\node[draw, circle] (4) at (6.5,1) {};
\node[draw, circle] (4L) at (6.17,0.5) {};
\node[draw, circle] (4R) at (6.83,0.5) {};
\node[draw, circle] (4LL) at (6,0) {};
\node[draw, circle] (4LR) at (6.34,0) {};
\node[draw, circle] (4RL) at (6.66,0) {};
\node[draw, circle] (4RR) at (7,0) {};
\foreach \n in {4,4L,4R}
	\foreach \c in {L,R}
		{
			\draw[<->] (\n) -- (\n\c);
		}
```
