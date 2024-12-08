#import "../tblr.typ": *

#let to-text(x) = {
  if type(x) == "string" {
    return x
  }
  if type(x) == content and "text" in x.fields() {
    return x.text
  }
  return none
}

// For an array `a`, return an array with contents aligned on `marker`.
// Needs to be used in a context.
#let fmt(a, marker: ".") = {
  let result = ()
  let max1 = 0pt
  let max2 = 0pt
  for x in a {
    let xt = to-text(x)
    let xs = ()
    if xt == none {
      result.push((x, none))
      continue
    } else {
      xs = xt.split(marker)    
    }
    if xs.len() == 1 {
      xs.push("")
    }
    let xw1 = measure(xs.at(0)).width
    if xw1 > max1 {
      max1 = xw1
    }
    let xw2 = measure(xs.at(1)).width
    if xw2 > max2 {
      max2 = xw2
    }
    result.push(xs)
  }
  for (i,x) in result.enumerate() {
    if x.at(1) == none {
      result.at(i) = x.at(0)
    } else {
      result.at(i) = stack(dir: ltr, box(width: max1, align(right, x.at(0))), if x.at(1) != "" {marker} else {""}, box(width: max2, x.at(1)))
      
    }
  }
  result
}

#set page(height: auto, width: auto, margin: 0em)

#let pop = csv.decode("
China,1313,9596,136.9
India,1095,3287,333.2
United States,298,9631,31.0
Indonesia,245,1919,127.9
Brazil,188,8511,22.1
Pakistan,165,803,206.2
Bangladesh,147,144,1023.4
Russia,142,17075,8.4
Nigeria,131,923,142.7"
).flatten()

#set table(stroke: none)

#context tblr(header-rows: 1, columns: 4,
  align: (left+bottom, center, center, center),
  // formatting directives
  rows(within: "header", 0, fill: aqua.lighten(60%), hooks: strong),
  cols(within: "body", 0, fill: gray.lighten(70%), hooks: strong),
  rows(within: "body", 1, 6, hooks: text.with(red)),
  cells(((2, -3), end), hooks: strong),
  // apply((auto, (1,2,-1)), fmt),
  apply((auto, span(1, end)), fmt),
  // content
  [Country], [Population \ (millions)],[Area\ (1000 sq. mi.)],[Pop. Density\ (per sq. mi.)],
  ..pop
)

// Note that the `apply` directive must come after the formatting directives.
// That means it is applied first before any of the formatting directives,
// and the contents are still strings.
