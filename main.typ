#import "@preview/showybox:2.0.1": showybox

#let bluebox(title, text, ..opts) = {
  showybox(
    title-style: (
      weight: 900,
      color: blue.darken(40%),
      sep-thickness: 0pt,
      align: center
    ),
    frame: (
      title-color: blue.lighten(80%),
      border-color: blue.darken(40%),
      body-color: blue.lighten(90%),
      thickness: (left: 1pt),
      radius: (top-right: 5pt, bottom-right:5pt, rest: 0pt)
    ),
    title: title,
    text,
    ..opts
  )
}
#let DefCounters = state("defs", 0)
#let DefBox(text, ..opts) = {
DefCounters.update(x => x + 1)
let c = context DefCounters.get()
bluebox([Definition ] + c, text, ..opts)
}

#let ExCnts = state("exmples", 0)

#let Examplebox(text, ..opts) = {
ExCnts.update(x => x + 1)
let c = context ExCnts.get()
  showybox(
    title-style: (
      weight: 900,
      color: orange.darken(40%),
      sep-thickness: 0pt,
      align: center
    ),
    frame: (
      title-color: orange.lighten(80%),
      border-color: orange.lighten(40%),
      body-color: orange.lighten(90%),
      thickness: (left: 1pt),
      radius: (top-right: 5pt, bottom-right:5pt, rest: 0pt)
    ),
    title: [Example ] + c,
    text,
    ..opts
  )
}

= Calculus 2
== ODEs (Ordinary Differentiable Equations)

- 1 independant variable $x$
- 1 dependant variable $y$

#Examplebox([
$ y = x y', y = x y' + x^2, m y'' + k y = 0, m y'' + k y = sin x $
])

#DefBox([
ODE: 
$ 
a, b in RR quad [a, b] in RR \
y : [a, b] -> RR \
x |-> y(x) \
"assume" exists y' x y'' x, ..., y^((n))x "on" [a, b] in.rev x \
F : [a, b] times RR times RR^n ->RR \
(F "being good (cont., diff-ble) with respect to each argument") \
F (x, y, y', ..., y^((n))) in RR \
F (x, y(x), y'(x), ..., y^((n))(x)) = 0
$
ODE of order $n$: highest derivative that is in the argument
])

#Examplebox([
=== Radioactive Decay
$ 
frac(d, d "(time)") "(mass)(time)" = "(const < 0)" times "(mass)"lr((("time")), size: #150%) \
y' (x) = - k y(x) \
cal(E) = { y' + k y = 0} \
"Ord = 1, no " x "specifically"
therefore "linear homogenueus"
$
])

#let Func = $F( x, y, y', ..., y^((n)))$

#DefBox([
if in $cal(E) = { Func } = 0$;
LHS in linear in $y, y', ...$;
NB: but maybe NOT linear in $x$
$=> cal(E)$ in linear

$ F = f (x) + a_0 (x) y + a_1 (x) y' + ... $
and if $f (x) equiv 0$ (on $x in [a, b]$) then $cal(E)_("lin")$ is homogeneaus \
else $cal(E)_("lin")$ is inhomogeneaus \
])


#let oy = $overline(y)(x)$
#DefBox([
=== Particular solution
#oy of $cal(E) = {Func = 0}$ on $x in [a, b]$\
if $forall x in [a, b] F( x, oy, oy', ..., oy^((n))) = Phi(x)$ \
if $overline(y)$ turns $F$ into identity

REMARK: General Solution: Finding some/all solutions of $cal(E) = {F = 0}$ is called integration
])
