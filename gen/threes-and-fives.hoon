::  $n: number below which to add multiples of 3 or 5
::
|=  n=@ud
^-  @ud
::  $sum-multiples-below: sum of multiples below a given number
::
=/  sum-multiples-upto
  ::  $n: number whose multiples to sum
  ::  $upto: number up to which to sum
  ::
  |=  [n=@ud upto=@ud]
    ^-  @ud
    ::  $sums-necessary: upper bound for the sum below
    ::
    =/  sums-necessary=@ud  (div upto n)
    ::  sum(k=1 to n) of k == (1/2) * n * (n + 1)
    ::
    (mul n (div (mul sums-necessary +(sums-necessary)) 2))
::  $threes: sum of multiples of 3 below n
::  $fives: sum of multiples of 5 below n
::  $fifteens: sum of multiples of 15 below n
=/  threes    (sum-multiples-upto 3 (dec n))
=/  fives     (sum-multiples-upto 5 (dec n))
=/  fifteens  (sum-multiples-upto 15 (dec n))
(sub (add threes fives) fifteens)
