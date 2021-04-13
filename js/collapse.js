// SPDX-License-Identifier: MIT
// Copyright (c) 2021 Chua Hou

/**
 * Collapses/expands the given header's contents.
 *
 * Sets display of all nodes between the given header and the next element of
 * the same type to "none" if visible now, and "" otherwise.
 */
function collapse(header) {
	const collapseClass = "collapsed"; // Class to add to header when collapsed.

	// Get level of this header.
	const level = getLevel(header);
	if (level == null) return; // Not a header.

	// Determine whether to collapse or expand.
	const shouldCollapse = !header.classList.contains(collapseClass);
	const display = shouldCollapse ? "none" : "";
	if (shouldCollapse) header.classList.add(collapseClass);
	else header.classList.remove(collapseClass);

	// Iterate over siblings.
	const siblings = Array.from(header.parentNode.children);
	for (const s of siblings.slice(siblings.indexOf(header) + 1)) {
		const sLevel = getLevel(s)
		if (sLevel == null || sLevel > level) {
			s.style.display = display;

			// We reset the collapsed state of any headers that we are
			// collapsing/expanding.
			s.classList.remove(collapseClass);
		}
		else break; // Stop as soon as we reach header of same or higher level.
	}
}

/**
 * Gets numerical level of a header element. Returns null if not a header
 * element.
 */
function getLevel(header) {
	if (/^H[1-6]$/.test(header.nodeName))
		return parseInt(header.nodeName[1]);
	else return null;
}

// Add collapse as onclick to all headers.
document.querySelectorAll("h1, h2, h3, h4, h5, h6").forEach(header =>
	header.onclick = () => collapse(header));
