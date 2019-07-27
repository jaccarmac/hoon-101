::  $l: a list of anything
::
|=  l=*
::  $c: counter for how many times to recur into the list
::
=/  c=@ud  1
::  create a recursion point $ over the counter
::
|-
::  if it's not a list
::
?@  l
  ::  then there's no third element
  ::
  ~
::  else if we're deep enough in
::
?:  =(3 c)
  ::  then return this element
  ::
  -:l
::  else recur one level deeper into the tail
::
$(c +(c), l +:l)
