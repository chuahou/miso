---
title: ADS, BSTs
---

# BSTs

* [3.2] Rooted binary tree:
	* **BST property**: node value $>$ left subtree's values and $<$ right
	  subtree's.
* Operations: `Insert`, `Delete`, `Search`, `Min`, `Max`, `Pred`, `Succ`
  (all $\mathcal O(\text{height})$)
	* [3.5] `Insert`: do `Search` and place new node.
	* [3.6] `Succ`:
		* If has right child, left-most descendant of right child.
		* Otherwise follow path up to root and return first right turn.
		* `Prec` reversed.
	* [3.7] `Delete`:
		* No child: done.
		* 1 child: replace self with child.
		* 2 children: replace self with successor.
	* [3.8] $\mathcal O(\log n)$ if balanced.
* [3.14] Rotations.
```{.tex style="width:90%;margin-left:auto;margin-right:auto;"}
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta}
\begin{document}
\begin{tikzpicture}
\tikzset{
	sibling distance = 3cm,
	level 2/.style = {sibling distance  = 2cm},
	treenode/.style = {draw, circle},
	subtree/.style = {draw, isosceles triangle, shape border rotate = 90,
		minimum height = 10mm, minimum width = 15mm, inner sep = 0,
		anchor = north},
}
\node[treenode] (y1) at (0,0) {y}
	child {
		node[treenode] (x1) {x}
		child[child anchor = north] { node[subtree] {\(\alpha\)} }
		child[child anchor = north] { node[subtree] {\(\beta\)} }
	}
	child[child anchor = north] { node[subtree] {\(\gamma\)} };
\node[treenode] (x2) at (7,0) {x}
	child[child anchor = north] { node[subtree] {\(\alpha\)} }
	child {
		node[treenode] (y2) {y}
		child[child anchor = north] { node[subtree] {\(\beta\)} }
		child[child anchor = north] { node[subtree] {\(\gamma\)} }
	};
\path[->] (3,-2) edge node[above] {RR(y)} (4,-2);
\path[<-] (3,-2.5) edge node[below] {LR(x)} (4,-2.5);
\end{tikzpicture}
\end{document}
```

# Red-black trees

$\Rightarrow$ CLRS 12/13.

* [3.10] Store node colour red/black.
	* Root and leaves (NILs) black.
	* Red nodes have black children.
	* Black height $\mathbf{bh}(x) =$ no. of black nodes from $x$ to leaves.
		* Same for all paths ($\leadsto$ balanced).
* [3.12] Red-black tree has height $\leq 2\mathbf{bh}(T) \leq 2\log(n+1)$.
* [3.15] Standard `Insert` and colour red. If red-red violation,
	* Uncle is red $\to$ recolour parent, uncle and grandparent.
	* Uncle is black, zig-zag. Rotate node with parent.
	* Uncle is black, zig-zig. Rotate parent with grandparent. Recolour root.
	* First case $\mathcal O(\log n)$ times, second and third case once. Total
	  $\mathcal O(\log n)$.
	* [Diagrams](bst-rb-diag.md).
	* Cases maintain black-height property and remove red-red violation.
* `Delete` similar but more complicated.

# Splay trees

* [4.5] **Splay trees** self-adjusting with no extra data, amortized $\mathcal
  O(\log n)$.
	* Splay accessed item to root.
	* Frequently accessed items near root.
* Operations
	* [4.7] `Splay` operation until item is root.
		* Zig-zig: rotate parent and grandparent, rotate self and parent.
		* Zig-zag: rotate self and parent, rotate self and grandparent.
		* If item not in tree, splay successor/predecessor.
	* [4.8] `Search`: just `Splay`. `Insert`: insert normally then `Splay`.
	  `Delete`: `Splay`, then replace root with predecessor.
		* $\mathcal O(1)$ calls to `Splay`, amortized $\mathcal O(\log n)$
		  `Splay`.
* [4.15] **Access lemma**: Charge of splaying node $x$ at most
  $1 + 3(r'(x) - r(x))$.
	* [4.14] $r(x)$ is $\log$ of no. of nodes in subtree of $x$.
	* [4.20] **General access lemma**: at most $1 + 3 \log (\sum W / w_x)$.
* [4.2] **Statically optimal tree** $T^*$ has minimum aggregate look-up cost for
  given access probabilities.
	* [4.23] Splay trees within constant factor of statically optimal tree.
	* [Conjecture](https://en.wikipedia.org/wiki/Splay_tree#Dynamic_optimality_conjecture):
	  within constant factor of *dynamically* optimal tree.
