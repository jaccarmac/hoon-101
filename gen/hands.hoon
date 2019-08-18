::  todo: take $x and $y (both @ud), produce a list of x lists (hands) of y
::  distinct cards from a standard 52 card deck. should be a %say generator
:-  %say
|=  [[* eny=@uvJ *] [x=@ud y=@ud ~] ~]
:-  %noun
^-  (list (list @t))
=<  ?:  (gth (mul x y) 52)
      ~|  %not-enough-cards-in-deck
      !!
    ~[~['hand' 'one' '♣'] ~['hand' 'two' '♣']]
|%
++  deck
  :~  '♠'
      '♥'
      '♦'
      '♣'
  ==
--
