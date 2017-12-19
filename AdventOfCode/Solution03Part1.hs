module AdventOfCode.Solution03Part1 (solution) where

-- Self explanatory.
-- (See end of file for explanation.)
distance :: Integer -> Integer
distance 0 = 0
distance i =
  s + (abs $ s - 1 - ((i - 1) `mod` (2*s)))
  where
  s = toInteger $ ceiling $ ((sqrt $ fromInteger $ i + 1) - 1)/2

solution :: Integer -> Integer
solution i = distance $ i - 1

{-
'distance i' is the manhattan distance of the i'th number in the spiral.
Note that we start our indices at 0, not 1.

A derivation follows.

'distance 0' is 0, so assume i > 0 in the following.

One interesting number is the "shell index" at i -- the index of the "ring" passing trough i.
We would like the shell index as a function of i.
Note that the number of cells with shell index less than or equal to s is (2*s + 1)^2.
In other words, the last index of a shell, i, satisfies
i = (2*s + 1)^2 - 1
This is a quadratic equation in s, which has one positive and a negative solution for i >= 0.
We're of course only interested in the positive one:
s = ((sqrt (i + 1)) - 1)/2
Note that this isn't exactly the number we wanted. s has the correct (integer) values at the last cells in each shell,
but in between it can take on fractional values.
We take the ceiling in order to arrive at the expression
s = ceiling (((sqrt (i + 1)) - 1)/2)

Let's say a shell can be thought of as made up of 4 edges of equal length.
In the picture below, the three first shells are shown. The letters a, b, c, and d are used to mark out which cell
belongs to which edge.

    bbbbbba
    cbbbbaa
    ccbbaaa
    ccc*aaa
    cccddaa
    ccdddda
    cdddddd

note that the manhattan distance repeats exactly the same on each edge of a shell.

we're therefore only really interested in the index along whatever edge the cell happens to be in.
to derive this, note that the index at the first cell in a shell is
j = (2*s-1)^2
the index of a cell rel1ative to the start of it's shell is therefore i - j.

Note that the edges of shell s have length 2*s.
Therefore, the index along the edge of cell i is:
k = (i - j) ´mod´ (2*s)

Now notice that the manhattan distance in the first cell on edges on shell s is:
d = 2*s - 1

Now consider how this value changes as we move along the edge.
The minimum manhattan distance on shell s is just the same as the shell index, s.
As we move along an edge, the manhattan distance start out at d, as we saw.
It will then decrease in steps of one, until it hits s. After this, it will increase in steps of one.
The following expression encapsulates the described behavior:

distance i = s + abs(d - k - s)

That, finally, is our formula!
-}
