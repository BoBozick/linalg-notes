#import "style.typ": *
#import "@preview/physica:0.9.7": iprod

#show: styling.with(
  course-name: "Linear Algebra",
  course-code: "SF1672",
  title-size: 30pt,
  title-space: 0em, 

  size: 12pt,
  margin: 0.5cm,
  width: 15cm,
  height: auto,
  end-space: 0em,
  heading-break: false,
  contents: true,

  images: true,
)

#image("image-4.png")

= Vector Spaces

== Definitions

#definition(title: [Group])[
  A _group_ is a set $G$ with a binary operation $*$ such that
  for all $a, b, c in G$,
  + (Closure) $a * b in G$
  + (Associativity) $(a * b) * c = a * (b * c)$
  + (Identity) $exists e in G : e * a = a * e = a$ 
  + (Inverse) $exists a^(-1) in G : a * a^(-1) = a^(-1) * a = e$

  Additionally, a group is said to be _abelian_ if
  5. (Commutative) $a * b = b * a$
]

#definition(title: [Field])[
  A field is a set $F$ with two binary operations $+$ and $dot$ such that
  + $(F, +)$ is an abelian group with identity $0$.
  + $(F\\{0}, dot)$ is an abelian group with identity $1$.
  + Multiplication distributes over addition:\
    for all $a, b, c in F$, $a dot (b + c) = a dot b + a dot c$.

  That is, it holds that
    + $0 + a = a + 0 = a$
  + $(a + b) + c = a + (b + c)$
  + $a + b = b + a$
  + there exists $(-a)$ with $a + (-a) = 0$
  + $1 dot a = a dot 1$
  + $(a dot b) dot c = a dot (b dot c)$
  + $a dot b = b dot a$
  + for all $a != 0$ there exists $a^(-1)$ with $a dot a^(-1) = 1$
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
  + $1 ve(u) = ve(u)$
  + $ve(u) + ve(0) = ve(u)$
  + $ve(u) + (-ve(u)) = ve(0)$
]

== Subspaces

#definition(title: [Subspace])[
  A subspace of a vector space $V$ is a subset $H$ that is
  + nonempty (e.g. $ve(0) in H$),
  + closed under addition, and
  + closed under scalar multiplication.

  #example[The set ${ve(0)}$ (with $ve(0) in V$) is a subspace of every $V$.]
]

#warning-box[
  $RR^2$ is not a subspace of $RR^3$.
  However, the set ${(s, t, 0) : s, t in RR}$ is a subspace of $RR^3$.
]

#definition(title: [Span])[
  The span of a set of vectors $S = {ve(v)_1, ..., ve(v)_k}$
  is the set of all linear combinations of the vectors in $S$.
  The span of a set of vectors is the smallest subspace that contains them.
]

#theorem()[
  If $ve(v)_1, ..., ve(v)_p in V$,
  then $span{ve(v)_1, ..., ve(v)_p}$ is a subspace of $V$.
]

== Bases

#definition(title: [Basis])[
  A basis for a vector space $V$ is a set $B = {ve(b)_1, ..., ve(b)_n}$
  of linearly independent vectors that span $V$.

  #example()[The set ${ve(e)_1, ..., ve(e)_n}$ is
  the standard basis for $RR^n$,
  and the set ${1, t, t^2, ..., t^n}$ is the standard basis for $P_n$.
  ]
]

#theorem(title: [Basis Criterion])[
  Let $V$ be an $n$-dimensional vector space with $n >= 1$.
  Any set of $n$ vectors in $V$ is automatically a basis if
  + it is linearly independent or, equivalently,
  + it spans $V$.
]

#definition(title: [Coordinates])[
  Let $B = {ve(b)_1, ..., ve(b)_n}$ be a basis for $V$.
  Each $ve(v) in V$ can be expressed as
  $ vec(ve(v))_B = vec(x_1, dots.v, x_n)_B, $
  the injective coordinate mapping $ve(v) -> vec(ve(v))_B$,
  $ P_B = mat(ve(b)_1, dots.h.c, ve(b)_n) $
  from $B$ to the standard basis in $V$, with
  $ ve(v) = P_B vec(ve(v))_B. $
  Now let $C = {ve(c)_1, ..., ve(c)_n}$ be another basis for $V$.
  Then there is a unique $n times n$ matrix
  $ P_(C<-B) = mat(vec(ve(b)_1)_C, dots.h.c, vec(ve(b)_n)_C) $
  $ vec(ve(x))_C = P_(C<-B) vec(ve(x))_B $
  and
  $ (P_(C<-B))^(-1) = P_(B<-C). $
]

#problem[For a vector space in $RR^n$,
  let $E$ be the standard basis and the bases $B$ and $C$ be given.
  Find the change-of-basis matrix from $B$ to $C$.
]

#solution[The change-of-basis matrices give
  $ P_(C<-B) = P_(C<-E) P_(E<-B) = (P_(E<-C))^(-1) P_(E<-B). $
]

#solution(title: [Alternative solution])[For simplicity
  assume that the dimension is $n = 2$.
  The bases of $B$ in $C$-coordinates $ve(v)_1$ and $ve(v)_2$ satisfy
  $ mat(ve(c)_1, ve(c)_2)_E mat(ve(v)_1, ve(v)_2)_C  = 
  mat(ve(b)_1, ve(b)_2)_E mat(I)_B, $
  thus being given by reducing
  $ mat(ve(c)_1, ve(c)_2, |, ve(b)_1, ve(b)_2)
  ~ mat(I, |, ve(v)_1, ve(v)_2). $
]


== Dimension

#definition(title: [Dimension])[
  The dimension of a vector space is the number of vectors in every basis.
  A vector space is either finite-dimensional och infinite-dimensional.
]

#definition(title: [Rank and Nullity])[
  The rank of a linear transformation (or matrix)
  is the dimension of its image (column space)
  and is also given by the number of pivot columns, and
  the nullity is the dimension of its kernel.
]

#theorem(title: [Rank Theorem])[
  For an $m times n$ matrix $A$ it holds that
  $ rank A + nullity A = n. $
]

= Matrices

#image("image-3.png")

== Linear Systems

#definition(title: [Echelon Form])[
  - Row Echelon Form (REF): \
    Pivots move to the right as you go down, with zeros below each pivot.

  - Reduced Row Echelon Form (RREF): \
    REF plus each pivot is 1 and is the only nonzero entry in its column.
    Canonical, i.e., unique.
]

#warning-box()[
  Some authors also require pivots to start with 1 for REF.
]

#definition(title: [Consistent])[
  A linear system $A ve(x) = ve(b)$ is consistent
  if it has at least one solution.
]

#theorem(title: [Echelon Test])[
  After reducing $mat(A, |, ve(b))$ to REF or RREF, a system is inconsistent
  if and only if you obtain a row of the form
  $ mat(0, 0, dots.h.c, 0, |, c), quad c != 0. $
]

#definition(title: [Singular])[
  A matrix is singular if it is square and non-invertible.
]

#definition(title: [Elementary Matrix])[
  An elementary matrix is an $n times n$ matrix obtained by applying
  one elementary row operation to the identity matrix $I_n$.
  
  All elementary matrices are invertible.
]

#theorem(title: [Determinant Properties])[
  Let $A$ and $B$ be $n times n$ matrices.
  + $det A B = (det A)(det B$)
  + $det A^T = det A$
  + $det A = a_11 a_22 dots.h.c a_(n n)$ if $A$ is triangular
]

#theorem(title: [Invertible])[
  Let $A$ be an $n times n$ matrix. Then it is equivalent that
  + $A$ is invertible
  + $A^T$ is invertible
  + $A$ has a left-hand inverse
  + $A$ has a right-hand inverse
    \ \
  + $A$ has $n$ pivot positions
  + $A$ is row equivalent to the $n times n$ identity matrix
  + $A$ can be expressed as a product of elementary matrices
  + $A ve(x) = ve(b)$ has at least (and thus exactly)
    one solution for each $ve(b)$
  + $A ve(x) = ve(0)$ has only the trivial solution
  + 0 is _not_ an eigenvalue of $A$
    \ \
  + the columns of $A$ are linearly independent, forming a basis for $RR^n$
  + $col A = RR^n$
  + $ker A = {ve(0)}$
  + $rank A = n$
  + $nullity A = 0$
  + $(col A)^ort = {ve(0)}$
  + $(ker A)^ort = RR^n$
  + $row A = RR^n$
    \ \
  + $T(ve(x)) = A ve(x)$ is injective
  + $T(ve(x)) = A ve(x)$ is surjective
  + $T(ve(x)) = A ve(x)$ is bijective,
    having $im T = RR^n$ and an inverse $T^(-1)$
    \ \
  + $A$ has $n$ nonzero singular values
  + $det A != 0$
]

== Column and Row Spaces

#definition(title: [Column Space])[
  $ col(A) = span{ve(v)_1, ..., ve(v)_n} = im(f_A), $
  where $ve(v)_1, ..., ve(v)_n$ are the columns of $A$.
]

#theorem(title: [Pivot Basis])[
  The pivot columns of a matrix form a basis for its column space.
]

== Eigenvalues and Eigenvectors

#definition(title: [Eigenstuff])[
  An eigenvalue $lambda$ with the eigenvector $ve(x) != ve(0)$
  of a matrix $A$ satisfies
  $ A ve(x) = lambda ve(x) "or, equivalently," (A - lambda I) ve(x) = ve(0). $
  The eigenvalues are found from the characteristic equation
  $ det(A - lambda I) = 0, $
  which for each eigenvalue gives the eigenvectors as the solutions to
  $ (A - lambda I) ve(x) = ve(0) $
  and the eigenspace as
  $ E_lambda = ker(A - lambda I), $
  which is a subspace of $RR^n$.
  
  The number of occurances for a root to the characteristic equation
  is that eigenvalue's algebraic multiplicity.
]

#note-box()[
  Although the eigenvector must be nonzero, the eigenvalue may be zero,
  which it is if and only if the matrix is not invertible.
]

#theorem()[
  The eigenvalues of a triangular matrix are the entries on its diagonal.
]

// TODO fix this:
Let $lambda$ be an eigenvalue of a triangular matrix $A$.
Then, if and only if $a_(i i) = lambda$ for some diagonal element $a_(i i)$,
that gives a free

#theorem()[
  If $ve(v)_1, ..., ve(v)_r$ eigenvectors corresponding to distinct
  eigenvalues $lambda_1, ..., lambda_r$ of an $n times n$ matrix,
  then they are linearly independent.
]

#definition(title: [Similarity])[
  If $A$ and $B$ are $n times n$ matrices such that there exists $P$ with
  $ P^(-1) A P = B "or, equivalently," A = P B P^(-1). $
]

#theorem()[
  If two matrices are similar, then they share eigenvalues.

  However, the reverse is not implied.
]

#theorem(title: [Diagonalization])[
  For an $n times n$ matrix $A$ it is equivalent that
  + $A$ is diagonalizable.
  + $A$ has $n$ linearly independent eigenvectors.
  + There exists an invertible matrix $P$ and a diagonal matrix $D$ such that
    $A = P^(-1) D P$.
    In fact, $P$ is the eigenvectors and $D$ is the eigenvalues.
]

#image("image-2.png")

= Linear Maps

== Definitions

#definition(title: [Linear Map])[
  A function $T : V -> W$ is linear if
  $ T(a ve(u) + b ve(v)) = a T(ve(u)) + b T(ve(v)) $
  for all $ve(u), ve(v) in V$ and $a, b in RR$.
  In other words, the function satisfies additivity and homogeneity.
]

#theorem()[
  A linear map $T : V -> W$ is bijective if it is
  + injective ($ker T = {ve(0)}$) and
  + surjective ($im T = W$).

  This is equivalent to $T$ having a linear inverse $T^(-1) : W -> V$.
]

#definition(title: [Isomorphism])[
  A linear map $T : V -> W$ is an _isomorphism_ if it is bijective.

  If such a map exists, the spaces _isomorphic_, written $V tilde.equiv W$.

  If $V = W$, then $T$ is a
  n _automorphism_.
]

#image("image-1.png", height: 10cm)

#definition(title: [Affine])[
  A transformation $f$ is affine if the function $g$ defined by
  $g(x) = f(x) - f(0)$ is linear.
]

== Properties

#theorem(title: [Left/Right Inverse])[
  If a linear transformation has a right inverse then it is surjective,
  if it has a left inverse then it is injective,
  and if it has both it is bijective.
]

= Geometry

== Inner Products

#definition(title: [Inner Product])[
  The inner product for a real vector space $V$ is function
  $ iprod(x, y) : V times V -> RR $
  that is
  + bilinear
  + symmetric
  + positive definite
]

#definition(title: [Inner Product Space])[
  An inner product space is a vector space and its inner product.

  #example(title: [Examples])[
  + $V = RR^n$, $iprod(x, y) = x dot y$
  + $V = RR^2$, $iprod((x_1, x_2), (y_1, y_2)) = 3 x_1 y_1 + 5 x_2 y_2$
  + $V = RR^2$, $iprod((x_1, x_2), (y_1, y_2)) = x_1 y_1 + x_2 y_2
    + (x_1 y_2 + x_2 y_1)/2$
  + $V = PP^n$ // TODO
  + $V = C^0 ([-1, 1]), iprod(f, g) = integral_(-1)^1 f(t) d(t) dif t$ // TODO
  ]
]

#definition(title: [Norm])[
  In an inner product space, the norm is defined as
  $ norm(ve(x)) = sqrt(iprod(ve(x), ve(x))). $
]

== Orthogonality

#definition(title: [Orthogonality])[
  The vectors $ve(x)$ and $ve(y)$ in an inner product space are orthogonal,
  written $x ort y$, if and only if $iprod(x, y) = 0$.
]

#note-box()[
  The zero-vector is orthogonal to all vectors.
]

#definition(title: [Orthogonal Complement])[
  The orthogonal complement to a subset $S$ of a vector space $V$ is
  $ S^ort = {ve(x) in V : ve(x) ort ve(s) space  forall ve(s) in S}. $
]

#definition(title: [Orthogonal Set])[
  A set $S subset.eq V$ is orthogonal if
  $ve(x) ort ve(y)$ for every $ve(x) != ve(y) in S$.
  The set is also orthonormal (ON) if
  $ve(x)$ for every $ve(x) in S$.
]

#theorem()[
  Orthogonal sets of nonzero vectors are linearly independent.

  #proof // TODO
]

#theorem()[
  Let $B = (ve(b)_1, ..., ve(b)_n)$ be an ON-basis to an inner product space $V$
  of which $ve(x) in V$. Then,
  $ vec(ve(x))_B = vec(iprod(ve(x), ve(b)_1), dots.v, iprod(ve(x), ve(b)_n)) $

  #proof // TODO
]

== $RR^3$

#tip-box(title: [Finding Intersections])[
  - line--plane

    Substitute the line's parametric form into the plane's general equation.

  - line--line

    Solve the system formed by the two parametric equations.

  - plane--plane

    Construct a vector between two arbitrary points (one on each plane)
    given in parametric form.
    Set its dot product with each plane's normal vector to zero.
    Solve the resulting system of equations.
]

#theorem(title: [Rotation])[
  Rotation about the $x$-, $y$- and $z$-axes by $theta$ (counterclockwise):
  $
  mat(1, 0, 0; 0, cos theta, -sin theta; 0, sin theta, cos theta),
  mat(cos theta, 0, sin theta; 0, 1, 0; -sin theta, 0, cos theta),
  mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1).
  $
]

#warning-box()[
  Pay special attention to the placement of the minus sign for
  the $y$-axis rotation.
]