#import "/tblr.typ": *

#set page(height: auto, width: auto, margin: 0em)

// cell locations

#tblr(columns: 4, 
  cells((span(-3,-2), -3), fill: purple),
  cells((span(-3,-2), -3), fill: gray),
  cells((-3, span(-2,end)), fill: red),
  cells(((0,end),(0,2)), fill: blue),
  cells((end,end), fill: green),
  ..range(20).map(str))

#pagebreak()

#tblr(columns: 4, 
  cells((0,0), (0,end), fill: blue),
  cells(((1,2),(1,2)), fill: red),
  cells((span(2,end),0), fill: green),
  cells((1, span(2,end)), fill: orange),
  cells((-2, -2), fill: purple),
  ..range(20).map(str))

#pagebreak()

// row locations

#tblr(columns: 4, 
  rows(0, fill: blue),
  rows(end, fill: red),
  rows(1, 3, fill: green),
  rows(end, fill: red),
  ..range(20).map(str))

#pagebreak()

// col locations

#tblr(columns: 4, 
  cols(0, fill: blue),
  cols(end, fill: red),
  cols(1, 3, fill: green),
  cols(end, fill: red),
  ..range(20).map(str))

#pagebreak()

// cell locations within the body

#tblr(columns: 4, header-rows: 1,
  cells(within: "body", (0,0), fill: blue),
  cells(within: "body", (span(2,end),0), fill: green),
  cells(within: "body", (0, span(1,2)), fill: orange),
  cells(within: "body", (-2, -2), fill: purple),
  cells(within: "body", (span(-3,-2), -3), fill: purple),
  cells(within: "body", (-3, span(-2,end)), fill: red),
  ..range(20).map(str))

#pagebreak()

// cell locations within the header

#tblr(columns: 4, header-rows: 3,
  cells(within: "header", (end,end), fill: blue),
  cells(within: "header", (span(1,end),0), fill: green),
  cells(within: "header", (auto, 1), fill: orange),
  cells(within: "header", (-2, -2), fill: purple),
  cells(within: "header", (-3, span(-2,end)), fill: red),
  ..range(20).map(str))

#pagebreak()

// col locations within the header

#tblr(columns: 4, header-rows: 3,
  cols(within: "header", end, fill: blue),
  cols(within: "header", 2, 0, fill: green),
  cols(within: "header", 1, fill: red),
  ..range(20).map(str))

#pagebreak()

// row locations within the header

#tblr(columns: 4, header-rows: 3,
  rows(within: "header", end, fill: blue),
  rows(within: "header", 0, fill: green),
  rows(within: "header", 1, fill: red),
  ..range(20).map(str))

#pagebreak()

// order of application (last should win)

#tblr(columns: 4, 
  rows(end, fill: blue),
  cols(end, fill: orange),
  rows(1, fill: green),
  cols(1, fill: red),
  ..range(20).map(str))

#pagebreak()

// other cell attributes

#tblr(columns: 4, 
  cells((0, 2), fill: blue, colspan: 2),
  cells((-2, 0), fill: blue, rowspan: 2),
  cells((1, 1), stroke: red),
  cells((0, 0), align: right),
  cells((1, auto), inset: (y:1em)),
  ..range(20).map(str))
