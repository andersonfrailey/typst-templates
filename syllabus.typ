#let syllabus(
  instructor: none,
  university: none,
  course: none,
  term: none,
  email: none,
  office_hours: none,
  office: none,
  body,
) = {
  set page(margin: (x: 1in, y: 1in))

  set text(size: 12pt, font: "New Computer Modern")

  set par(justify: true, spacing: 0.55em)

  show heading: set align(center)
  show heading.where(level: 1): it => block(
    above: 1em,
    below: 0.75em,
    text(size: 14pt, weight: "bold")[#it.body],
  )
  show heading.where(level: 2): it => block(
    above: 1em,
    below: 0.75em,
    text(size: 12pt, weight: "bold")[#it.body],
  )

  set table(stroke: none)

  if university != none {
    align(center)[#smallcaps(university)]
    v(0em)
  }
  if course != none {
    align(center)[#text(size: 16pt, weight: "bold")[#smallcaps(course)]]
    v(0em)
  }
  if term != none {
    align(center)[#smallcaps(term)]
  }

  line(length: 100%)
  v(0.5em)

  par([Professor: #instructor])
  par([Office Hours: #office_hours])
  par([Office: #office])
  v(0.5em)

  line(length: 100%, stroke: 0.5pt)

  body
}
