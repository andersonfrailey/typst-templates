#import "article.typ": article

#set text(size: 14pt)

#show: article.with(
  title: "A Nobel Prize Winning Idea",
  author: "Anderson Frailey",
  affiliation: "University of Maryland, Baltimore County",
  abstract: [
    #lorem(100)
  ],
  keywords: [keyword one, keyword two,...],
  journal_codes: [...],
)

#counter(page).update(1)
#set page(numbering: "1")

= Introduction

#lorem(200)

#lorem(200)

= Section Two

$ y = m x + b $

#lorem(100)

$ y = mu x + beta $<labeled>

== Subsection

#lorem(150)
