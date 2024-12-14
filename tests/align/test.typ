#import "/tblr.typ": *

#set page(height: auto, width: auto, margin: 0em)

#let x = (
  "0.12345",
  ".1", 
  "0.1",
  "1.00",
  "hello&",
  "&hello",
  "hel&lo",
  "3x",
)

#context grid(inset: 3pt, ..decimal-align(x))

#pagebreak()

#context grid(inset: 3pt, ..decimal-align(x.map($$.func())))

#pagebreak()

#context tblr(columns: 3, stroke: none, 
  rows(2, hooks: strong),
  rows(-2, hooks: text.with(fill: blue)),
  cols(1, hooks: text.with(fill: blue)),
  col-apply(auto, decimal-align),
  note((span(1,2), span(1,2)), "Some note"),
  ..(x * 3))

#pagebreak()

#let x = (
  $0.12345$,
  // $.1$,  // bug
  $0.1$,
  $1000.00$,
  $x =\& "hello"$,
  $c =\& sqrt(a^2 + b^2)$,
  $x = "hello&"$,
  $3x$,
)

#context grid(inset: 3pt, ..decimal-align(x))

#pagebreak()


#context tblr(columns: 3, stroke: none, 
  rows(2, hooks: strong),
  rows(-2, hooks: text.with(fill: blue)),
  cols(1, hooks: text.with(fill: blue)),
  col-apply(auto, decimal-align),
  note((span(1,2), span(1,2)), "Some note"),
  ..(x * 3))

#pagebreak()

#let x = (
  [0.12345],
  [.1],
  [1000.00],
  [x = 0.5 V],
  [3x],
  [$3.5 times 10^3$],
  [*strong 27.3*],
  [*strong+emph _27.3_*],
  [text $x = 27$ cm],
  [*strong+emph+red _#text(red, "27.3")_*], 
  [&right],
  [left&],
  [mid&dle],
)
#context grid(inset: 3pt, ..decimal-align(x))

#pagebreak()

#context tblr(columns: 3, stroke: none, 
  rows(2, hooks: strong),
  rows(-2, hooks: text.with(fill: blue)),
  cols(1, hooks: text.with(fill: blue)),
  col-apply(auto, decimal-align),
  note((span(1,2), span(1,2)), "Some note"),
  ..(x * 3))


