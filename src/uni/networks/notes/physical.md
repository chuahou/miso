---
title: Networks, Physical Layer
---

* [2.2] Physical layer (OSI 1) transports information physically over
  distance.
* [2.3] Provides *bit stream* to data link layer. [2.4] Provides
	* Digital-analogue conversion.
	* Low-level buffering.
	* Error detection but no error correction.
		* [2.5] Hence reliability important.
	* Multiplexing
		* over time (time divison multiplexing), or
		* over frequencies (wave divison multiplexing).
* [2.5] Reliability $\leftrightarrow$ bandwidth tradeoff.
* [2.6] Signalling is time-synchronized with some encoding.
	* [2.6.1] Non-return to zero (NRZ) encoding: 1 = high, 0 = low.
		* [2.6.2] Clock drift problematic.
	* [2.6.4] Manchester encoding: 1 = low→high, 0 = high→low (or opp.).
		* Sync clocks using transitions.
		* Read bits away from transmissions.
	* [2.6.5] Differential Manchester: 1 = no-change, 0 = change (or opp.), in
	  addition to change at middle of window.
		* Sync clocks using middle transitions.
		* No dependence on absolute values, only changes.
		* Early/late bit-read points.
