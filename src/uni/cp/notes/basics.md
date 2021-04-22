---
title: CP, Basics
---

* [1.6] **Processes**/**threads** implement concurrent tasks. They can
  communicate using shared memory (threads) or using system calls (processes).
* [1.7] Advantages include speed, more intuitive design for multi-task systems,
  and taking advantage of distributed computing.
* Some definitions are:
	* [1.7] Structures
		* **Data-parallel**: do same thing on different parts of data.
		* **Task-parallel**: do different things.
	* [1.27] **Atomic** actions cannot be interrupted.
	* Actions are **independent** if reversing their order has no effect.
	* [1.33] Correctness properties
		* **Safety**: system satisfies invariant after every action
		  (being correct).
		* **Liveness**: system does something useful overall.
	* Performance properties
		* **Latency**: requests are serviced quickly.
		* **Throughput**: high number of requests processed overall.
	* [4.10] **Fairness** means no request/event is starved.
		* **Equable** if all equally served.
	* [2.30] **Happens-before** preorder (refl. & trans.) $\preceq$.
* [1.25, 3.52] CSO basics
```scala
proc { ... }    // process
run(p: PROC)    // run process
p.fork          // run in parallel to current thread
p || q          // parallel composition
|| (for (...) yield proc { ...})
exit()          // stop thread pool
```
