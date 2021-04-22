---
title: CP, Testing
---

* [2.23] Test against sequential program.
	#. Verify correctness of sequential version.
	#. Run both *many* times on random same inputs and check they do the same.
* Testing can show the presence but not the absence of bugs.
	* For better methods, see Concurrency course.
* [4.19] **Logging** with
  [`Log[A]`](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/debug/Log.html).
	* Test validity of logs, e.g. [5.16].
* [7.12] Testing datatypes requires **linearizability testing**.
	* [7.16] Run threads to use concurrent datatype, recording history. Search
	  for $\exists$ sequential history that explains linearizability of these
	  operations.
	* [7.23] NP-complete search, keep search space small.
