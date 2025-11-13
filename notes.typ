#import "style.typ": *
#import "@preview/physica:0.9.7": dprod, cprod

#show: styling.with(
  course-name: "Linjär Algebra",
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

Gör:
+ 4.2, 4.3, 5 i SU
+ lapp1
+ kurslitteratur
+ prov och rekommenderade uppgifter

Inre produkt:
$ mat(1, 2 , 3) mat(1; 1; 2) = mat(1 + 2 + 6) = mat(9) $

Incidens i $RR^3$:
- linje--plan

  Substituera linjens parameterform in i planets allmänna ekvation.

- linje--linje

  Ekvationssystem av parameterformerna.

- plan--plan

  Forma en vektor mellan två godtyckliga punkter av linjerna på parameterform.
  Sätt dess skalärprodukt med vardera linjes riktningsvektor till noll.
  Lös ekvationssystemet 

Rotation kring $x$-axeln, $y$-axeln respektive $z$-axeln $theta$ grader moturs:
$
mat(1, 0, 0; 0, cos theta, -sin theta; 0, sin theta, cos theta),
mat(cos theta, 0, sin theta; 0, 1, 0; -sin theta, 0, cos theta),
mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1).
$
Notera särskilt minustecknets placering för $y$-axeln.

#definition(title: [Linearity])[
  A function $T : V -> W$ is linear if
  $ T(a ve(u) + b ve(v)) = a T(ve(u)) + b T(ve(v)) $
  for all $ve(u), ve(v) in V$ and $a, b in RR$.
  That is, the function has the additivity and homogenity properties.
]

#definition()[
  A transformation $f$ is affine if $g$ with $g(x) = f(x) - f(0)$ is linear.
]

#definition(title: [Basis])[
  A basis for a vector space $V$ is a set $B = {ve(b)_1, ..., ve(b)_n}$
  of linearly independent vectors spanning $V$.

  #example()[The set ${ve(e)_1, ..., ve(e)_n}$ is the standard basis for $RR^n$
  and the set ${1, t, t^2, ..., t^n}$ is the standard basis for $PP_n$.
  ]
]

Let $B = (ve(b)_1, ..., ve(b)_n)$ be a basis for $V$.
Each $ve(v) in V$ can be expressed as
$ ve(v) = x_1 ve(b)_1 + dots.h.c + x_n ve(b)_n $
with the coordinate vector
$ mat(ve(v))_B = vec(x_1, dots.v, x_n)_B. $

Let $C = (ve(c)_1, ..., ve(c)_n)$ be a basis for $V$ with
$ ve(c)_j = a_(1 j) ve(b)_1 + dots.h.c + a_(n j) ve(b)_n $

#definition()[
  An eigenvalue $lambda$ and its eigenvector $ve(x) != ve(0)$
  of a matrix $A$ is such that
  $ A ve(x) = lambda ve(x), $
  where the eigenvalues are given by the characteristic equation
  $ det(A - lambda I) = 0. $
]

#theorem()[
  For a symmetric matrix $A$ the column space and row space are equal.
]

#theorem(title: [Symmetry])[
  For any square matrix $A$ the matrix $A A^T$ is symmetric.
]

#definition(title: [Subspace])[
  A subset $U$ of $V$ is a subspace if $U$ is also a vector space,
  thus satisfying
  + additative identity: $ve(0) in U$
  + closed under addition: $ve(u), ve(w) in U ==> ve(u) + ve(w) in U$
  + closed under scalar multiplication: $lambda in FF ==> lambda ve(u) in U$
]

#definition(title: [Span])[
  The span of a set of vectors $S = {ve(v)_1, ..., ve(v)_k}$
  is the set of all linear combinations of the vectors in $S$.
]

#theorem()[
  The span of a set of vectors is the smallest subspace containing them.
]

$P^2 = P$

$H = 2 P - I$

#definition(title: [Permutation])[
  A permutation is a rearrangment of the order of a set of objects.
  
  #example[The permutation of ${0, 1, 2, ..., n}$ is a bijective function
  $ pi : {0, 1, 2, ..., n} -> {0, 1, 2, ..., n}. $]

  #example[A permutation matrix is an
  identity matrix with permuted rows or columns.
  The identity matrix itself is the identity permutation.]
]

#definition(title: [Orthogonal Complement])[
  The space of all vectors orthogonal to a subspace $V <= RR^n$
  is called its orthogonal complement $V^ort$.
]

#theorem(title: [Fundamental Orthogonal Complements])[
  In $RR$, $ker(A) = row(A)^ort$ and $coker(A) = col(A)^ort$.
]

#theorem()[
  Row reduction affects $col(A)$ and $coker(A)$ although their dimensions remain intact,
  while not affecting $row(A)$ and $ker(A)$,
  and vice versa for column reduction (which is rarely used).
]

#corollary()[
  If two matrices are row equivalent, then their row spaces are the same.
]

#definition()[
  $ col(A) = span{ve(v)_1, ..., ve(v)_n} = im(f_A), $
  where $ve(v)_1, ..., ve(v)_n$ are the columns of $A$.
]
#theorem()[
  Om en linjär transformation har en högerinvers så är den surjektiv
  och om den har en vänsterinvers är den injektiv.
]

#definition(title: [Kropp])[
  En kropp är en mängd $F$ med operationerna $+$ och $dot$ så att
  - $0 + a = a + 0 = a$
  - $(a + b) + c = a + (b + c)$
  - $a + b = b + a$
  - $exists (-a) : a + (-a) = 0$
  - $1 dot a = a dot 1$
  - $(a dot b) dot c = a dot (b dot c)$
  - $a dot b = b dot a$
  - för alla $a != 0$ finns ett $a^(-1) : a dot a^(-1) = 1+$
]

#definition(title: [Vector Space])[
  A vector space over a field $F$ is a set $V$ with two operations:
  - Vector addition $+ : V times V -> V$
  - Scalar multiplication $dot : F times V -> V$

  These must satisfy
  + $ve(u) + ve(v) in V$
  + $ve(u) + ve(v) = ve(v) + ve(u)$
  + $ve(u) + (ve(v) + ve(w)) = (ve(v) + ve(u)) + ve(w)$
  + $a ve(u) = ve(u) a$
  + $a(b ve(u)) = (a b) ve(u)$
  + $a(ve(u) + ve(v)) = a ve(u) + a ve(v)$
  + $(a+ b) ve(v) = a ve(v) + b ve(v)$
  + $1 ve(u) = ve(u)$
  + $ve(u) + ve(0) = ve(u)$
  + $ve(u) + (-ve(u)) = ve(0)$
]

#definition(title: [Subspace])[
  A subspace of a vector space $V$ is a subset $H$ that is
  + nonempty, verified by finding $ve(0) in H$.
  + closed under addition.
  + closed under scalar multiplication.

  #example[The set ${ve(0)}$ with $ve(0) in V$ is a subspace of every $V$.]
]

#caution-box[
  $RR^2$ is not a subspace of $RR^3$. However, ${(s, t, 0) : s, t in RR}$ is.
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

