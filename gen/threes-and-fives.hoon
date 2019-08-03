::  $n: number below which to add multiples of 3 or 5
::
|=  n=@ud
^-  @ud
::  $sum-multiples-below: sum of multiples below a given number
::
=/  sum-multiples-below
  ::  $n: number whose multiples to sum
  ::  $below: number below which to sum
  ::
  |=  [n=@ud below=@ud]
    ::  $m: number currently being added
    ::  $total: running total
    ::
    =/  m=@ud      n
    =/  total=@ud  0
    |-
    ?:  (lte below m)
      total
    $(m (add m n), total (add total m))
::  $threes: sum of multiples of 3 below n
::  $fives: sum of multiples of 5 below n
::  $fifteens: sum of multiples of 15 below n
=/  threes    (sum-multiples-below 3 n)
=/  fives     (sum-multiples-below 5 n)
=/  fifteens  (sum-multiples-below 15 n)
(sub (add threes fives) fifteens)
