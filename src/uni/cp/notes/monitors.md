---
title: CP, Monitors
---

* [9.2] Lower level primitives than [channels](message.md).
* [9.4] **Mutual exclusion** so that at most one of some ops performed at a
  time.
* [9.6] Scala
  [`AnyRef`s](https://www.scala-lang.org/api/current/scala/AnyRef.html) are
  monitors with `obj.synchronized { ... }` blocks.
	* At most one thread active in a monitor's `synchronized` block.
	* [9.20] Suspended waiting with `wait()`, `notify()`, `notifyAll()`.
		* [9.21] Beware spurious wake-ups. Use `while (!cond) wait();`
		* [9.24] Scala uses **signal-and-continue** (block with `notify()`
		  completes first), vs **signal-and-wait**.
	* [9.26] `wait(t)` with timeout `t`.
* [10.6]
  [CSO `Monitor`s](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/monitor/Monitor.html)
  allow targeted notifications (but slower).
	* [10.7] `Condition` to wait on with `monitor.newCondition`.
	* `await()`, `await(cond)`, `signal()`, `signalAll()` on `Condition`.
* Fine-grained locking
	* [9.10] Separate locks or [9.11] striped locking
	* [9.12] Lock shards (disjoint subsets of object by hash) independently.
* [9.14] Java [`Lock`s](https://docs.oracle.com/javase/7/docs/api/java/util/concurrent/locks/Lock.html)
  for explicit locking with `lock()`, `unlock()`, `tryLock()`.
* [10.24] Signals may be lost if notification sent before waiting.
	* [10.25] Consider drawing sequence diagrams.
	* [10.29] Use state variables (especially in quiescent/inactive states).
