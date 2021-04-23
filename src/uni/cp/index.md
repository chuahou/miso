---
title: Concurrent Programming
no-toc: true
---

*Based on the course taught by Gavin Lowe in Hilary Term 2021.*

Concurrent programs consist of interacting tasks, and we aim to correctly
sequence such interactions/communications, and coordinate access to shared
resources.

* [Basics](notes/basics.md) (definitions, CSO basics, $\preceq$)
* [Message passing](notes/message.md)
* [Design patterns](notes/patterns.md)
* [Datatypes](notes/datatypes.md)
* [Synchronization](notes/sync.md)
* [Monitors](notes/monitors.md)
* [Semaphores](notes/semaphores.md)
* [Testing](notes/testing.md)

## Resources

**Course textbook**: Foundations of Multithreaded, Parallel, and Distributed
Programming, Gregory R. Andrews, Addison-Wesley, 2000.

[CSO library](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/CSO.zip) and
[documentation](https://www.cs.ox.ac.uk/teaching/materials20-21/concurrentprogramming/doc/io/threadcso/index.html).

References to notes are of the form [`x`.`y`] where `x` is the lecture number
and `y` is the slide number.
