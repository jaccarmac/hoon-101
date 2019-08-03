::  $n: number below which to add multiples of 3 or 5
::
|=  n=@ud
^-  @ud
::  $m: number which goes from 1 to n
::  $total: running total of the sum of multiples
::
=/  m=@ud      1
=/  total=@ud  0
|-
?:  =(n m)
  total
?:  |(=(0 (mod m 3)) =(0 (mod m 5)))
  $(total (add total m), m +(m))
$(m +(m))
