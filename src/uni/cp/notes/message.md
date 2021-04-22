---
title: CP, Message Passing
---

* [2.3] Processes communcate using synchronous/asynchronous **channels**.
```{.tex .tikz width=50%}
\node[draw] (out) at (0,0) {\texttt{chan!v}};
	\node[xshift=40, yshift=10] at (out) {outport};
\node[draw] (in) at (5,0) {\texttt{chan?()}};
	\node[xshift=-40, yshift=10] at (in) {inport};
\draw[->] (out) -- (in);
```
* [2.15] Producers should close the channel.
	* [2.16] Closed channels produce `Closed <: Stopped` exceptions.
	* [2.17] `repeat { ... }` = infinite loop till `Stopped` caught.
	* [2.19] `attempt {p}{q}` = `p` but run `q` when `Stopped` caught.
	* [3.10] Shared channels either closed by `One` side or appropriate number
	  of either side for `N2N`.
* [2.3, 2.15, 3.9]

```scala
trait InPort[T]  { def ?(): T;  def closeIn;  }
trait OutPort[T] { def !(x: T); def closeOut; }
trait Chan[T] extends InPort[T] with OutPort[T] { def close }
def OneOne[T], N2N[T](writers, readers), OneMany[T], ManyOne[T]
	: Chan[T]
```

* [5.27] Buffered asynchronous channels (better performance).

```scala
def OneOneBuf[T](size): Chan[T]
def N2NBuf[T](size, writers, readers): Chan[T]
```

* [2.26] `Chan[Unit]` can be used for synchronization.
	* [2.29] Processes can access the same variable if synchronization ensures
	  they never access at the same time.
* [2.33] Must be wary of pass-by-reference.
* [2.30] Synchronous send $s$ and receive $r$, then $s \preceq r$ and
  $r \preceq s$.
* [4.3] `alt`/`serve` syntax used to run whichever port is ready.
	* [4.7] `serve` is `repeat { alt ( ... ) }` but *fair*.
	* [4.26] Outports.
	* [4.6] `AltAbort <: Stopped` exception when all infeasible.
	* [4.30] Cannot (a) have multiple enabled events on same port, (b) share
	  ports, (c) use both ports of channel.

```scala
alt( in1 =?=> { x => ... }
   | (guard && in2) =?=> { x => ... }
   | out1 =!=> { expr }
   | (guard && out2) =!=> { expr } ==> { doAfter }
   )
alt(| (for (...) yield ... =?=> ...)) // | on collection
```
