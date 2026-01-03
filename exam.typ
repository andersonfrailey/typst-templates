#let question-counter = counter("question");
#let total-points = state("total-points", 0);

#let question(points, body) = {
  let qc = context counter("question").display()
  question-counter.step()
  total-points.update(x => x + points)
  block(
    above: 4em,
    below: 2em,
    [
      #text(
        [Question #qc. (#points #if points == 1 [point] else [points])],
        weight: "bold",
        size: 14pt,
      )
      #v(1.5em)

      #pad(left: 1em, body)
    ],
  )
}

#let exam(
  exam_title: none,
  version: none,
  instructions: none, // list of instructions: list([Rule1], [Rule 2], etc.)
  font: "New Computer Modern",
  body,
) = {
  set page(margin: (x: 1in, y: 1in))
  set text(size: 12pt, font: font)
  set list(indent: 2em)
  set enum(numbering: it => strong(numbering("(a)", it)))

  "Name: ______________________"

  v(5em)

  if exam_title != none {
    align(center)[#text(size: 24pt, weight: "bold")[#smallcaps(exam_title)]]
  }
  if version != none {
    align(center)[Version: #version]
  }

  if instructions != none {
    "Instructions:"
    v(1em)
    instructions
    v(1em)
  }
  context {
    let points = total-points.final()
    let questions = question-counter.final().first()

    [There #if questions == 1 [is] else [are] #questions #if questions == 1 [question] else [questions] worth #points #if points == 1 [point] else [points].]
  }

  pagebreak()

  body
}
