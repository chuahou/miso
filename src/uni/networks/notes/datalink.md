---
title: Networks, Data Link Layer
---

# Data link layer

* [3.2] Data link layer (OSI 2) transports coherent *frames* of bits between
  known participants.
* [3.2.1] Provides *ordered bit sequence* to physical layer below, provides
  frames to network layer above. [3.3] Services provided:
	* Delivers frames intact OR drops them (bits in a frame **share fate**).
	* Provides frame-level error detection, discarding malformed ones.
	* Addresses destinations (e.g. MAC).
	* Abstracts over physical layer (single connection $\neq$ single physical
	  path).
* [3.4] Low latency/jitter important as they bottleneck upper layer performance.

# Ethernet frame structure

* [3.6] Preamble: alternating 1/0s to sync clocks.
* Start of frame: `0xAB`.
* Header: destination/source MAC, type/length field.
* Payload: for upper layers.
* Frame Check Sequence (FCS): Cyclic Redundancy Checksum [3.9].
* Post-frame gap: idle for some time.

# Link aggregation

* [3.11] **Link Aggregation Control Protocol (LACP)**
	* Runs at both endpoints.
	* Sends frames under one of multiple live physical links.
		* Uses same link to maintain ordering.
	* Multicast LACP frames as keepalives.

# Scaling

## Collisions

* [3.8] **Collisions**: when multiple transmissions on same medium detected,
  stop sending and try after random time (exponential backoff).
* [4.2] Switches split network into collision domains.
* [4.3] **Source MAC learning**: use source MACs to maintain address table.
	* [4.4] Timeouts necessary since networks can change.
	* Advertising frames sent upon connection.

## Loops

* [4.5] Loops must be avoided as they very quickly clog network.
* [4.6] **Spanning Tree Protocol** to create spanning tree to use instead.
	* [4.7.1] **Bridge Protocol Data Unit**: payload of STP frame.
	* Root originates, and each switch forwards (with updates):
		* Root known so far, which is lowest ID (root/bridge ID fields).
		* Its distance from root (root path cost field).
	* Block all ports on each link other than min-cost port.
	* BPDUs also used as keepalives to detect failures.
	* **Topology Change Notifications** sent up to root then down throughout
	  entire network.
	* Slow to converge (50s) due to Max Age + twice Forwarding Delay to
	  change port states. (Rapid STP makes this faster.)
* [4.8] **Ethernet Ring Protection Switching** for ring networks.
	* Ring protection link owner and its neighbour block link inbetween.
	* Failed link blocked, originally blocked link unblocked.
	* Downtime $<$ 50ms.
