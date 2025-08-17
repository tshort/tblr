#import "/tblr.typ": *

#set page(height: auto, width: auto, margin: 0em)

// try different hooks

#tblr(columns: 4, 
  cells((span(-3,-2), -3), hooks: text.with(fill: red)),
  cells((2, span(0, 2)), hooks: emph),
  cells((0, span(1, end)), hooks: (strong, emph, text.with(fill: blue))),
  cells((0,2), fill: gray),
  cells((1, span(0, 1)), hooks: ($$.func(), text.with(fill: purple))),
  ..range(20).map(str))

#pagebreak()

// ordering, last should win

#tblr(columns: 4, 
  cols(1, hooks: text.with(fill: red)),
  rows(1, hooks: text.with(fill: orange)),
  cols(end, hooks: text.with(fill: blue)),
  rows(end, hooks: text.with(fill: green)),
  ..range(20).map(str))

#pagebreak()

#tblr(
  columns: (1in, 1in), 
  content-hook: from-csv,
  "one, two
   1, 2
   3, 4
   5, 6
   7, 8")

#pagebreak()


