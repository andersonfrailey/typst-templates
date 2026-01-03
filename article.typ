#let article(
  title: none,
  author: none,
  affiliation: none,
  abstract: none,
  date: none,
  keywords: none,
  journal_code_label: "JEL Codes",
  journal_codes: none,
  font: "New Computer Modern",
  break_first_page: true,
  body,
) = {
  set page(margin: (x: 1in, y: 1in)) // set page margins
  set text(font: font) // set font to user input
  set heading(numbering: "1.") // add numbering to sections
  show heading: set block(above: 2em, below: 2em) // add space around headings
  set par(justify: true) // justify paragraphs

  // only add numbers to labeled equations
  show: body => {
    for elem in body.children {
      if elem.func() == math.equation and elem.block {
        let numbering = if "label" in elem.fields().keys() { "(1)" } else { none }
        set math.equation(numbering: numbering)
        elem
      } else {
        elem
      }
    }
  }

  align(center + horizon)[
    #text(size: 2em)[#smallcaps(title)]

    #author

    #affiliation

    #if date == none {
      datetime.today().display("[month repr:long] [day], [year]")
    }
  ]
  if abstract != none {
    v(2em)
    align(center)[*Abstract*]
    block(
      inset: (left: 2em, right: 2em),
      [#par(
        justify: true,
        abstract,
      )],
    )
    v(2em)
  }
  if keywords != none {
    [Keywords: #keywords]
  }

  if journal_codes != none {
    par([#journal_code_label: #journal_codes])
  }

  if break_first_page {
    pagebreak()
  }
  set par(first-line-indent: 1.8em) // indent first line of all but first paragraph

  body
}
