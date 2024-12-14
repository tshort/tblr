#import "/tblr.typ": *

#set page(height: auto, width: auto, margin: 2pt)
#show figure.where(kind: table): set figure.caption(position: top)

#let booktbl = tblr.with(
  stroke: none,
  column-gutter: 0.6em,
  // booktabs style rules
  rows(within: "header", auto, inset: (y: 0.5em)),
  rows(within: "header", auto, align: center),
  hline(within: "header", y: 0, stroke: 0.08em),
  hline(within: "header", y: end, position: bottom, stroke: 0.05em),
  rows(within: "body", 0, inset: (top: 0.5em)),
  hline(y: end, position: bottom, stroke: 0.08em),
  rows(end, inset: (bottom: 0.5em)),
)

#pagebreak()

#booktbl(columns: 7, header-rows: 2,
  // combine header cells
  cells((0, (1,4)), colspan: 3, stroke: (bottom: 0.03em)),
  // table note and caption
  remarks: [Note: ] + lorem(18),
  caption: [This is a caption],
  // content
  [], [tol $= mu_"single"$], [], [], [tol $= mu_"double"$], [], [],
  [], [$m v$ ], [Rel.~err], [Time   ], [$m v$ ], [Rel.~err], [Time], 
  [trigmv   ],  [11034], [1.3e-7], [3.9], [15846], [2.7e-11], [5.6 ], 
  [trigexpmv], [21952], [1.3e-7], [6.2], [31516], [2.7e-11], [8.8 ], 
  [trigblock], [15883], [5.2e-8], [7.1], [32023], [1.1e-11], [1.4e1], 
  [expleja  ], [11180], [8.0e-9], [4.3], [17348], [1.5e-11], [6.6 ])
  
#pagebreak()

#set page(height: auto, width: auto, margin: 2pt)
#show figure.where(kind: table): set figure.caption(position: top)

#tblr(columns: 7, header-rows: 2,
  stroke: none,
  // combine header cells
  cells((0, (1,4)), colspan: 3, stroke: (bottom: 0.03em)),
  column-gutter: 0.6em,
  // booktabs style rules
  rows(within: "header", auto, inset: (y: 0.5em)),
  rows(within: "header", auto, align: center),
  hline(within: "header", y: 0, stroke: 0.08em),
  hline(within: "header", y: end, position: bottom, stroke: 0.05em),
  rows(within: "body", 0, inset: (top: 0.5em)),
  hline(y: end, position: bottom, stroke: 0.08em),
  rows(end, inset: (bottom: 0.5em)),
  // table notes, remarks, and caption
  note((1, (1,4)), [$m v$ is in kg·m².]),
  note((1, (3,6)), [Time is in secs.]),
  note(sym.dagger, (2, 0), [Another note.]),
  remarks: [_Note:_ ] + lorem(18),
  caption: [This is a caption],
  note-fun: x => super(text(fill: blue, x)),
  note-numbering: "a",
  // content
  [], [tol $= mu_"single"$], [], [], [tol $= mu_"double"$], [], [],
  [], [$m v$], [Rel.~err], [Time], [$m v$], [Rel.~err], [Time], 
  [trigmv],  [11034], [1.3e-7], [3.9], [15846], [2.7e-11], [5.6], 
  [trigexpmv], [21952], [1.3e-7], [6.2], [31516], [2.7e-11], [8.8], 
  [trigblock], [15883], [5.2e-8], [7.1], [32023], [1.1e-11], [1.4e1], 
  [expleja], [11180], [8.0e-9], [4.3], [17348], [1.5e-11], [6.6])
  
#pagebreak()

#set page(height: auto, width: auto, margin: 0em)


#context tblr(columns: 1,
  align: center, inset: 3pt, stroke: none,
  col-apply(auto, decimal-align),
  // content
  "Text",
  "10000",
  "0.12345",
  ".1",
  "1.00",
  "300.",
  "hello&",
  "&hello",
  "3x",
  "30. mi.",
  "100,000 sq. mi.",
  "192.168.1.1 ip",
  "v1.0.2"
)


#pagebreak()

#set page(height: auto, width: auto, margin: 0em)

#let df = (
  Polar: ($-130.5$, $50.2∠120.3°$, $100∠-120°$, $2.3∠1.2°$),
  Complex: ($130.5$, $50.2 + j 90.3$, $100 - j 110$, $-90 - j 120$),
  Numbers: ($(4.23 ± 0.01) times 10^2$, $-25.23 ± 10.1$, $1.23 times 10^2$, $0.5$),
)



#let align-polar = split-and-align.with(
  //          50  .2         ∠      120  .3°    
  format: ("\d+", "[^∠]*", "∠",   "\d+"), 
  align:  (right, left,    right, right, left))

#let align-complex = split-and-align.with(
  format: ("\d+", "[^+−-]*",   ".*j", "\d+"), 
  align:  (right, left,        right, right, left))

#let align-numbers = split-and-align.with(
  //                 (      4  .23         ±          0  .01             )    ×        10  ^2
  format: ("[^\d+−-]*", "\d+", "[^± ]*", "±",   "[\d]+", "[.\d]*", "[^×]*", "×",    "\d+"), 
  align:  (right,       right, left,     right, right,   left,     right,   right,  right, left))

#context tblr(columns: 3,
  header-rows: 1, column-gutter: 3em,
  align: center, inset: 3pt, stroke: none,
  rows(0, stroke: (bottom: 1pt)),
  col-apply(within: "body", 0, align-polar),
  col-apply(within: "body", 1, align-complex),
  col-apply(within: "body", 2, align-numbers),
  // content
  ..dataframe-to-table(df)
)

#pagebreak()

// Adapted from https://www.storytellingwithdata.com/blog/2012/02/grables-and-taphs
#set page(height: auto, width: auto, margin: 0em)

#let data = from-csv(delimiter: "|", "
Tower Hamlets          | 1  | 3  | 269 | 9692642
Hackney                | 2  | 2  | 225 | 7809608
Southwark              | 3  | 12 | 232 | 7266118
Camden                 | 4  | 14 | 136 | 6140419
Islington              | 5  | 4  | 156 | 5424137
Lambeth                | 6  | 8  | 156 | 5257941
Newham                 | 7  | 2  | 154 | 5217075
Hammersmith and Fulham | 8  | 13 | 109 | 4085708
Merton                 | 9  | 29 | 113 | 3656112
Croydon                | 10 | 20 | 127 | 3629066
")

#set table(stroke: none)

#let bar(x) = {
  rect(width: int(x) / 7000000 * 2in, fill: blue, text(fill: white, x))
}

#tblr(columns: 5,
  align: center+horizon,
  // formatting directives
  rows(within: "header", auto, fill: aqua.lighten(60%), hooks: strong),
  cols(within: "body", 0, align: left, fill: gray.lighten(70%), hooks: strong),
  cols(within: "body", -1, align: left, hooks: bar),
  // content
  table.header([Borough],[Trust\ rank],[Index\ rank],[Number\ of grants],[Amount approved (£)]),
  ..data
)

#pagebreak()
#import "@preview/zero:0.3.0": ztable

#set page(height: auto, width: auto, margin: 0em)

#show table: set text(number-type: "lining", number-width: "tabular")

#let pop = from-csv("
China,1313,9596,136.9
India,1095,3287,333.2
United States,298,9631,31.0
Indonesia,245,1919,127.9
Brazil,188,8511,22.1
Pakistan,165,803,206.2
Bangladesh,147,144,1023.4
Russia,142,17075,8.4
Nigeria,131,923,142.7"
)

#set table(stroke: none)

#tblr(header-rows: 1, columns: 4,
  table-fun: ztable,
  align: (left+bottom, center, center, center),
  // ztable formatting
  format: (none, auto, auto, auto),
  // formatting directives
  rows(within: "header", 0, fill: blue, hooks: (strong, text.with(white))),
  rows(within: "body", calc.even, fill: gray.lighten(80%)),
  // content
  [Country], [Population \ (millions)],[Area\ (1000 sq. mi.)],[Pop. Density\ (per sq. mi.)],
  ..pop
)

#pagebreak()

#set page(height: auto, width: auto, margin: 0em)

#let pop = from-csv("
China,1313,9596,136.9
India,1095,3287,333.2
United States,298,9631,31.0
Indonesia,245,1919,127.9
Brazil,188,8511,22.1
Pakistan,165,803,206.2
Bangladesh,147,144,1023.4
Russia,142,17075,8.4
Nigeria,131,923,142.7"
)

#set table(stroke: none)

#context tblr(header-rows: 1, columns: 4,
  align: (left+bottom, center, center, center),
  // formatting directives
  rows(within: "header", 0, fill: aqua.lighten(60%), hooks: strong),
  cols(within: "body", 0, fill: gray.lighten(70%), hooks: strong),
  rows(within: "body", 1, 6, hooks: text.with(red)),
  cells(((2, -3), end), hooks: strong),
  col-apply(within: "body", span(1, end), decimal-align), 
  note((-3, 3), "Highest value"),
  // content
  [Country], [Population \ (millions)],[Area\ (1000 sq. mi.)],[Pop. Density\ (per sq. mi.)],
  ..pop
)

