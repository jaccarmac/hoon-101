::  $n: number to calculate the factorial of
::
|=  n=@ud
::  $t: accumulator: used repeatedly in multiplication
::
=/  t=@ud  1
::  create a recursion point $ closing over t, then call it
::
|-
::  if we're calculating the factorial of 1
::
?:  =(n 1)
    ::  then just return the accumulated value
    ::
    t
::  else calculate a smaller factorial after multiplying n and t
::
$(n (dec n), t (mul t n))
