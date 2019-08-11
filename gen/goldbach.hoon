|=  n=@
=<  (goldbach n)
|%
++  prime
  |=  n=@
  ^-  ?
  ?:  (lth n 2)  |
  ?:  (lth n 4)  &
  =/  i=@  2
  =/  j=@  2
  |-  ^-  ?
  ?:  =((mul i j) n)  |
  ?:  =(j (div n 2))  &
  ?:  (gth (mul i j) n)
    $(i 2, j +(j))
  $(i +(i))
++  goldbach
  |=  n=@
  ^-  ?(? [[@ @] ?])
  ?:  |((lth n 4) =((mod n 2) 1))  |
  =/  i=@  2
  =/  j=@  (sub n 2)
  |-  ^-  ?(? [[@ @] ?])
  ?:  &((prime i) (prime j))  [[i j] |]
  ?:  =((add 2 i) n)  &
  $(i +(i), j (dec j))
--