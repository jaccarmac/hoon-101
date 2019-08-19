:-  %say
::  $eny: entropy with which to seed our rng
::  $x: number of hands to generate
::  $y: number of distinct cards per hand
::
|=  [[* eny=@uvJ *] [x=@ud y=@ud ~] ~]
:-  %noun
^-  (list (list @t))
=<  ?:  (gth (mul x y) 52)
      ~|  %not-enough-cards-in-deck
      !!
    ~[deck]
|%
::  $deck: a deck of cards in list-of-cord form
::
++  deck
  %+  reel
    %+  turn
      suits
      ::  $s: a suit
      ::
      |=  s=@t
        %+  turn
          cards
          ::  $c: a card
          ::
          |=  c=@t
          (crip (weld (trip c) (trip s)))
    ::  $p: the next element from the list of lists above
    ::  $q: the accumulator list
    ::
    |=([p=(list @t) q=(list @t)] (weld p q))
::  $suits: the suits of a standard deck of cards
::
++  suits
  ~['♠' '♥' '♦' '♣']
::  $cards: the cards in each suit of a standard deck
::
++  cards
  ~['A' '2' '3' '4' '5' '6' '7' '8' '9' '10' 'J' 'Q' 'K']
--
