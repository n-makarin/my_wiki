|Lists|

# 1. [#Methods]
# 2. [#Cases]

. |{lng:py}
  | squares = [1, 4, 9, 16, 25]

1.[Methods#] .
# [#append]
# [#extend]
# [#insert]
# [#remove]
# [#pop]
# [#clear]
# [#index]
# [#count]
# [#sort]
# [#reverse]
# [#copy]

* `.append(x)`[append#]
  Add an item to the end of the list
  |{lng:py}
  | squares.append(33)
  | >>> [1, 4, 9, 10, 25, 33]

* `.extend(iterable)`[extend#]
  Extend the list by appending all the items from the iterable
  |{lng:py}
  | squares.extend('abc')
  | >>> [1, 4, 9, 10, 25, 33, 'a', 'b', 'c']

* `.insert(i, x)`[insert#]
  Insert an item at a given position
  |{lng:py}
  | // i - position
  | // x - item
  |
  | squares.insert(1, 'abc')
  | >>> [1, 'abc', 9, 10, 25, 33]

* `.remove(x)`[remove#]
  Remove the first item from the list whose value is equal to x
  |{lng:py}
  | // x - item value
  |
  | squares.remove(9)
  | >>> [1, 4, 10, 25, 33]

* `.pop(i)`[pop#]
  Remove the item at the given position in the list, and return it
  |{lng:py}
  | squares.pop(2)
  | >>> 9
  | >>> [1, 4, 10, 25, 33]

* `.clear()`[clear#]
  Remove all items from the list
  |{lng:py}
  | squares.clear()
  | >>> []
  

* `.index(x, start, end)`[index#]
  Return zero-based index in the list of the first item whose value is equal to x
  |{lng:py}
  | squares.index(9)
  | squares.index(9, 4, 5)
  | >>> 3
  | >>> ValueError: 9 is not in list

* `.count(x)`[count#]
  Return zero-based index in the list of the first item whose value is equal to x
  |{lng:py}
  | squares.count(9)
  | >>> 1

* `.sort(key=None, reverse=False)`[sort#]
  Sort the items of the list in place
  |{lng:py}
  | n_list = [12, 4, 33, 11, 2]
  | n_list.sort()
  |
  | mixed_list = [2, 5, 1, 'a', 'c']
  | mixed_list.sort()
  |
  | str_list = ['g', 'a', 'w']
  | str_list.sort(reverse=True)
  |
  | >>> [2, 4, 11, 12, 33]
  | >>> TypeError: '<' not supported between instances of 'str' and 'int'
  | >>> TypeError: ['w', 'g', 'a']

* `.reverse()`[reverse#]
  Reverse the elements of the list in place
  |{lng:py}
  | squares.reverse()
  | >>> [33, 25, 10, 9, 4, 1]

* `.copy()`[copy#]
  Return a shallow copy of the list. Equivalent to a[:]
  |{lng:py}
  | foo = squares.copy()
  | foo
  | >>> [1, 4, 9, 16, 25]


2.[Cases#] .
. |{lng:py}
  | squares[0]
  | >>> 1
  
. |{lng:py}
  | squares[-1]
  | >>> 25
  
. |{lng:py}
  | squares[-3:]
  | >>> [9, 16, 25]
  
. |{lng:py}
  | squares[:]
  | >>> [1, 4, 9, 16, 25]
  
. |{lng:py}
  | squares + [555, 444, 333]
  | >>> [1, 4, 9, 16, 25, 555, 444, 333]

. |{lng:py}
  | squares[3] = 10
  | >>> [1, 4, 9, 10, 25]

. |{lng:py}
  | squares[2:5] = [11, 22, 33]
  | >>> [1, 4, 11, 22, 33]

. |{lng:py}
  | len(squares)
  | >>> 5

. |{lng:py}
  | a = ['a', 'b', 'c']
  | n = [1, 2, 3]
  | x = [a, n]
  | x
  | >>> [['a', 'b', 'c'], [1, 2, 3]]
