:: Hoon 101: Assignment 3a. Comment each line of code to tell the reader what the code is doing.
:: Comments should be written as "breathing comments" as suggested in the Hoon Style Guide: https://urbit.org/docs/learn/hoon/style/

|=  n=@ud
=/  t=@ud  1
|-
?:  =(n 1)
    t
$(n (dec n), t (mul t n))
