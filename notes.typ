#import "style.typ": *
#import "@preview/physica:0.9.7": dprod, cprod, rank

#show: styling.with(
  course-name: "Linjär Algebra",
  course-code: "SF1672",
  title-size: 30pt,
  title-space: 0em, 

  size: 12pt,
  margin: 0.5cm,
  width: 15cm,
  height: auto,
  heading-break: false,
  contents: false,
)

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
  $ T(a vector(u) + b vector(v)) = a T(vector(u)) + b T(vector(v)) $
  for all $vector(u), vector(v) in V$ and $a, b in RR$.
]

Gör:
+ 4.2, 4.3, 5 i SU
+ lapp1
+ kurslitteratur
+ prov och rekommenderade uppgifter

#v(40em)