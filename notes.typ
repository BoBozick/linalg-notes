#import "style.typ": *
#import "@preview/physica:0.9.7": dprod, cprod

#show: styling.with(
  course-name: "Linear Algebra",
  course-code: "SF1672",
  title-size: 30pt,
  title-space: 0em, 

  size: 12pt,
  margin: 0.5cm,
  width: 15cm,
  height: auto,
  end-space: 40em,
  heading-break: false,
  contents: false,
)

To do:
+ Sections 4.2, 4.3, 5 in the lecture notes
+ exercise sheet 1
+ course literature
+ exam and recommended problems

Inner product:
$ mat(1, 2 , 3) mat(1; 1; 2) = mat(1 + 2 + 6) = mat(9) $

Intersections in $RR^3$:
- line--plane

  Substitute the line's parametric form into the plane's general equation.

- line--line

  Solve the system formed by the two parametric equations.

- plane--plane

  Construct a vector between two arbitrary points (one on each plane) given in parametric form.
  Set its dot product with each plane's normal vector to zero.
  Solve the resulting system of equations.

Rotation about the $x$-, $y$- and $z$-axes by $theta$ (counterclockwise):
$
mat(1, 0, 0; 0, cos theta, -sin theta; 0, sin theta, cos theta),
mat(cos theta, 0, sin theta; 0, 1, 0; -sin theta, 0, cos theta),
mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1).
$
Pay special attention to the placement of the minus sign for the $y$-axis rotation.

#definition(title: [Linearity])[
  A function $T : V -> W$ is linear if
  $ T(a ve(u) + b ve(v)) = a T(ve(u)) + b T(ve(v)) $
  for all $ve(u), ve(v) in V$ and $a, b in RR$.
  In other words, the function satisfies additivity and homogeneity.
]

#definition()[
  A transformation $f$ is affine if the function $g$ defined by
  $g(x) = f(x) - f(0)$ is linear.
]

#definition(title: [Basis])[
  A basis for a vector space $V$ is a set $B = {ve(b)_1, ..., ve(b)_n}$
  of linearly independent vectors that span $V$.

  #example()[The set ${ve(e)_1, ..., ve(e)_n}$ is the standard basis for $RR^n$,
  and the set ${1, t, t^2, ..., t^n}$ is the standard basis for $P_n$.
  ]
]

Let $B = (ve(b)_1, ..., ve(b)_n)$ be a basis for $V$.
Each $ve(v) in V$ can be expressed as
 $ ve(v) = x_1 ve(b)_1 + dots.h.c + x_n ve(b)_n $
with the coordinate vector
 $ mat(ve(v))_B = vec(x_1, dots.v, x_n)_B. $

Let $C = (ve(c)_1, ..., ve(c)_n)$ be another basis for $V$ with
 $ ve(c)_j = a_(1 j) ve(b)_1 + dots.h.c + a_(n j) ve(b)_n $

#definition()[
  An eigenvalue $lambda$ with eigenvector $ve(x) != ve(0)$
  of a matrix $A$ satisfies
  $ A ve(x) = lambda ve(x). $
  The eigenvalues are found from the characteristic equation
  $ det(A - lambda I) = 0. $
]

#theorem()[
  For a symmetric matrix $A$, the column space equals the row space.
]

#theorem(title: [Symmetry])[
  For any square matrix $A$, the matrix $A A^T$ is symmetric.
]

#definition(title: [Subspace])[
  A subset $U$ of $V$ is a subspace if $U$ is itself a vector space,
  i.e. it satisfies
  + additive identity: $ve(0) in U$
  + closed under addition: if $ve(u), ve(w) in U$ then $ve(u) + ve(w) in U$
  + closed under scalar multiplication: if $lambda in FF$ then $lambda ve(u) in U$
]

#definition(title: [Span])[
  The span of a set of vectors $S = {ve(v)_1, ..., ve(v)_k}$
  is the set of all linear combinations of the vectors in $S$.
]

#theorem()[
  The span of a set of vectors is the smallest subspace that contains them.
]

$P^2 = P$

$H = 2 P - I$

#definition(title: [Permutation])[
  A permutation is a rearrangement of the order of a set of objects.
  
  #example[The permutation of ${0, 1, 2, ..., n}$ is a bijection
  $ pi : {0, 1, 2, ..., n} -> {0, 1, 2, ..., n}. $]

  #example[A permutation matrix is an identity matrix with permuted rows or columns.
  The identity matrix itself corresponds to the identity permutation.]
]

#definition(title: [Orthogonal Complement])[
  The space of all vectors orthogonal to a subspace $V <= RR^n$
  is called its orthogonal complement, denoted $V^ort$.
]

#theorem(title: [Fundamental Orthogonal Complements])[
  In $RR^n$, $ker(A) = row(A)^ort$ and $coker(A) = col(A)^ort$.
]

#theorem()[
  Row reduction affects $col(A)$ and $coker(A)$ (their subspaces change by row operations)
  although their dimensions remain the same. Row reduction does not change $row(A)$ or $ker(A)$.
  The analogous statement holds for column reduction (rarely used).
]

#corollary()[
  If two matrices are row-equivalent, then they have the same row space.
]

#definition()[
  $ col(A) = span{ve(v)_1, ..., ve(v)_n} = im(f_A), $
  where $ve(v)_1, ..., ve(v)_n$ are the columns of $A$.
]
#theorem()[
  If a linear transformation has a right inverse then it is surjective,
  and if it has a left inverse then it is injective.
]

#definition(title: [Field])[
  A field is a set $F$ with operations $+$ and $dot$ such that
  - $0 + a = a + 0 = a$
  - $(a + b) + c = a + (b + c)$
  - $a + b = b + a$
  - there exists $(-a)$ with $a + (-a) = 0$
  - $1 dot a = a dot 1$
  - $(a dot b) dot c = a dot (b dot c)$
  - $a dot b = b dot a$
  - for all $a != 0$ there exists $a^{-1}$ with $a dot a^{-1} = 1$
]

#definition(title: [Vector Space])[
  A vector space over a field $F$ is a set $V$ with two operations:
  - Vector addition $+ : V times V -> V$
  - Scalar multiplication $dot : F times V -> V$

  These must satisfy
  + $ve(u) + ve(v) in V$
  + $ve(u) + ve(v) = ve(v) + ve(u)$
  + $ve(u) + (ve(v) + ve(w)) = (ve(u) + ve(v)) + ve(w)$
  + $a (b ve(u)) = (a b) ve(u)$
  + $a (ve(u) + ve(v)) = a ve(u) + a ve(v)$
  + $(a+ b) ve(v) = a ve(v) + b ve(v)$
  + $1 ve(u) = ve(u)$
  + $ve(u) + ve(0) = ve(u)$
  + $ve(u) + (-ve(u)) = ve(0)$
]

#definition(title: [Subspace])[
  A subspace of a vector space $V$ is a subset $H$ that is
  + nonempty (e.g. $ve(0) in H$),
  + closed under addition, and
  + closed under scalar multiplication.

  #example[The set ${ve(0)}$ (with $ve(0) in V$) is a subspace of every $V$.]
]

#caution-box[
  $RR^2$ is not a subspace of $RR^3$. However, the set ${(s, t, 0) : s, t in RR}$ is a subspace of $RR^3$.
]

#theorem()[
  If $ve(v)_1, ..., ve(v)_p in V$,
  then $span{ve(v)_1, ..., ve(v)_p}$ is a subspace of $V$.
]

#theorem()[
  The column space of an $m times n$ matrix is a subspace of $RR^m$
  and the row space is a subspace of $RR^n$.
]

#image("image.png")

#theorem()[
  The pivot columns of a matrix form a basis for its column space.
]

