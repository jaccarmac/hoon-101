::  $n: number to attempt to disprove the goldbach conjecture with
::
|=  n=@
::  return the result of the goldbach arm defined in the core below
::
=<  (goldbach n)
::  create a core with the arms we need
::
|%
::  create an arm
::
::  $prime: check if a number is prime
::
++  prime
  ::  $n: a number to check the primeness of
  ::
  |=  n=@
  ::  this arm will return a boolean
  ::
  ^-  ?
  ::  if n is less than 2 it cannot be prime
  ::
  ?:  (lth n 2)  |
  ::  else if n is less than 4 it is always prime
  ::
  ?:  (lth n 4)  &
  ::  else prepare to try numbers to determine primeness
  ::
  ::  $i: possible prime factor, incremented as necessary then reset to 2
  ::
  =/  i=@  2
  ::  $j: another possible prime factor, increments until it is half of n
  ::
  =/  j=@  2
  ::  create a recursion point which will eventually result in a boolean
  ::
  |-  ^-  ?
  ::  if n is a product of i and j it is not prime
  ::
  ?:  =((mul i j) n)  |
  ::  else if j has reached half of n then n is prime
  ::
  ?:  =(j (div n 2))  &
  ::  else if i times j is greater than n
  ::
  ?:  (gth (mul i j) n)
    ::  then reset i to 2 and try with a bigger j
    ::
    $(i 2, j +(j))
  ::  else try with a bigger i
  ::
  $(i +(i))
::  create an arm
::
::  $goldbach: try to disprove the goldbach conjecture
::
++  goldbach
  ::  $n: a number to try to express as the sum of primes
  ::
  |=  n=@
  ::  this arm returns either a boolean or a cell which contains a pair of
  ::  numbers and a boolean
  ::
  ^-  ?(? [[@ @] ?])
  ::  if n is less than 4 or n is odd the conjecture does not apply: return %.n
  ::
  ?:  |((lth n 4) =((mod n 2) 1))  |
  ::  else prepare to try all possible sums to see which is a pair of primes
  ::
  ::  $i: possible prime component, increments until it is two less than n
  ::
  =/  i=@  2
  ::  $j: another possible prime component, decrements until it is 2
  ::
  =/  j=@  (sub n 2)
  ::  create a recursion point which will eventually result in the same return
  ::  type as the arm
  ::
  |-  ^-  ?(? [[@ @] ?])
  ::  if i and j are primes, n is not a counterexample, return %.n and the
  ::  evidence
  ::
  ?:  &((prime i) (prime j))  [[i j] |]
  ::  else if i is n - 2 and j is 2, n is a counterexample!
  ::
  ?:  =((add 2 i) n)  &
  ::  else increment i and decrement j and try those components
  ::
  $(i +(i), j (dec j))
  ::  end the core
  ::
--
