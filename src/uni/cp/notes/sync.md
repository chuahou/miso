---
title: CP, Synchronization
---

* [8.2] [*Data-parallel*](basics.md) programming synced in *rounds*.
	* [8.3] Used when shared variables written by some threads in a round need
	  to be read by other threads in next round.
	* [8.14] Also used when [message-passing](message.md) in rounds.
* [8.5] **Barrier synchronization** for $p$ threads using
  [`Barrier(p)`](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/lock/Barrier.html)
  ($\mathcal O(p)$)
	* `barrier.sync()` blocks till all $p$ threads call it.
	* [8.25]
	  [`CombiningBarrier[T](p, e: T, f: (T, T) => T)`](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/lock/CombiningBarrier.html)
		* `sync(t: T)` returns `fold f e` on `t`s
		* Associative/commutative `f` and identity `e`
		* [8.26] [`AndBarrier <: CombiningBarrier[Boolean]`](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/lock/AndBarrier.html)
* [8.3] 2 methods
	* 2 syncs
		#. Read globals into locals, then `sync()`
		#. Write to non-overlapping globals, then `sync()`
	* Single sync
		#. 2 copies of shared variables
		#. Read from 1st copy and write to 2nd copy
		#. `sync()`, then swap references
