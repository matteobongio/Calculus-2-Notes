#import "@preview/showybox:2.0.1": showybox
#import "@preview/cetz:0.2.2"
#import "@preview/pinit:0.2.0": *

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

#table(columns: (auto, auto, auto, auto, auto),
table.header([], [Stewart], [Demidouich], [Filippou], [Elsholtz]),
[Ode, Direction field], [IX.2], [IX.1 exercise 2704], [1 exercise 1], [I.1],
[Cauchy 1st], [], [IX 2 exercise 2733], [1 exemple 35], [I.6],
[Seperable equidimensional], [IX.3], [IX.3 exercise 2742 \ exercise 2768], [2 exercise 51 \ 4 exercise 101], [I.2 \ I.3],
[Linear variation of constants \ Bernoulli], [IX.5 \ (exercise 27-29)], [5 exerceise 2792 \ + IX.9], [6 exercise 186 \ 9 exercise 301], [I.5]
)

= Lecture 3: Solving 1sr order ODE

== Seperable ODE
#let arrv = $arrow(v)$
#Examplebox([
  $ arrv (x, y) = x (x, y) arrow(e)_x + y (x, y) arrow(e)_y \
    cases(
    arrow.r arrow(e)_x: frac(d x, d t) = x,
    arrow.t arrow(e)_y: frac(d y, d t) = y,
    ) \
    t = "time"
  $
])
1. Express $d("time")$
  $ ""^ast.basic integral d t = integral frac(d x, X(x)) =
  integral frac(d y, Y(y)) } Phi(x, y, "const" = \"C\") = 0 -> y = t(x, "const") $
  $""^ast.basic$ Time to get from start to end point
2. $frac(frac(d y, d t), frac(d x, d t)) = frac(Y(y), X(x)) = frac(d y, d x) = y'(x) } epsilon$

  Steps to solve:
  1. Bring $d x$ and all $x$ left
  2. Bring $d y$ and all $y$ right
  3. Integrate both sides
  4. Do not forget $C$
  In steps 1 and 2, when dividing, we can't divide by 0, do not discard those solutions.
#Examplebox([
  $
    epsilon = {y' = x y^2} \
    frac(d y, d x) = x y^2 quad frac(d y, y^2) = x d x \
    cases(
      y = 0 -> d y = 0 => y = 0 "is a solution",
      y eq.not 0 -> integral frac(d y, y^2) = integral x d x => 1/y = 1/2 x^2 + C
    )
  $
  Inspect if $y = 0$ fits into $y(x; C)$ as a limit case
])

== Equidimensional Euler's scaling homogeneous
#set math.cases(reverse: true)
#columns( [
  $
  cases(
    epsilon = {y' = f(b/x)},
    f(x, y) = f(k x, k y),
    "solving: New" z = frac(y(x), x)
    )
  $
#colbreak()
  $ &y(x) = x z(x)\
  &y'(x) = z + x z' \ 
  &epsilon = {z + x z' = f(z)} ; x z' = f(z) - z
  $
],
gutter: 2%
)
#set math.cases(reverse: false)
$
  cases(
    x = 0 -> epsilon = {z' = frac(f(z) - z, x)},
    f(z) - z = 0 -> {integral frac(d z, f(z) - z) = integral frac(d x, x) = Phi (x, z; C) =>
      z = (x, C) => y (x, C) = x z (x, C)
    }
  )
$

#Examplebox([
  $
    epsilon = {y' = frac(x^2 y^2, 2 x y)} x eq.not 0, y eq.not 0
  $
  Divide both sidees by $x^2$
  $ 
    frac(1 + (y / x)^2, 2 (y/ x)) = frac(1 + z^2, 2z)
  $
])

== Linear ODEs of first order
$
  L[y(z)] = "RHS" (x)
$
L is a polynomial in $d/(d x)$
${a_0 (x) y'(x) + a_1 (x) y (x) = f(x)}$ where $a_0, a_1, f$ are given in $f n$

Suppose $a_0 (x) eq.not forall x in [a, b] subset RR$
$ epsilon = {y' + p(x) y = q(x)} $

#DefBox([
  $epsilon$ is homogeneous if $f = 0 (=> q equiv 0)$
  Else $(f equiv.not 0, q equiv.not 0) ->$ non-homogeneous
  #Examplebox([
    $epsilon = {y' + x^2 y = 0}$ homogeneous, linear 1st order ODE
    if $f equiv 0 or q equiv 0$ the equation is seperable
  ])
])

Extra Exercises
#set enum(numbering: "a)")
+ $(1 + (y')^2 + x^2 y = 0) ->$ Non-linear
+ $b' + x^2 y^2 = 0 ->$ Linear, homogeneous
+ $y' - 2 x y = 1 + x ->$ Linear, non-homogeneous
+ $y' - 2 x y = 1 + y ->$ Linear, non-homogeneous
+ $y' - 2 x y = 1 + x + y^2 ->$ non-linear

= Lecture 4 Linear ODE

+ Method of variation of constsants
  when ord$(epsilon) = n = 1$
  $
    &epsilon = {y' + p(x) y = q(x)}\
    &y(x) = C(x)  underbrace(b_0(x), "c = 1")#pin(1)
  $
  #pinit-point-from(1)["Solution of" epsilon_0 = {"LHS" = 0})]
  #set math.cases(reverse: true)
  $
    "plug" y(x) \
    y' = C'(x) underbrace(b_0, c = 1)  + C underbrace(b'_0, c = 1)\
    y'_0 + p(x) y_0 = 0\
    ("Const" y_0') + p(x) ("Const" y_0) = 0\
    c' y_0 + C (y'_0 + p(x) y_0) = C'(x) y^((c = 1))_0 + C(x) y'_0 + p(x) c(x) y_0 = q(x) \
    cases(
    c'(x) y_0(x) = 1(x) -> "new equation",
    c(x) = integral frac(q(x), y_0(n)) + "const"
    )
    y(x_1, C_1) = [integral frac(q(x), y_0(x)) d x + C_1] y_0(x)
  $
  #set math.cases(reverse: false)
  write down formula of $y_0(x)$
  $
    frac(d y_0, d x) + p(x) y_0 = 0 -> integral frac(d y_0, y_0) = - integral p(x) d x \
    "Express" y_0
  $

  #Examplebox([
    $ epsilon = { y' + 4 x y = 2 x} $
    === Steps
    #set enum(numbering : "1")
    +
      $ 
        y' + 4 x y = 0 \
        cases(
          y != 0 =>
          ln | y | = - 2 x^2 + accent(C, tilde) 
          => y = plus.minus e^(-2x^2) e^(accent(C, tilde))
          ,
          y = 0 => frac(d y, d x) = - 4 x y
            => c = e^epsilon or 0
        )
        "General Solution": y_0 = C e^(-2x^2) 
      $
    + 
      $
        C'(x) e^(-2x^2) = 2x\
        C'(x) = 2x e^(2x^2)\
        "particular solution": C(x) = 1/2 e^(2x^2) + "const"
      $
    +
      $
        "general + particular": y(x, c) = (1/2 e^(2x^2) + "const") e^(-2 x^2) 
        = 1/2 + "const" e^(-2x^2)
      $
  ])
  == Bernouilli equation
    $
      = {y' + p(x) y = q(x) y^n, n in RR}
    $
    - $n = 0 -> "linear non-homogenous"$
    - $n = 1 -> "linear homogenous"$
    - $n in.not {0, 1} -> "non-linear"$
    $
      y = 0 or \
      frac(y', y^n) + p(x) 1/(y^(n-1)) = q(x) <= (1/y^(n-1))' = -(n - 1) y'/y^n \
      1/(-(n - 1)) (1/y^(n - 1))' + p(x) 1/y^(n - 1) = 1(x)\
      "let" z(x) = 1/(y^(n - 1)(x))\
      - 1/(n - 1) z' + p(x) z = 1(x) } "ODE " "ord" = 1 "Linear non-homogeneous"\
      => z(x; "const") => y(x; "const")
    $
  == Ricatti
    $ y' a(x) y + b(x) y^2 = c(x) $
    $ y' = "polynomial degree" = z "in" y(x) "with coeffitient" (x) $
    Generally unsolvable

    Bernouilli: $n = 2 and c(x) = 0$
    If you know/guess 1 solution of $overline(y)(x)$ of Riccati put
    $y = overline(y) (x) + z (x)$ in the Riccati equation $->$ Bernoulli "(z(x))"
  == $n >= 2$ Linear ODE
    $
      a_0 (x) y^n + a_1 (x) y^(n -1) + ... + a_(n - 1) (x) y' + a_n (x) y = f(x)
    $
    where $a_0, ..., a_n$ are known functions. Suppose $a_0(x) != 0, x in [a, b]$
    $
      y^((n)) + alpha_1 (x) y^((n - 1)) + .. + alpha_(n - 1) y' + alpha_n (x) y = B(x)
    $
    #text(weight: "bold")[Def.]
    $
      &f(x) equiv 0 => B = 0 => "homogeneous linear" n^"th" "order ODE"\
      &f(x) equiv.not 0 => B = 0 => "nono-homogeneous linear" n^"th" "order ODE"
    $
    #set enum(numbering : "1")
    + General properties of spaces of solutions of such $epsilon_"lin"$
      Case $f = 0$ (homogeneous)
      + The set of all solutions of $epsilon_"lin"(f equiv 0)$ s a vector space (over $RR$)
        $
          forall y_1, y_2 in L -> k y_1 + lambda y_2 in L
        $
        #showybox(
          title-style: (
            weight: 900,
            color: red.darken(40%),
            sep-thickness: 0pt,
            align: center
          ),
          frame: (
            title-color: gray.lighten(80%),
            border-color: gray.darken(90%),
            body-color: gray.lighten(90%),
            thickness: (left: 0pt),
            radius: (top-right: 5pt, bottom-right:5pt, rest: 5pt)
          ),
          title: "axioms",
          [
            $
            y_1 + y_2 &= y_2 + y_1\
            k(y_1 + y_2) &= k y_1 + k y_2\
            (k + lambda) y_1 &= k y_1 + lambda y_2 \
            (k lambda) y_1 &= k (lambda y_1)
            $
          ]
        )
        $
          cases(
            bold("Def.") "Linearly dependent": C_1 y_1 + ... + C_k y_k = 0 in L
            "for not all" c_i = 0,
            "Linearly independent": sum c_i y_i = 0 -> c_i = 0,
            "dim"(L) = "max number of linearly independent elements",
            bold("Rem.") y_1 (x) "and" y_2(x) "are linearly independent if"
            y_1 (x) = ( "const" != 0 ) y_2 (x)
          )
        $
      + Fundamental theorem about $L$ of #pin(2)$epsilon_"lin" (f equiv 0) } N B (n = 1), forall y_0(x, c) = c "sol"(x) in RR$
      #pinit-point-to(2)[ord $n >= 1$]
      \ \ \
      $forall epsilon_"lin"^n (f = 0)$ has $n$ linearly independent solutions $y_1 (x), ..., y_n(x)$
      $"dim"_RR L = n$

      $bold("Rem.") "In the space of all" f(x), x in [a, b]$
      #set enum(start: 3)
      + The structure of affine space of solutions $"sol"(epsilon_"lin"^n (f != 0))$
        $y(x) = 0 in.not "sol"(epsilon(f != 0))$
        $y(x) = y_*(x) + y_0(x, C_1, ..., c_n)$
      




