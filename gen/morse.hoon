::  $raw: a message to translate
::
|=  raw=tape
=<  (convert raw)
|%
::  $convert: convert a message into morse code
::
++  convert
  ::  $msg: the message to convert
  ::
  |=  msg=tape
  ^-  tape
  ::  $chart: to pull translations by key
  ::
  =/  chart  ~(got by table)
  (spacify (turn (clean msg) chart))
::  $spacify: add spaces between elements of a tape
::
++  spacify
  ::  $in: input tape
  ::
  |=  in=tape
  ^-  tape
  ::  $out: tape with spaces between elements of in
  ::
  =/  out=tape  ""
  |-  ^-  tape
  ?:  ?=(~ in)
    ?:  ?=(~ out)
      out
    ::  $s: out with the last element trimmed off
    ::
    =/  s  (trim (dec (lent out)) out)
    p.s
  $(out (weld out ~[i.in ' ']), in t.in)
::  $clean: clean up a tape for morse code translation
::
++  clean
  ::  $in: input tape
  ::
  |=  in=tape
  ^-  tape
  =.  in  (cuss in)
  ::  $key-exists: to check key existence
  ::  $out: output tape with existing key chars
  ::
  =/  key-exists    ~(has by table)
  =/  out=tape      ""
  |-  ^-  tape
  ?:  ?=(~ in)
    out
  ::  $new-out:  tape with next char if it exists in table
  ::
  =/  new-out=tape  ?:((key-exists i.in) (weld out ~[i.in]) out)
  $(out new-out, in t.in)
::  $table: morse code translation table
::
++  table
  %-  my
  :~  :-  'A'  '.-'
      :-  'B'  '-...'
      :-  'C'  '-.-.'
      :-  'D'  '-..'
      :-  'E'  '.'
      :-  'F'  '..-.'
      :-  'G'  '--.'
      :-  'H'  '....'
      :-  'I'  '..'
      :-  'J'  '.---'
      :-  'K'  '-.-'
      :-  'L'  '.-..'
      :-  'M'  '--'
      :-  'N'  '-.'
      :-  'O'  '---'
      :-  'P'  '.--.'
      :-  'Q'  '--.-'
      :-  'R'  '.-.'
      :-  'S'  '...'
      :-  'T'  '-'
      :-  'U'  '..-'
      :-  'V'  '...-'
      :-  'W'  '.--'
      :-  'X'  '-..-'
      :-  'Y'  '-.--'
      :-  'Z'  '--..'
      :-  '0'  '-----'
      :-  '1'  '.----'
      :-  '2'  '..---'
      :-  '3'  '...--'
      :-  '4'  '....-'
      :-  '5'  '.....'
      :-  '6'  '-....'
      :-  '7'  '--...'
      :-  '8'  '---..'
      :-  '9'  '----.'
  ==
--
