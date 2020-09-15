|Tuples and Sequences|

. {lng:py}
  | t = 12345, 54321, 'hello!'
  | t[0]
  | >>> 12345
  | t 
  | >>> (12345, 54321, 'hello!')

. Tuples can contain mutable objects:
  {lng:py}
  | v = [1, 2, 3], [3, 2, 1]
  | v[0].pop()
  | 3
  | v
  | >>> ([1, 2], [5, 6, 7])

. Tuples can contain objects with different data types:
  {lng:py}
  | r = 'foo', 333, [33,3,3]
  | >>> ('sdfs', 333, [33, 3, 3])

. Containing 0 or 1 items:
  {lng:py}
  | empty = ()
  | singleton = 'hello',    # <-- note trailing comma
  | letn(empty)
  | singleton(empty)
  | >>> 0
  | >>> 1

. Unpacking:
  {lng:py}
  | t = 12345, 54321, 'hello!'
  | x, y, z = t
  | x
  | >>> 12345