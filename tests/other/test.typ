#import "/tblr.typ": *

#set page(height: auto, width: auto, margin: 0em)

// cell locations

#tblr(columns: 4, 
  [1], [2], [3], table.cell(rowspan: 3, [4]),
  [1], [2], [3], 
  [1], [2], [3], 
  [1], [2], [3],  [4],
)
  
#pagebreak()

#tblr(columns: 4, 
  // cols(auto, inset: (y: 0.5em), align: center),
  table.cell(rowspan: 3, [1]),
  table.cell(colspan: 2, [2]),
  [4],
  // table.cell(rowspan: 2, [4]),
       [2], [3],  [4],
       [2], [3],  [4],
  [1], [2], [3],  [4],
)

#pagebreak()

#tblr(columns: 4, 
  cols(auto, inset: (y: 0.5em), align: center),
  table.cell(rowspan: 3, [1]),
  table.cell(colspan: 2, [2]),
  table.cell(rowspan: 2, [4]),
       [2], [3], 
       [2], [3],  [4],
  [1], [2], [3],  [4],
)

#pagebreak()

#tblr(columns: 4,
  header-rows: 0,
  cols(within: "header", auto, fill: blue),
  ..range(16).map(str))

#pagebreak()

#tblr(columns: 4,
  header-rows: 0,
  hline(within: "header", y: 1, stroke: red),
  ..range(16).map(str))

#pagebreak()
#set page(width: 16cm)

#tblr(remarks: lorem(20), 
  columns: 5,
  ..(20 * (lorem(2),)))
)

#pagebreak()

#tblr(remarks: lorem(20), 
  columns: (1fr, auto, auto, auto, auto),
  ..(20 * (lorem(2),)))
)

