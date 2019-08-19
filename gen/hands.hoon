:-  %say
::  $eny: entropy with which to seed our rng
::  $x: number of hands to generate
::  $y: number of distinct cards per hand
::
|=  [[* eny=@uvJ *] [x=@ud y=@ud ~] ~]
:-  %noun
^-  (list (list @t))
::  $total: total number of cards to deal
::
=<  =/  total  (mul x y)
    ?:  (gth total 52)
      ~|  %not-enough-cards-in-deck
      !!
    (deal x (scag total (shuffled-deck eny)))
|%
::  $deal: divide cards among a certain number of players
::
++  deal
  ::  $p: number of players
  ::  $deck: deck to deal from
  ::
  |=  [p=@ud deck=(list @t)]
  ^-  (list (list @t))
  ::  $hands: hands of cards of the players
  ::  $idxs: indexes used to deal to the players, 0 through (p - 1)
  ::
  =/  hands=(list (list @t))  (reap p ~)
  =/  idxs=(list @ud)         (gulf 0 (dec p))
  |-  ^-  (list (list @t))
  ?:  ?=(~ deck)
    hands
  ::  $i: index of card and hand to combine
  ::
  =.  hands  (turn idxs |=(i=@ud (snoc (snag i hands) (snag i deck))))
  =.  deck   (slag +(p) deck)
  $
::  $shuffled-deck: a deck of cards shuffled using fisher-yates
::
++  shuffled-deck
  ::  $eny: seed for the shuffle
  ::
  |=  eny=@uvJ
  ^-  (list @t)
  ::  $rng: random number generator state
  ::  $shuffled: ordered deck at the beginning, shuffled at the end
  ::  $swap: index of the next element to swap
  ::
  =/  rng                 ~(. og eny)
  =/  shuffled=(list @t)  deck
  =/  swap=@ud            (dec (lent shuffled))
  |-  ^-  (list @t)
  ?:  =(0 swap)
    shuffled
  ::  $dest: index to swap the element at swap with
  ::
  =^  dest  rng  (rads:rng +(swap))
  ?:  =(swap dest)
    $(swap (dec swap))
  ::  $before: elements before dest
  ::  $swap-elt: element at swap, inserted at dest
  ::  $between: elements between dest and swap
  ::  $dest-elt: element at dest, inserted at swap
  ::  $after: elements after swap
  ::
  =/  before    (scag dest shuffled)
  =/  swap-elt  (snag swap shuffled)
  =/  between   (slag +(dest) (scag swap shuffled))
  =/  dest-elt  (snag dest shuffled)
  =/  after     (slag +(swap) shuffled)
  =.  shuffled
    (weld (snoc before swap-elt) (weld (snoc between dest-elt) after))
  $(swap (dec swap))
::  $deck: a deck of cards in list-of-cord form
::
++  deck
  ^-  (list @t)
  %+  reel
    ::  $s: a suit
    ::  $c: a card
    ::
    (turn suits |=(s=@t (turn cards |=(c=@t (crip (weld (trip c) (trip s)))))))
  ::  $p: the next element from the list of lists above
  ::  $q: the accumulator list
  ::
  |=([p=(list @t) q=(list @t)] (weld p q))
::  $suits: the suits of a standard deck of cards
::
++  suits
  ^-  (list @t)
  ~['♠' '♥' '♦' '♣']
::  $cards: the cards in each suit of a standard deck
::
++  cards
  ^-  (list @t)
  ~['A' '2' '3' '4' '5' '6' '7' '8' '9' '10' 'J' 'Q' 'K']
--
