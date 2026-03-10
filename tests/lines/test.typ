#import "/tblr.typ": *

#set page(height: auto, width: auto, margin: 1em)

#set table(stroke: none)

// cell locations

#tblr(
  columns: 3,
  table.hline(),
  [1], [2], [3],
  table.hline(),
  [4], [5], [6],
  [7], [8], [9],
  table.hline(),
)

#tblr(
  columns: 3,
  hline(),
  [1], [2], [3],
  hline(),
  [4], [5], [6],
  [7], [8], [9],
  hline(),
)

#pagebreak()

#tblr(
  columns: 3,
  table.vline(),
  [1], [2], [3],
  table.vline(),
  [4], [5], [6],
  [7], [8], [9],
)

#tblr(
  columns: 3,
  vline(),
  [1], [2], [3],
  vline(),
  [4], [5], [6],
  [7], [8], [9],
)

#pagebreak()

#tblr(
  columns: 3,
  hline(y: 0),
  hline(y: -2),
  hline(y: end),
  vline(x: 0),
  vline(x: -2),
  vline(x: end),
  [1], [2], [3],
  [4], [5], [6],
  [7], [8], [9],
)

#pagebreak()

#tblr(
  columns: 3,
  hline(0, -2, end),
  vline(0, -2, end),
  [1], [2], [3],
  [4], [5], [6],
  [7], [8], [9],
)

#tblr(
  columns: 3,
  hline(y: (0, -2, end)),
  vline(x: (0, -2, end)),
  [1], [2], [3],
  [4], [5], [6],
  [7], [8], [9],
)

