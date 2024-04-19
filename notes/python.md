Stand 17. März 2024 (Alt: Python3.6)

- [IMPORTS](#imports)
  - [generic import of math module](#generic-import-of-math-module)
  - [import a function](#import-a-function)
  - [import multiple functions at once](#import-multiple-functions-at-once)
  - [import all functions in a module (generally discouraged)](#import-all-functions-in-a-module-generally-discouraged)
  - [define an alias](#define-an-alias)
  - [show all functions in math module](#show-all-functions-in-math-module)
- [DATA TYPES](#data-types)
  - [determine the type of an object](#determine-the-type-of-an-object)
  - [check if an object is of a given type](#check-if-an-object-is-of-a-given-type)
  - [convert an object to a given type](#convert-an-object-to-a-given-type)
  - [zero, None, and empty containers are converted to False](#zero-none-and-empty-containers-are-converted-to-false)
  - [non-empty containers and non-zeros are converted to True](#non-empty-containers-and-non-zeros-are-converted-to-true)
- [MATH](#math)
  - [basic operations](#basic-operations)
  - [force '/' in Python 2](#force-in-python-2)
- [COMPARISONS AND BOOLEAN OPERATIONS](#comparisons-and-boolean-operations)
  - [assignment statement](#assignment-statement)
  - [comparisons (these return True)](#comparisons-these-return-true)
  - [boolean operations (these return True)](#boolean-operations-these-return-true)
- [CONDITIONAL STATEMENTS](#conditional-statements)
  - [if statement](#if-statement)
  - [if/else statement](#ifelse-statement)
  - [if/elif/else statement](#ifelifelse-statement)
  - [single-line if statement (sometimes discouraged)](#single-line-if-statement-sometimes-discouraged)
  - [single-line if/else statement (sometimes discouraged)](#single-line-ifelse-statement-sometimes-discouraged)
- [LISTS](#lists)
  - [create an empty list (two ways)](#create-an-empty-list-two-ways)
  - [create a list](#create-a-list)
  - [examine a list](#examine-a-list)
  - [modify a list (does not return the list)](#modify-a-list-does-not-return-the-list)
  - [concatenate lists (slower than 'extend' method)](#concatenate-lists-slower-than-extend-method)
  - [find elements in a list](#find-elements-in-a-list)
  - [list slicing [start:end:step]](#list-slicing-start-end-step)
  - [alternative method for returning the list backwards](#alternative-method-for-returning-the-list-backwards)
  - [sort a list in place (modifies but does not return the list)](#sort-a-list-in-place-modifies-but-does-not-return-the-list)
  - [return a sorted list (does not modify the original list)](#return-a-sorted-list-does-not-modify-the-original-list)
  - [insert into an already sorted list, and keep it sorted](#insert-into-an-already-sorted-list-and-keep-it-sorted)
  - [create a second reference to the same list](#create-a-second-reference-to-the-same-list)
  - [copy a list (two ways)](#copy-a-list-two-ways)
  - [examine objects](#examine-objects)
- [TUPLES](#tuples)
  - [create a tuple](#create-a-tuple)
  - [examine a tuple](#examine-a-tuple)
  - [concatenate tuples](#concatenate-tuples)
  - [create a single tuple with elements repeated (also works with lists)](#create-a-single-tuple-with-elements-repeated-also-works-with-lists)
  - [sort a list of tuples](#sort-a-list-of-tuples)
  - [tuple unpacking](#tuple-unpacking)
- [STRINGS](#strings)
  - [create a string](#create-a-string)
  - [examine a string](#examine-a-string)
  - [string slicing is like list slicing](#string-slicing-is-like-list-slicing)
  - [basic string methods (does not modify the original string)](#basic-string-methods-does-not-modify-the-original-string)
  - [split a string into a list of substrings separated by a delimiter](#split-a-string-into-a-list-of-substrings-separated-by-a-delimiter)
  - [join a list of strings into one string using a delimiter](#join-a-list-of-strings-into-one-string-using-a-delimiter)
  - [concatenate strings](#concatenate-strings)
  - [remove whitespace from start and end of a string](#remove-whitespace-from-start-and-end-of-a-string)
  - [string substitutions: all of these return 'raining cats and dogs'](#string-substitutions-all-of-these-return-raining-cats-and-dogs)
  - [string formatting](#string-formatting)
  - [normal strings versus raw strings](#normal-strings-versus-raw-strings)
- [DICTIONARIES](#dictionaries)
  - [create an empty dictionary (two ways)](#create-an-empty-dictionary-two-ways)
  - [create a dictionary (two ways)](#create-a-dictionary-two-ways)
  - [convert a list of tuples into a dictionary](#convert-a-list-of-tuples-into-a-dictionary)
  - [examine a dictionary](#examine-a-dictionary)
  - [returns a list (Python 2) or an iterable view (Python 3)](#returns-a-list-python-2-or-an-iterable-view-python-3)
  - [modify a dictionary (does not return the dictionary)](#modify-a-dictionary-does-not-return-the-dictionary)
  - [access values more safely with 'get'](#access-values-more-safely-with-get)
  - [access a list element within a dictionary](#access-a-list-element-within-a-dictionary)
  - [string substitution using a dictionary](#string-substitution-using-a-dictionary)
- [SETS](#sets)
  - [create an empty set](#create-an-empty-set)
  - [create a set](#create-a-set)
  - [examine a set](#examine-a-set)
  - [set operations](#set-operations)
  - [modify a set (does not return the set)](#modify-a-set-does-not-return-the-set)
  - [get a sorted list of unique elements from a list](#get-a-sorted-list-of-unique-elements-from-a-list)
- [DEFINING FUNCTIONS](#defining-functions)
  - [define a function with no arguments and no return values](#define-a-function-with-no-arguments-and-no-return-values)
  - [define a function with one argument and no return values](#define-a-function-with-one-argument-and-no-return-values)
  - [define a function with one argument and one return value](#define-a-function-with-one-argument-and-one-return-value)
  - [include an optional docstring to describe the effect of a function](#include-an-optional-docstring-to-describe-the-effect-of-a-function)
  - [define a function with two 'positional arguments'](#define-a-function-with-two-positional-arguments)
  - [use 'pass' as a placeholder](#use-pass-as-a-placeholder)
  - [return two values from a single function](#return-two-values-from-a-single-function)
- [ANONYMOUS (LAMBDA) FUNCTIONS](#anonymous-lambda-functions)
- [FOR LOOPS AND WHILE LOOPS](#for-loops-and-while-loops)
  - [range returns a list of integers](#range-returns-a-list-of-integers)
  - [for loop (not the recommended style)](#for-loop-not-the-recommended-style)
  - [for loop (recommended style)](#for-loop-recommended-style)
  - [iterate through two things at once (using tuple unpacking)](#iterate-through-two-things-at-once-using-tuple-unpacking)
  - [use enumerate if you need to access the index value within the loop](#use-enumerate-if-you-need-to-access-the-index-value-within-the-loop)
  - [for/else loop](#forelse-loop)
  - [while loop](#while-loop)
- [COMPREHENSIONS](#comprehensions)
  - [for loop to create a list of cubes](#for-loop-to-create-a-list-of-cubes)
  - [equivalent list comprehension](#equivalent-list-comprehension)
  - [for loop to create a list of cubes of even numbers](#for-loop-to-create-a-list-of-cubes-of-even-numbers)
  - [equivalent list comprehension](#equivalent-list-comprehension)
  - [for loop to cube even numbers and square odd numbers](#for-loop-to-cube-even-numbers-and-square-odd-numbers)
  - [equivalent list comprehension (using a ternary expression)](#equivalent-list-comprehension-using-a-ternary-expression)
  - [for loop to flatten a 2d-matrix](#for-loop-to-flatten-a-2d-matrix)
  - [equivalent list comprehension](#equivalent-list-comprehension)
  - [set comprehension](#set-comprehension)
  - [dictionary comprehension](#dictionary-comprehension)
- [MAP](#map)
  - [equivalent list comprehensions](#equivalent-list-comprehensions)
- [FILTER](#filter)
  - [equivalent list comprehension](#equivalent-list-comprehension)
- [TRY](#try)
- [Python Built-in Exceptions:](#python-built-in-exceptions)

# IMPORTS

## generic import of math module
```python
import math
math.sqrt(25)
```

## import a function
```python
from math import sqrt
sqrt(25)  # no longer have to reference the module
```

## import multiple functions at once
```Python
from math import cos, floor
```

## import all functions in a module (generally discouraged)
```python
from csv import *
```

## define an alias
```python
import datetime as dt
```

## show all functions in math module
```python
dir(math)
```

# DATA TYPES

## determine the type of an object
```python
type(2)  # returns 'int'
type(2.0)  # returns 'float'
type('two')  # returns 'str'
type(True)  # returns 'bool'
type(None)  # returns 'NoneType'
```

## check if an object is of a given type
```python
isinstance(2.0, int)  # returns False
isinstance(2.0, (int, float))  # returns True
```

## convert an object to a given type
```python
float(2)
int(2.9)
str(2.9)
```

## zero, None, and empty containers are converted to False
```python
bool(0)
bool(None)
bool('')  # empty string
bool([])  # empty list
bool({})  # empty dictionary
```

## non-empty containers and non-zeros are converted to True
```python
bool(2)
bool('two')
bool([2])
```

# MATH

## basic operations
```python
10 + 4  # add (returns 14)
10 - 4  # subtract (returns 6)
10 * 4  # multiply (returns 40)
10**4  # exponent (returns 10000)
5 % 4  # modulo (returns 1) - computes the remainder
10 / 4  # divide (returns 2 in Python 2, returns 2.5 in Python 3)
10 / float(4)  # divide (returns 2.5)
```

## force '/' in Python 2 
```python
...to perform 'true division' (unnecessary in Python 3)
from __future__ import division
10 / 4  # true division (returns 2.5)
10 // 4  # floor division (returns 2)
```

# COMPARISONS AND BOOLEAN OPERATIONS

## assignment statement
```python
x = 5
```

## comparisons (these return True)
```python
x > 3
x >= 3
x != 3
x == 5
```

## boolean operations (these return True)
```python
5 > 3 and 6 > 3
5 > 3 or 5 < 3
not False
False or not False and True  # evaluation order: not, and, or
```

# CONDITIONAL STATEMENTS

## if statement
```python
if x > 0:
	print('positive')
```

## if/else statement
```python
if x > 0:
	print('positive')
else:
	print('zero or negative')
```

## if/elif/else statement
```python
if x > 0:
	print('positive')
elif x == 0:
	print('zero')
else:
	print('negative')
```

## single-line if statement (sometimes discouraged)
```python
if x > 0: print('positive')
```

## single-line if/else statement (sometimes discouraged)
```python
# known as a 'ternary operator'
msg = 'positive' if x > 0 else 'zero or negative'

# The first statement (True or “Some”) will return True 
# and the second statement (False or “Some”) will return Some.

output = None
msg = output or "No data returned"
print(msg)
# No data returned
```

# LISTS

> properties: ordered, iterable, mutable, can contain multiple data types

## create an empty list (two ways)
```python
empty_list = []
empty_list = list()
```

## create a list
```python
simpsons = ['homer', 'marge', 'bart']
```

## examine a list
```python
simpsons[0]  # print element 0 ('homer')
len(simpsons)  # returns the length (3)
```

## modify a list (does not return the list)
```python
simpsons.append('lisa')  # append element to end
simpsons.extend(['itchy', 'scratchy'])  # append multiple elements to end
simpsons.insert(
	0, 'maggie')  # insert element at index 0 (shifts everything right)
simpsons.remove('bart')  # search for first instance and remove it
simpsons.pop(0)  # remove element 0 and return it
del simpsons[0]  # remove element 0 (does not return it)
simpsons[0] = 'krusty'  # replace element 0
```

## concatenate lists (slower than 'extend' method)
```python
neighbors = simpsons + ['ned', 'rod', 'todd']
```

## find elements in a list
```python
simpsons.count('lisa')  # counts the number of instances
simpsons.index('itchy')  # returns index of first instance
```

## list slicing [start:end:step]
```python
weekdays = ['mon', 'tues', 'wed', 'thurs', 'fri']
weekdays[0]    # element 0
weekdays[0:3]  # elements 0, 1, 2
weekdays[:3]   # elements 0, 1, 2
weekdays[3:]   # elements 3, 4
weekdays[-1]   # last element (element 4)
weekdays[::2]  # every 2nd element (0, 2, 4)
weekdays[::-1] # backwards (4, 3, 2, 1, 0)
```

## alternative method for returning the list backwards
```python
list(reversed(weekdays))
```

## sort a list in place (modifies but does not return the list)
```python
simpsons.sort()
simpsons.sort(reverse=True)  # sort in reverse
simpsons.sort(key=len)  # sort by a key
```

## return a sorted list (does not modify the original list)
```python
sorted(simpsons)
sorted(simpsons, reverse=True)
sorted(simpsons, key=len)
```

## insert into an already sorted list, and keep it sorted
```python
num = [10, 20, 40, 50]
from bisect import insort
insort(num, 30)
```

## create a second reference to the same list
```python
same_num = num
same_num[0] = 0  # modifies both 'num' and 'same_num'
```

## copy a list (two ways)
```python
new_num = num[:]
new_num = list(num)
```

## examine objects
```python
num is same_num  # returns True (checks whether they are the same object)
num is new_num  # returns False
num == same_num  # returns True (checks whether they have the same contents)
num == new_num  # returns True
```

# TUPLES

> properties: ordered, iterable, immutable, can contain multiple data types like lists, but they don't change size

## create a tuple
```python
digits = (0, 1, 'two')  # create a tuple directly
digits = tuple([0, 1, 'two'])  # create a tuple from a list
zero = (0, )  # trailing comma is required to indicate it's a tuple
```

## examine a tuple
```python
digits[2]  # returns 'two'
len(digits)  # returns 3
digits.count(0)  # counts the number of instances of that value (1)
digits.index(1)  # returns the index of the first instance of that value (1)

elements of a tuple cannot be modified
digits[2] = 2       # throws an error
```

## concatenate tuples
```python
digits = digits + (3, 4)
```

## create a single tuple with elements repeated (also works with lists)
```python
(3, 4) * 2  # returns (3, 4, 3, 4)
```

## sort a list of tuples
```python
tens = [(20, 60), (10, 40), (20, 30)]
sorted(tens)  # sorts by first element in tuple, then second element
# returns: [(10, 40), (20, 30), (20, 60)]
```

## tuple unpacking
```python
bart = ('male', 10, 'simpson')  # create a tuple
(sex, age, surname) = bart  # assign three values at once
```

# STRINGS

> properties: iterable, immutable

## create a string
```python
s = str(42)  # convert another data type into a string
s = 'I like you'
```

## examine a string
```python
s[0]  # returns 'I'
len(s)  # returns 10
```

## string slicing is like list slicing
```python
s[:6]  # returns 'I like'
s[7:]  # returns 'you'
s[-1]  # returns 'u'
```

## basic string methods (does not modify the original string)
```python
s.lower()  # returns 'i like you'
s.upper()  # returns 'I LIKE YOU'
s.startswith('I')  # returns True
s.endswith('you')  # returns True
s.isdigit()  # returns False (returns True if every character in the string is a digit)
s.find('like')  # returns index of first occurrence (2), but doesn't support regex
s.find('hate')  # returns -1 since not found
s.replace('like', 'love')  # replaces all instances of 'like' with 'love'
```

## split a string into a list of substrings separated by a delimiter
```python
s.split(' ')  # returns ['I', 'like', 'you']
s.split()  # equivalent (since space is the default delimiter)
s2 = 'a, an, the'
s2.split(',')  # returns ['a', ' an', ' the']
```

## join a list of strings into one string using a delimiter
```python
stooges = ['larry', 'curly', 'moe']
' '.join(stooges)  # returns 'larry curly moe'
```

## concatenate strings
```python
s3 = 'The meaning of life is'
s4 = '42'
s3 + ' ' + s4  # returns 'The meaning of life is 42'
```

## remove whitespace from start and end of a string
```python
s5 = '  ham and cheese  '
s5.strip()  # returns 'ham and cheese'
```

## string substitutions: all of these return 'raining cats and dogs'
```python
'raining %s and %s' % ('cats', 'dogs')  # old way
'raining {} and {}'.format('cats', 'dogs')  # new way
'raining {arg1} and {arg2}'.format(arg1='cats', arg2='dogs')  # named arguments
```

## string formatting
> more examples: https://mkaz.blog/code/python-string-format-cookbook/
```python
'pi is {:.2f}'.format(3.14159)  # returns 'pi is 3.14'
```

## normal strings versus raw strings
```python
print('first line\nsecond line')  # normal strings allow for escaped characters
print(r'first line\nfirst line'
						)  # raw strings treat backslashes as literal characters
```

# DICTIONARIES

> properties: unordered, iterable, mutable, can contain multiple data types
made of key-value pairs
keys must be unique, and can be strings, numbers, or tuples
values can be any type

## create an empty dictionary (two ways)
```python
empty_dict = {}
empty_dict = dict()
```

## create a dictionary (two ways)
```python
family = {'dad': 'homer', 'mom': 'marge', 'size': 6}
family = dict(dad='homer', mom='marge', size=6)
```

## convert a list of tuples into a dictionary
```python
list_of_tuples = [('dad', 'homer'), ('mom', 'marge'), ('size', 6)]
family = dict(list_of_tuples)
```

## examine a dictionary
```python
family['dad']  # returns 'homer'
len(family)  # returns 3
'mom' in family  # returns True
'marge' in family  # returns False (only checks keys)
```

## returns a list (Python 2) or an iterable view (Python 3)
```python
family.keys()  # keys: ['dad', 'mom', 'size']
family.values()  # values: ['homer', 'marge', 6]
family.items()  # key-value pairs: [('dad', 'homer'), ('mom', 'marge'), ('size', 6)]
```

## modify a dictionary (does not return the dictionary)
```python
family['cat'] = 'snowball'  # add a new entry
family['cat'] = 'snowball ii'  # edit an existing entry
del family['cat']  # delete an entry
family['kids'] = ['bart', 'lisa']  # dictionary value can be a list
family.pop('dad')  # remove an entry and return the value ('homer')
family.update({'baby': 'maggie', 'grandpa': 'abe'})  # add multiple entries
```

## access values more safely with 'get'
```python
family['mom']  # returns 'marge'
family.get('mom')  # equivalent
family['grandma'] # throws an error since the key does not exist
family.get('grandma')  # returns None instead
family.get('grandma', 'not found')  # returns 'not found' (the default)
```

## access a list element within a dictionary
```python
family['kids'][0]  # returns 'bart'
family['kids'].remove('lisa')  # removes 'lisa'
```
## string substitution using a dictionary
```python
'youngest child is %(baby)s' % family  # returns 'youngest child is maggie'
```

# SETS
> properties: unordered, iterable, mutable, can contain multiple data types
made of unique elements (strings, numbers, or tuples)
like dictionaries, but with keys only (no values)

## create an empty set
```python
empty_set = set()
```

## create a set
```python
languages = {'python', 'r', 'java'}  # create a set directly
snakes = set(['cobra', 'viper', 'python'])  # create a set from a list
```

## examine a set
```python
len(languages)  # returns 3
'python' in languages  # returns True
```

## set operations
```python
languages & snakes  # returns intersection: {'python'}
languages | snakes  # returns union: {'cobra', 'r', 'java', 'viper', 'python'}
languages - snakes  # returns set difference: {'r', 'java'}
snakes - languages  # returns set difference: {'cobra', 'viper'}
```

## modify a set (does not return the set)
```python
languages.add('sql')      # add a new element
languages.add('r')        # try to add an existing element (ignored, no error)
languages.remove('java')  # remove an element
languages.remove('c')     # try to remove a non-existing element (throws an error)
languages.discard('c')    # remove an element if present, but ignored otherwise
languages.pop()           # remove and return an arbitrary element
languages.clear()         # remove all elements
languages.update(['go','spark'])  
                          # add multiple elements (can also pass a set)
```

## get a sorted list of unique elements from a list
```python
sorted(set([9, 0, 2, 1, 0]))  # returns [0, 1, 2, 9]
```

# DEFINING FUNCTIONS

## define a function with no arguments and no return values
```python
def print_text():
	print('this is text')

call the function
print_text()
```

## define a function with one argument and no return values
```python
def print_this(x):
	print(x)

# call the function
print_this(3)  # prints 3
n = print_this(3)  # prints 3, but doesn't assign 3 to n
because the function has no return statement
```

## define a function with one argument and one return value
```python
def square_this(x):
	return x**2
```

## include an optional docstring to describe the effect of a function
```python
def square_this(x):
	"""Return the square of a number."""
	return x**2

# call the function
square_this(3)  # prints 9
var = square_this(3)  # assigns 9 to var, but does not print 9
```

## define a function with two 'positional arguments'
```python
# (no default values) and
# one 'keyword argument' (has a default value)
def calc(a, b, op='add'):
	if op == 'add':
		return a + b
	elif op == 'sub':
		return a - b
	else:
		print('valid operations are add and sub')


# call the function
calc(10, 4, op='add')  # returns 14
calc(10, 4,'add')  # also returns 14: unnamed arguments are inferred by position
calc(10, 4)  # also returns 14: default for 'op' is 'add'
calc(10, 4, 'sub')  # returns 6
calc(10, 4, 'div')  # prints 'valid operations are add and sub'
```

## use 'pass' as a placeholder 
```python
if you haven't written the function body
def stub():
	pass
```

## return two values from a single function
```python
def min_max(nums):
	return min(nums), max(nums)

# return values can be assigned to a single variable as a tuple
nums = [1, 2, 3]
min_max_num = min_max(nums)  # min_max_num = (1, 3)

# return values can be assigned into multiple variables using tuple unpacking
min_num, max_num = min_max(nums)  # min_num = 1, max_num = 3
```

# ANONYMOUS (LAMBDA) FUNCTIONS
> primarily used to temporarily define a function for use by another function

```python
define a function the "usual" way
def squared(x):
	return x**2

# define an identical function using lambda
squared = lambda x: x**2

# sort a list of strings by the last letter (without using lambda)
simpsons = ['homer', 'marge', 'bart']

def last_letter(word):
	return word[-1]

sorted(simpsons, key=last_letter)

#sort a list of strings by the last letter (using lambda)
sorted(simpsons, key=lambda word: word[-1])
```

# FOR LOOPS AND WHILE LOOPS

## range returns a list of integers
> (Python 2) or a sequence (Python 3)
```python
range(0, 3)     # returns [0, 1, 2]: includes start value but excludes stop value
range(3)        # equivalent: default start value is 0
range(0, 5, 2)  # returns [0, 2, 4]: third argument is the step value
```

> Python 2 only: use xrange to create a sequence rather than a list (saves memory)

```python
xrange(100, 100000, 5)
```

## for loop (not the recommended style)
```python
fruits = ['apple', 'banana', 'cherry']
for i in range(len(fruits)):
	print(fruits[i].upper())
```

## for loop (recommended style)
```python
for fruit in fruits:
	print(fruit.upper())
```

## iterate through two things at once (using tuple unpacking)
```python
family = {'dad': 'homer', 'mom': 'marge', 'size': 6}
for key, value in family.items():
	print(key, value)
```

## use enumerate if you need to access the index value within the loop
```python
for index, fruit in enumerate(fruits):
	print(index, fruit)
```

## for/else loop
```python
for fruit in fruits:
	if fruit == 'banana':
		print('Found the banana!')
		break  # exit the loop and skip the 'else' block
else:
	this block executes ONLY if the for loop completes without hitting 'break'
	print("Can't find the banana")
```

## while loop
```python
count = 0
while count < 5:
	print('This will print 5 times')
	count += 1  # equivalent to 'count = count + 1'
```
    
# COMPREHENSIONS


## for loop to create a list of cubes
```python
nums = [1, 2, 3, 4, 5]
cubes = []
for num in nums:
	cubes.append(num**3)
```

## equivalent list comprehension
> syntax: [expression for variable in iterable]

```python
cubes = [num**3 for num in nums]  # [1, 8, 27, 64, 125]
```

## for loop to create a list of cubes of even numbers
```python
cubes_of_even = []
for num in nums:
	if num % 2 == 0:
		cubes_of_even.append(num**3)
```

## equivalent list comprehension
> syntax: [expression for variable in iterable if condition]

```python
cubes_of_even = [num**3 for num in nums if num % 2 == 0]  # [8, 64]
```

## for loop to cube even numbers and square odd numbers
```python
cubes_and_squares = []
for num in nums:
	if num % 2 == 0:
		cubes_and_squares.append(num**3)
	else:
		cubes_and_squares.append(num**2)
```

## equivalent list comprehension (using a ternary expression)
> syntax: [true_condition if condition else false_condition for variable in iterable]

```python
cubes_and_squares = [num**3 if num % 2 == 0 else num**2
							for num in nums]  # [1, 8, 9, 64, 25]
```

## for loop to flatten a 2d-matrix
```python
matrix = [[1, 2], [3, 4]]
items = []
for row in matrix:
	for item in row:
		items.append(item)
```

## equivalent list comprehension
```python
items = [item for row in matrix for item in row]  # [1, 2, 3, 4]
```

## set comprehension
```python
fruits = ['apple', 'banana', 'cherry']
unique_lengths = {len(fruit) for fruit in fruits}  # {5, 6}
```

## dictionary comprehension
```python
fruit_lengths = {fruit: len(fruit)
 	  				   for fruit in fruits}  # {'apple': 5, 'banana': 6, 'cherry': 6}
fruit_indices = {fruit: index
						for index, fruit in enumerate(fruits)}  # {'apple': 0, 'banana': 1, 'cherry': 2}
```

# MAP

> 'map' applies a function to every element of a sequence
> ...and returns a list (Python 2) or iterator (Python 3)

```python
simpsons = ['homer', 'marge', 'bart']
map(len, simpsons)  # returns [5, 5, 4]
map(lambda word: word[-1], simpsons)  # returns ['r', 'e', 't']
```

## equivalent list comprehensions
[len(word) for word in simpsons]
[word[-1] for word in simpsons]

# FILTER

> 'filter' returns a list (Python 2) or iterator (Python 3) containing
> ...the elements from a sequence for which a condition is True

```python
nums = range(5)
filter(lambda x: x % 2 == 0, nums)  # returns [0, 2, 4]
```

## equivalent list comprehension
```python
[num for num in nums if num % 2 == 0]
```

# TRY
```python
try:
  print("Hello")
except:
  print("Something went wrong")
else:
  print("Nothing went wrong")
finally:
  print("The 'try except' is finished")

try:
	except ZeroDivisionError as err:
       print('Handling run-time error:', err)

raise NameError('HiThere')
```

# Python Built-in Exceptions:

***AssertionError***        Raised when assert statement fails.
***AttributeError***        Raised when attribute assignment or reference fails.
***EOFError***              Raised when the input() functions hits end-of-file condition.
***FloatingPointError***    Raised when a floating point operation fails.
***GeneratorExit***         Raise when a generator's close() method is called.
***ImportError***           Raised when the imported module is not found.
***IndexError***            Raised when index of a sequence is out of range.
***KeyError***              Raised when a key is not found in a dictionary.
***KeyboardInterrupt***     Raised when the user hits interrupt key (Ctrl+c or delete).
***MemoryError***           Raised when an operation runs out of memory.
***NameError***             Raised when a variable is not found in local or global scope.
***NotImplementedError***   Raised by abstract methods.
***OSError***               Raised when system operation causes system related error.
***OverflowError***         Raised when result of an arithmetic operation is too large to be represented.
***ReferenceError***        Raised when a weak reference proxy is used to access a garbage collected referent.
***RuntimeError***          Raised when an error does not fall under any other category.
***StopIteration***         Raised by next() function to indicate that there is no further item to be returned by iterator.
***SyntaxError***           Raised by parser when syntax error is encountered.
***IndentationError***      Raised when there is incorrect indentation.
***TabError***              Raised when indentation consists of inconsistent tabs and spaces.
***SystemError***           Raised when interpreter detects internal error.
***SystemExit***            Raised by sys.exit() function.
***TypeError***             Raised when a function or operation is applied to an object of incorrect type.
***UnboundLocalError***     Raised when a reference is made to a local variable in a function or method, but no value has been bound to that variable.
***UnicodeError***          Raised when a Unicode-related encoding or decoding error occurs.
***UnicodeEncodeError***    Raised when a Unicode-related error occurs during encoding.
***UnicodeDecodeError***    Raised when a Unicode-related error occurs during decoding.
***UnicodeTranslateError*** Raised when a Unicode-related error occurs during translating.
***ValueError***            Raised when a function gets argument of correct type but improper value.
***ZeroDivisionError***     Raised when second operand of division or modulo operation is zero.

