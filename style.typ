#import "@preview/theorion:0.4.1": *
#import cosmos.rainbow: *

#import "@preview/physica:0.9.7": super-T-as-transpose


#let styling(
  course-name: "",
  course-code: "",
  title-size: 30pt,
  subtitle-size: 16pt,
  title-space: 0em,

  size: 12pt,
  margin: 0.5cm, // 0.5 for computer, 0.1 for phone (cm)
  width: 11cm,   // 16 for computer, 8 for phone (cm)
  height: auto,
  heading-break: false,
  contents: false,

  doc
) = {
  // Headings
  set heading(
    numbering: (..levels) => {
      if levels.pos().len() <= 3 {
        levels.pos().map(str).join(".") + "."
      } else {
        "---"
      }
    }
  )

  show heading.where(level: 1): it =>{
    if heading-break and not it.body == [Contents] {
      pagebreak()
    }
    set text(size: size + 8pt)
    it
  }
  show heading.where(level: 2): it =>{
    set text(size: size + 2pt)
    smallcaps(it)
  }
  show heading.where(level: 3): it =>{
    set text(size: size)
    it
  }
  show heading.where(level: 4): set heading(
    outlined: false
  )

  // Title
  set document(title: course-name)
  show title: it =>{
    set text(size: title-size)
    set align(center)
    it
  }
  let subtitle = {
    set text(size: subtitle-size)
    set align(center)
    course-code
  }
  let make-title(title-content, subtitle-content) = {
    if title-content != "" {
      align(center, {
        title()
        v(-title-size * 0.4)
        text(size: subtitle-size, subtitle-content)
        v(title-space)
        }
      )
    }
  }

  // Outline
  show outline.entry: it => link(
    it.element.location(),
    // Drop the fill and the page.
    it.indented(it.prefix(), it.body()),
  )
  show outline.entry.where(
    level: 1
  ): set text(weight: "bold")
  show outline.entry.where(
    level: 2
  ): smallcaps

  // Text
  set text(
    size: size,
    font: "New Computer Modern",
    lang: "en",
    region: "SE",
  )
  set terms(
    separator: " "
  )
  set enum(
    numbering: "(i)"
  )

  // Math
  set math.mat(delim: "[")
  set math.vec(delim: "[")
  show math.equation.where(block: false): set math.frac(style: "horizontal")
  
  show: super-T-as-transpose

  // Layout
  set par(
    leading: 0.80em,
  )
  set page(
    margin: margin,
    height: height,
    width: width,
  )

  // Graphics
  show image: it => align(center, it)
  show math.equation.where(block: false): box // Prevent line wrapping.
  show: show-theorion

  // Make document
  if course-name != "" {
    title()
    v(-title-size * 0.4)
    subtitle
    v(title-space)
  }
  if contents {outline()}

  doc
}


// Modify TheOrion
#let (corollary-counter, corollary-box, corollary, show-corollary) = make-frame(
  "corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter,
  render: render-fn.with(fill: red.darken(20%)),
)

#let (lemma-counter, lemma-box, lemma, show-lemma) = make-frame(
  "lemma",
  theorion-i18n-map.at("lemma"),
  counter: theorem-counter,
  render: render-fn.with(fill: red.darken(20%)),
)

#let compact-restate(labels) = {
  theorion-restate(
    filter: it => labels.contains(it.label),
    render: it => (
      prefix: none, title: "", full-title: auto, body
      ) => block[
        *#full-title* \ #body
      ]
  )
}