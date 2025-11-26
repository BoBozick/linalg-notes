#import "style.typ": *
#import "@preview/physica:0.9.7": iprod, derivative

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

  memes: false,
)

#image("assets/image-4.png") <meme>

#definition()[
  A permutation is a bijective map from a finite set to itself.

  If $X = {1, ..., n}$ then its symmetric group is
  $ S_n = {sigma : X -> X | sigma "is bijective"} $
  and has $n!$ elements.

  cyclic, e.g. (1 4 2) (3)

  transposition is the permutation $(i space j)$
]

#lemma()[
  Every permutation $sigma in S_n$ is a composition of transpositions.
]

#definition()[
  Signum
]

#lemma()[
  $ sgn((a_1 space a_2 space dots.h.c space a_n)) = (-1)^k $

  #example[$ derivative(, x) abs(x) = sgn(x) $]
]

#definition()[
  A _determinant_ is a scalar value associated with a square matrix $A$,
  denoted $det A$ or $|A|$, defined recursively as follows:

  - For a $1 times 1$ matrix $A = (a_(11))$ it holds that $det A = a_(11)$.
  - For $n > 1$,
    $ det A = sum_(j=1)^n (-1)^(1+j) a_(1j) det(M_(1j)), $
    where $M_(1j)$ is the $(n-1) times (n-1)$ submatrix obtained by deleting
    row $1$ and column $j$ from $A$.

  The determinant measures, e.g., whether a matrix is invertible,
  the scaling factor of the linear transformation defined by $A$,
  and how linearly independent the columns of $A$ are.
]

#theorem()[
  $det A = det A^T$
]

#theorem()[
  The determinant is multilinear in its rows.
]

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

  Note that the proof of (iii) and (iv) can be shortened if (v) is proven.
]

#definition(title: [Field])[ // TODO UPDATE THIS
  A _field_ is a set $F$ with two binary operations $+$ and $dot$ such that
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

#image("assets/image.png")

== Subspaces

#definition(title: [Subspace])[
  A subspace of a vector space $V$ is a subset $H$ that is
  + nonempty (e.g., $ve(0) in H$),
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

#theorem()[
  With matrix addition and scalar multiplication, $dim F^(m times n) = m n$.
]

#definition(title: [Rank and Nullity])[
  The rank of a linear map (or matrix)
  is the dimension of its image (column space)
  and is also given by the number of pivot columns, and
  the nullity is the dimension of its kernel.
]

#theorem(title: [Rank Theorem])[
  For an $m times n$ matrix $A$ it holds that
  $ rank A + nullity A = n. $
]

= Matrices

#image("assets/image-3.png") <meme>

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
  That is, $ve(b) in col A$.
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

#theorem(title: [Orthogonal Complements])[
  For any matrix $A$,
  $ (row A)^ort = ker A quad "and" quad (col A)^ort = coker A. $
]

== Eigenvalues and Eigenvectors

=== Matrices

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
  
  The number of occurrences for a root to the characteristic equation
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
  + $A$ has $n$ linearly independent eigenvectors. <temp>
  + There exists an invertible matrix $P$ and a diagonal matrix $D$ such that
    $A = P D P^(-1)$.
    In fact, $P$ is the eigenvectors and $D$ is the eigenvalues.
] <thm:diagonalization>

#corollary()[
  An $n times n$ matrix with $n$ distinct eigenvalues is diagonalizable.

  #proof[The result follows immediately from @thm:diagonalization.]
]

#tip-box()[
  To avoid computing $P^(-1)$, simply verify that $A P = P D.$
  This is equivalent to $A = P D P^(1)$ when $P$ is invertible
  (which you should verify).
]

#image("assets/image-5.png")

=== Transformations

#definition()[
  Let $V$ be a vector space.
  An _eigenvector_ of a linear map $T : V -> V$ is a nonzero vector
  $ve(x) in V : T(ve(x)) = lambda ve(x)$ for some scalar $lambda$.

  A scalar $lambda$ is called an _eigenvalue_ of $T$ if
  there is a nontrivial solution $ve(x)$ to $T(ve(x)) = lambda ve(x)$.

  Such an $x$ is called an _eigenvector_ corresponding to $lambda$.
]

#image("assets/image-6.png")

#image("assets/image-7.png")

#image("assets/image-2.png") <meme>

= Linear Maps

== Definitions

#definition(title: [Linear Map])[
  A map $T : V -> W$ is _linear_ if
  $ T(a ve(u) + b ve(v)) = a T(ve(u)) + b T(ve(v)) $
  for all $ve(u), ve(v) in V$ and $a, b in RR$.
  In other words, the function satisfies additivity and homogenity.

  If $W = V$, then $T$ is said to be an _operator_.
  Else if $W = F$, then $T$ is said to be a _functional_.
]

#theorem()[
  Any linear map $T$ has an associated matrix $cal(M)(T).$
]

#theorem()[
  A linear map $T : V -> W$ is bijective if it is
  + injective ($ker T = {ve(0)}$) and
  + surjective ($im T = W$).

  This is equivalent to $T$ having a linear inverse $T^(-1) : W -> V$.

  If $V$ is finite-dimensional, then $T$ being
  injective, surjective, or invertible is equivalent.
]

#definition(title: [Isomorphism])[
  A map $T : V -> W$ is an _isomorphism_ if it is
  + bijective and linear or, equivalently,
  + invertible.

  If such a map exists, the spaces _isomorphic_, written $V tilde.equiv W$.
  This means that the difference between them is the choice of basis.

  If $V = W$, then $T$ is an _automorphism_.
]

#theorem()[
  Two finite dimensional vectors spaces over $F$ are isomorphic if and only if
  they have the same dimension.
]

#theorem()[
  $dim cal(L)(V, W) = (dim V)(dim W)$
]

#image("assets/image-1.png", height: 10cm) <meme>

#theorem()[
  The set of all linear maps $cal(L)(V, W)$ from $V$ to $W$ is a vector space.
]

#theorem(title:[Fundamental Theorem of Linear Maps])[
  Suppose $V$ is finite-dimensional and $T in cal(L)(V, W)$.
  Then, $im T$ is finite-dimensional and
  $ dim ker T + dim im T = dim V. $
]

#definition(title: [Affine])[
  A map $f$ is affine if it can be written as
  $ f(x) = A x + b $
  or, equivalently, if the map $g$ defined by
  $ g(x) = f(x) - f(0) $
  is linear.
]

== Properties

#theorem(title: [Left/Right Inverse])[
  If a linear map has a right inverse then it is surjective,
  if it has a left inverse then it is injective,
  and if it has both it is bijective.
]

= Geometry

== Inner Products

#definition(title: [Inner Product])[
  The inner product for a real vector space $V$ is function
  $ iprod(ve(v), ve(u)) : V times V -> RR $
  that is
  + bilinear
  + symmetric
  + positive definite:
    $iprod(ve(v), ve(v)) = 0$ if $ve(v) = ve(0)$ else
    $iprod(ve(v), ve(v)) > 0$
]

#definition(title: [Inner Product Space])[
  An inner product space is a vector space and its inner product.

  #example(title: [Examples])[
  + $V = RR^n$, $iprod(ve(x), ve(y)) = ve(x) dot ve(y)$
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

#definition(title: [Unit Vector])[
  A unit vector is one whose norm is 1.
]

#theorem(title: [The Cauchy--Schwarz Inequality])[
  For all $ve(u), ve(v) in V$,
  $ |iprod(ve(u), ve(v))| <= norm(ve(u)) norm(ve(v)). $
]

#theorem(title: [The Triangle Inequality])[
  For all $ve(u), ve(v) in V$,
  $ norm(ve(u) + ve(v)) <= norm(ve(u)) + norm(ve(v)). $
]

== Orthogonality

=== Vectors

#definition(title: [Orthogonality])[
  The vectors $ve(x)$ and $ve(y)$ in an inner product space are orthogonal,
  written $x ort y$, if and only if $iprod(x, y) = 0$.
]

#note-box()[
  The zero-vector is orthogonal to all vectors.
]

#image("assets/image-1.png")

#image("assets/image-11.png")

#image("assets/image-12.png")

#image("assets/image-17.png")

#image("assets/image-18.png")

#warning-box()[
  The least-squares error is sometimes defined as the squared norm.
]

#theorem()[
  If $ve(b) ort col A$ then $uve(b) := proj_(col A) ve(b) = ve(0).$
]

#image("assets/image-13.png")

#image("assets/image-15.png")

#image("assets/image-16.png")

#image("assets/image-14.png")

#tip-box()[
  To find $R$ during QR-factorization, find $Q$ and set
  $ R = Q^T A. $
]

=== Sets

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

=== Matrices

#theorem()[
  An $m times n$ matrix $U$ has orthonormal columns if and only if
  $U^T U = I_n.$
]

#image("assets/image-10.png")

#definition()[
  An _orthogonal_ (also called _orthonormal_) matrix is
  an invertible square matrix $Q$ with $Q^T = Q^(-1)$.

  Such a matrix has orthonormal rows and columns.
]

#theorem()[
  Let $B = (ve(b)_1, ..., ve(b)_n)$
  be an ON-basis to an inner product space $V$
  of which $ve(x) in V$. Then,
  $ vec(ve(x))_B = vec(iprod(ve(x), ve(b)_1), dots.v, iprod(ve(x), ve(b)_n)). $
  
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