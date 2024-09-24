#import "@preview/showybox:2.0.1": showybox
#import "@preview/cetz:0.2.2"

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

#let TheoremCnts = state("theorems", 0)
#let TheoremBox(title, text, ..opts) = {
  TheoremCnts.update(x => x + 1)
  let c = context TheoremCnts.get()
  showybox(
    title-style: (
      weight: 900,
      color: green.darken(40%),
      sep-thickness: 0pt,
      align: center
    ),
    frame: (
      title-color: green.lighten(80%),
      border-color: green.darken(40%),
      body-color: green.lighten(90%),
      thickness: (left: 1pt),
      radius: (top-right: 5pt, bottom-right:5pt, rest: 0pt)
    ),
    title: [Theorem ] + c+ [: ] + title,
    text,
    ..opts
  )
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

#Examplebox([
$
cal(E) = {y' - 3x^2 = 0}\
y' = 3x^2 \
therefore y = x^3 + C \
forall C, "it is a solution of " cal(E)
$
])

#DefBox([
  Integral curve (for $Epsilon$) is the graph ${x, y(x)}, x in [a, b]$ of a particular solution

  NB $[a, b]$ can depend on $y(x)$

  $x d x + y d y = 0$
  #cetz.canvas({
  import cetz.draw: *
  // Your drawing code goes here
  circle((0, 0), radius: .5)
  circle((0, 0), radius: .75)
  circle((0, 0), radius: 1)
  line((-1.5, 0), (1.5, 0))
  line((0, -1.5), (0, 1.5))
  })
])

#Examplebox([
  $ y(x) = x + C, x in RR, C in RR $

  incline depends on the constant

  Whatever point $(x_0, y_0)$ we have, there will be an integral curve passing through it.
  #cetz.canvas({
    import cetz.plot
    plot.plot(size: (2, 2), axis-style: none, {
      plot.add(domain: (0, 2*calc.pi), (x) => x)
      plot.add(domain: (0, 2*calc.pi), (x) => x + 1)
      plot.add(domain: (0, 2*calc.pi), (x) => x - 1)
    })
  })
])

#Examplebox([
  $ y frac(d y, d x) + x = 0 $
])

#Examplebox([
  *Blow-up Equation*
  $ Epsilon_2 = { y ' = y^2 } $
  To solve: $y(x; C)$
  
  ? Do all solutions exist over all $x in RR$
])

#DefBox([
  Given $Epsilon = { F = 0}$ of order $n>= 1$

  - Initial Condition(s) ${x = x_0, x in RR and y(x_0) = y_0, y in RR}$
  (Cauchy datum/ data)

  The number of conditions is $\# n = "ord"(Epsilon)$
  $
  cases(
    n = 1 => F(x, y, y') = 0,
    n > 1 => F_(n > 1)(x, y, y', ..., y^((n))) = 0,
    y'(x_0) = y_0 \, y_0\,...\, y^(n - 1) in RR quad y''(x_0) = y_0^2 ...
  )
  $
  
  - Boundry Condition(s)

  $
    >= \# n
   cases(
    cases(
      A attach(\, , t: eq.not) B\, ... in RR supset.eq [a, b],
      y(A) = Y_A \, y(B) = Y_B \, ...
    ),
    "It can be that"&\
    &y'(A) = Y_A^((1))\
    &y'(B) = Y_B^((1)) \
    &dots.v
   )
  $
  #cetz.canvas({
    import cetz.plot
    plot.plot(size: (2, 2), x-min: 0, y-min:0, axis-style: "school-book",
    x-ticks: ((3.2, [a]), (4, [b])), 
    x-tick-step: none, 
    y-tick-step: none,
    {
      //TODO add y_A and y_B at the ends of the func
      plot.add(domain: (3.2, 4), (x) => calc.sin(2*x))
    })
  })
])

#Examplebox([
  $Epsilon = { y'' = 6x}$
  1. $y(0) = 1, y'(0) = -2$ ? Find $C_1, C_2$
      $overline(y)(x) = ... $
  2. $y(0) = 1, y(1) = 2$ ? Find $C_1, C_2$
      $overline(y)(x) = ...$
  General solution: $y(x) = x^3 + C_1 x + c_2$
])

#DefBox([
  *Cauchy problem* (initial value problem) for $Epsilon$

  $Epsilon = {F(x, y, y', ..., y^n) = 0}$
  $
  "and the number of initial condition(s)"
  &{y(x_0) = y_0, y'(x_0) = y_0^((1))}\
  &quad quad quad quad dots.v\
  &{y^((n-1))(x_0) = y_0^((n-1))}
  $

  ?: To find a particular solution
  $y=y(x; x_0, y_0, y_0^((1)), ..., y_0^((n-1)))$ for $x in [a,b] in.rev x_0$
])

#DefBox([
  $Epsilon = { y' = y(x, y)} <-$ ODE resolved with respect to the derivative
  #Examplebox([
    $Epsilon = {y = y'}$

    non-example $x y' = y$
  ])

  *Cauchy Problem*: ${y' = f(x, y); y(x_0) = y_0}$
  
  The geometric sense of (the preocess of) soluiton of Cauchy problem

  1. Consider in $O_(x b) subset D = { (x, y) | "right hand side is defined"}$
  2. At $forall x, y in D$ attach vector 
    ${1; f(x, y)} = accent(v, arrow) (x, y) = {frac(d x, d x), frac(d y, d x)}$ 
    (the vector field of inclines)
  
  *Solving Cauchy problem* $<=>$ find the integral trajectories passing through $(x_0, y_0)$

  Range of $C in RR$ gives us the range of $y_0^("new") in RR$ near out initially taken $y_0$

  claim: integration constants parametrize Cauchy data over $x_0$

  #Examplebox([
    $
      y' = y; y = C e^x\
      cases(
        y = e^(x - c) > 0,
        - e^(x- c) < 0,
        y = 0
      )
    $
    Kinda TODO: improve
    #cetz.canvas({
      import cetz.plot
      plot.plot(size: (2, 2), axis-style: "school-book",
      x-tick-step: none, 
      y-tick-step: none,
      {
        plot.add(domain: (-4, 4), (x) => calc.pow(2, x))
        plot.add(domain: (-4, 4), (x) => calc.pow(2, x - 1))
        plot.add(domain: (-4, 4), (x) => calc.pow(2, x - 2))
        plot.add(domain: (-4, 4), (x) => calc.pow(2, x + 1))
        plot.add(domain: (-4, 4), (x) => -calc.pow(2, x))
        plot.add(domain: (-4, 4), (x) => -calc.pow(2, x - 1))
        plot.add(domain: (-4, 4), (x) => -calc.pow(2, x + 1))
        plot.add(domain: (-4, 4), (x) => -calc.pow(2, x - 2))
      })
    })
  ])
  *Conclusion:* Finding the general solution means finding a family of integral curves\
  $y = y(x; C)$. It means finding the description $Phi (x, y; C) = 0$ of the integral curves.
])

#TheoremBox("Cauchy-Koualeska", [
  If RHS of $f(x, y)$ is constant at $forall x,y in D subset.eq circle_(x y)$ and is the dependence
  if $f$ on $y$ is good (e.g. $exists$ continous 
  $frac(diff y, diff x) => forall$ inner points $(x_0, y_0) in D$,
  $exists$ a unique $y = y(x; x_0, y_0))$ of ${y'f(x, y), y(x_0) = y_0}$ for $x$ near $x_0$.
  Moreover, this integer curve does extend up to the boundry $diff D$.
])

