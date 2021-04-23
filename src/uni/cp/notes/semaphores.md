---
title: CP, Semaphores
---

* [12.2] Basic operations
	* `down`/`P`/`wait`/`acquire`
	* `up`/`V`/`signal`/`release`
* [12.3]
  [CSO implementation](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/semaphore/Semaphore.html)
	* `BooleanSemaphore(initiallyAvailable: Boolean)`
	* `MutexSemaphore = BooleanSemaphore(true)`
	* `SignallingSemaphore = BooleanSemaphore(false)`
	* [12.39]
	  [`CountingSemaphore(available: Int)`](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/semaphore/CountingSemaphore.html)
		* Internal value = # permits for `down`s.
	* [12.38] `...Semaphore(fair = true)` to provide fairness to waiters.
* [12.7] Easy to deadlock when acquiring multiple semaphores.
* [12.11] Multiple `up`s before `down` means subsequent signals are lost.
	* [12.12] Ensure $\texttt{up}_1 \prec \texttt{down}_1 \prec \texttt{up}_2$.
* [12.16] **Passing the baton**. First thread `down`s mutex, signals to second
  thread, second thread `up`s mutex.
	* Waiting thread must lift mutex before waiting (otherwise deadlock).
* [12.27] Ephemeral semaphores can be used like ephemeral reply channels.
