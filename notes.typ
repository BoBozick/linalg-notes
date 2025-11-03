#import "style.typ": *
#import "@preview/physica:0.9.7": vb, vu, dprod, cprod, rank

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

#v(40em)