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

