#import "../tblr.typ": *
#import "@preview/zero:0.3.2": align-column

#set page(height: auto, width: auto, margin: 0em)

#context tblr(columns: 2,
  align: center,
  header-rows: 1,
  col-apply(within: "body", auto, x => align-column(..x)),
  [A],      [B],
  [10.234], [99.1], 
  [1.1],    [9.81+-.01], 
  [-20000], [9.81+-.01e2])