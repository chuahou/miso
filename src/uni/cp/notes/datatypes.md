---
title: CP, Datatypes
---

* [7.2] **Concurrent datatypes** can be *concurrently* accessed by multiple
  threads.
* [7.4] Users can't check preconditions easily due to
  [TOCTTOU](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use).
	* [7.6] **Total** operations use e.g. `Option` to handle invalid
	  preconditions.
	* **Partial** operations block till precondition holds.
		* [7.25] Partial implementations must beware deadlocks.
		* [7.28] E.g. terminate when all workers waiting.
* [7.9] [Server](patterns.html#clientserver) has private sequential datatype,
  processing operations one by one.
