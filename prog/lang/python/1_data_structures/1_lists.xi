|Lists|

* 1. [#Methods]
* 2. [#Cases]
* 3. [#Using Lists as Stacks]
* 4. [#Using Lists as Queues]
* 5. [#List Comprehensions]
* 6. [#Nested List Comprehensions]
* 7. [#The del statement]

. `References:`
  [https://docs.python.org/3/tutorial/datastructures.html#more-on-lists]

. |{lng:py}
  | squares = [1, 4, 9, 16, 25]

1.[Methods#] .
* [#append]
* [#extend]
* [#insert]
* [#remove]
* [#pop]
* [#clear]
* [#index]
* [#count]
* [#sort]
* [#reverse]
* [#copy]

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

3.[Using Lists as Stacks#] .
. |{lng:py}
| stack = [3, 4, 5]
| stack.append(6)
| stack.append(7)
| stack.pop()
| stack.pop()
| >>> [3, 4, 5]

4.[Using Lists as Queues#] .
. To implement a queue, use `collections.deque` which was designed 
  to have fast appends and pops from both ends
  [https://docs.python.org/3/library/collections.html#collections.deque]

. |{lng:py}
| from collections import deque
| queue = deque(["Eric", "John", "Michael"])
| queue.append("Terry")
| queue.append("Graham")
| queue.popleft() 
| >>> 'Eric'
| queue.popleft() 
| >>> 'John'
| queue
| >>> deque(['Michael', 'Terry', 'Graham'])

5.[List Comprehensions#] .
. List comprehensions provide a concise way to create lists.

. Create list with decimal values
  |{lng:py}
  | squares = [x**2 for x in range(10)]
  | >>> [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

. Create a new list with the values doubled
  |{lng:py}
  | vec = [-4, -2, 0, 2, 4]
  | [x*2 for x in vec]
  | >>> [-8, -4, 0, 4, 8]

. Filter the list to exclude negative numbers
  |{lng:py}
  | vec = [-4, -2, 0, 2, 4]
  | [x for x in vec if x >= 0]
  | >>> [0, 2, 4]

. Call a method on each element
  |{lng:py}
  | freshfruit = ['  banana', '  loganberry ', 'passion fruit  ']
  | [weapon.strip() for weapon in freshfruit]
  | >>> ['banana', 'loganberry', 'passion fruit']

. Create a list of 2-tuples like
  |{lng:py}
  | [(x, x**2) for x in range(6)]
  | >>> [(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25)]

. Flatten a list using a listcomp with two 'for'
  |{lng:py}
  | vec = [[1,2,3], [4,5,6], [7,8,9]]
  | [num for elem in vec for num in elem]
  | >>> [1, 2, 3, 4, 5, 6, 7, 8, 9]

6.[Nested List Comprehensions#] .

. Transpose rows and columns
  |{lng:py}
  | matrix = [
  |     [1, 2, 3, 4],
  |     [5, 6, 7, 8],
  |     [9, 10, 11, 12],
  | ]
  | [[row[i] for row in matrix] for i in range(4)]
  | >>> [[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]

. The result above can be given with built-in function
  |{lng:py}
  | list(zip(*matrix))
  | >>> [(1, 5, 9), (2, 6, 10), (3, 7, 11), (4, 8, 12)]

7.[The del statement#] .

. Remove slices from a list
  |{lng:py}
  | a = [-1, 1, 66.25, 333, 333, 1234.5]
  | del a[0]
  | del a[2:4]
  | >>> [1, 66.25, 1234.5]

. Delete entire variable
  |{lng:py}
  | del a
  | a
  | >>> NameError: name 'a' is not defined