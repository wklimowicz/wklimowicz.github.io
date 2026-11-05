#set document(title: "Wojciech Klimowicz | Academic CV", author: "Wojciech Klimowicz")
#set page(paper: "a4", margin: (x: 22mm, y: 20mm), numbering: none)
#set text(font: "Libertinus Serif", size: 11pt, fill: black)
#set par(leading: 0.55em, spacing: 4pt)
#set heading(numbering: none)
#show heading.where(level: 1): it => block(above: 17pt, below: 10pt)[
  #text(size: 12.5pt, weight: "bold", it.body)
  #block(above: 3pt, below: 0pt, line(length: 100%, stroke: 0.4pt))
]

#let entry(name, dates, detail, note: none, location: none) = block(below: 13pt, breakable: false)[
  #grid(
    columns: (1fr, auto),
    column-gutter: 14pt,
    align: (left, right),
    text(weight: "bold", name),
    if location != none { location } else { dates },
  )
  #v(1pt)
  #if location != none {
    grid(columns: (1fr, auto), column-gutter: 14pt, align: (left, right), detail, dates)
  } else { detail }
  #if note != none { block(above: 2pt, below: 0pt, note) }
]

#align(center)[
  #text(size: 22pt, weight: "bold")[Wojciech Klimowicz]
  #v(4pt)
  #text(size: 10.5pt)[#link("mailto:wojciech.klimowicz.24@ucl.ac.uk", "wojciech.klimowicz.24@ucl.ac.uk") · #link("https://wklimowicz.github.io")[wklimowicz.github.io]]
]
#v(4pt)

= Research Interests

Labour Economics; Economics of Education.

= Education

#entry(
  [University College London], [2026 - 2033 (expected)],
  [MPhil/PhD in Economics (part-time)],
  note: [Supervisor: Pedro Carneiro.],
  location: [London],
)

#entry(
  [University College London], [2024 - 2026],
  [MRes in Economics],
  location: [London],
)

#entry(
  [Birkbeck, University of London], [2022 - 2024],
  [MSc in Economics],
  location: [London],
)

#entry(
  [University of Surrey], [2015 - 2019],
  [BSc in Economics],
  location: [Guildford],
)

= Professional Experience

#block(below: 13pt, breakable: false)[
  #grid(
    columns: (1fr, auto), column-gutter: 10pt, align: (left, right),
    [*Department for Education*],
    [London],
  )
  #v(3pt)
  #grid(
    columns: (1fr, auto), column-gutter: 14pt, row-gutter: 5pt, align: (left, right),
    [Data Engineer (part-time)], [September 2024 - Present],
    [Economic Adviser], [November 2022 - August 2024],
    [Senior Assistant Economist], [May 2021 - October 2022],
    [Assistant Economist], [August 2020 - May 2021],
  )
]

#entry(
  [HM Revenue & Customs], [July 2019 - August 2020],
  [Fast Stream Economist],
  location: [London],
)

= Honours, Awards and Scholarships

#entry(
  [UBEL DTP PhD Studentship], [2024 - 2032],
  [ESRC-funded doctoral studentship.],
)

#entry(
  [Best Overall Economics Student], [2024],
  [Birkbeck, University of London],
)

= Additional Information

#grid(
  columns: (38mm, 1fr),
  column-gutter: 5mm,
  row-gutter: 7pt,
  [*Software*], [R, Python, SQL, Julia, Git, Bash.],
  [*Data engineering*], [Data pipelines and administrative databases (Databricks, PySpark, SQL).],
  [*Record linkage*], [Probabilistic linkage of administrative records (Splink, Python).],
  [*Languages*], [Polish (fluent).],
  [*Citizenship*], [Polish.],
)

#v(12pt)
#text(size: 9pt, fill: rgb("666666"))[Updated: November 2026]
