---
title: ADS, Red-Black Diagrams
---

Supplement to [BST notes](bst.html#red-black-trees).

* [3.15] Standard `Insert` and colour red. If red-red violation,
	* Uncle is red $\to$ recolour parent, uncle and grandparent.
```{.tex .tikz width=70%}
\tikzset{ every node/.style = {draw, circle, fill}, level distance = 20 }
\node at (0, 0) {}
	child {
		node[fill = red] {}
		child { node {} }
		child {
			node {}
			child {
				node[fill = red] {}
				child { node[fill = red] {} }
				child[missing] {}
			}
			child { node[fill = red] {} }
		}
	}
	child { node {} };
\node[fill = none, draw = none] at (1.7, -1.45) {\(\to\)};
\node at (4, 0) {}
	child {
		node[fill = red] {}
		child { node {} }
		child {
			node[fill = red] {}
			child { node {} child { node[fill=red] {} } child[missing] {} }
			child { node {} }
		}
	}
	child { node {} };
```
	* Uncle is black, zig-zag. Rotate node with parent.
```{.tex .tikz width=70%}
\tikzset{ every node/.style = {draw, circle, fill}, level distance = 20 }
\node at (0, 0) {}
	child {
		node[fill = red] {}
		child { node {} }
		child {
			node[fill = red] {}
			child { node {} child { node[fill=red] {} } child[missing] {} }
			child { node {} }
		}
	}
	child { node {} };
\node[fill = none, draw = none] at (1.35, -1.45) {\(\to\)};
\node at (4, 0) {}
	child {
		node[fill = red] {}
		child {
			node[fill = red] {}
			child { node {} }
			child { node {} child { node[fill=red] {} } child[missing] {} }
		}
		child { node {} }
	}
	child { node {} };
```
	* Uncle is black, zig-zig. Rotate parent with grandparent. Recolour root.
```{.tex .tikz width=70%}
\tikzset{
	every node/.style = {draw, circle, fill}, level distance = 20,
	level 2/.style = {sibling distance = 20}
}
\node at (0, 0) {}
	child {
		node[fill = red] {}
		child {
			node[fill = red] {}
			child { node {} }
			child { node {} child { node[fill=red] {} } child[missing] {} }
		}
		child { node {} }
	}
	child { node {} };
\node[fill = none, draw = none] at (1.7, -1.45) {\(\to\)};
\node at (3.8, 0) {}
	child {
		node[fill = red] {}
		child { node {} }
		child { node {} child { node[fill=red] {} } child[missing] {} }
	}
	child {
		node[fill = red] {}
		child { node {} } child { node {} }
	};
```
