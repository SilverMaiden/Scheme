#|Q1. Define a variable, stooges, whose value is a
 #list of the names of the Three Stooges:
#'Moe' 'Larry' 'Curly'

stooges = ['Moe', 'Larry', 'Curly']

#Q2. Given the variable:

days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]

#define a procedure, how_many_days, that takes
#as input a number representing a month,
#and returns the number of days in that month.

def how_many_days(month):
    return days_in_month[month-1]

print how_many_days(9)

# Given the variable countries defined as:


#             Name    Capital  Populations (millions)
countries = [['China','Beijing',1350],
             ['India','Delhi',1210],
             ['Romania','Bucharest',21],
             ['United States','Washington',307]]
# Write code to print out the capital of India
# by accessing the array.

print countries[1][1]

# Given the variable countries defined as:


#             Name      Capital  Populations (millions)
countries = [['China','Beijing',1350],
             ['India','Delhi',1210],
             ['Romania','Bucharest',21],
             ['United States','Washington',307]]


# What multiple of Romania's population is the population
# of China? Please print your result.

print (countries[0][2]) / (countries[2][2])

# We defined:
stooges = ['Moe', 'Larry', 'Curly']


# but in some Stooges films, Curly was
# replaced by Shemp.
# Write one line of code that changes
# the value of stooges to be:
#['Moe', 'Larry', 'Shemp']
# but does not create a new List
# object.
stooges[2] = 'Shemp'
print stooges

# Define a procedure, replace_spy,
# that takes as its input a list of
# three numbers, and modifies the
# value of the third element in the
# input list to be one more than its
# previous value.

spy = [0, 0, 7]
def replace_spy(lst):
    lst[2] = lst[2] + 1
    return lst


print replace_spy(spy)
# Define a procedure, sum_list,
# that takes as its input a
# list of numbers, and returns
# the sum of all the elements in
# the input list.



def sum_list(p):
    a = 0
    for e in p:
        a = a + e
    return a


p = [1, 53, 6, 34, 257]

print sum_list(p)

# Define a procedure, measure_udacity,
# that takes as its input a list of strings,
# and returns a number that is a count
# of the number of elements in the input
# list that start with the uppercase
# letter 'U'.


def measure_udacity(lst):
    a = 0
    for e in lst:
        if e[0] == 'U':
            a = a + 1
    return a
print measure_udacity(['Umika','Umberto'])

# Define a procedure, find_element,
# that takes as its inputs a list
# and a value of any type, and
# returns the index of the first
# element in the input list that
# matches the value.

# If there is no matching element,
# return -1.

def find_element(lst, val):
    result = 0
    for e in lst:
        if e == val:
            return result
        result = result + 1
    return -1

print find_element([3,2,2],3)

# It takes a list, and a value. It assigns the variable "result" the value 0. For each
#element in the list, if an element has the same value as "val", the procedure will return "result".
#AKA it will return 0. After the first element is passed through, "result"'s value is increased by
# 1, to stay equal to the position of e. The procedure continues until e == val, and if there
#is no element equal to "val", then the procedure returns -1, as instructed.

# Define a procedure, find_element,
# using index that takes as its
# inputs a list and a value of any
# type, and returns the index of
# the first element in the input
# list that matches the value.

# If there is no matching element,
# return -1.

def find_element(lst, val):
    if val in lst:
        return lst.index(val)
    return -1



print find_element([1,2,3], 3)

# Define a procedure, union,
# that takes as inputs two lists.
# It should modify the first input
# list to be the set union of the two
# lists. You may assume the first list
# is a set, that is, it contains no
# repeated elements.
#NOTE TO SELF: 'if' statements do not need an 'else' statement.
#If they have no 'else' statement and your condition is not met,
#nothing will be returned, which is what you want.

def union(a, b):
    for e in b:
        if not (e in a):
            a.append(e)




# To test, uncomment all lines
# below except those beginning with >>>.
a = [1, 2, 3]
b = [2,4,6]
union(a, b)
print a

# p.pop() : this is a function that has no input in the brackets.
#its 'input' is the list we give it, p. It takes the list p,
#mutilates p to remove the last value in the list, and returns
#the number. If p = [1, 2] then p.pop() would return 2,
#and it would mutilate p so the list would now only contain
#the number [1].

#       p.append(3)
#       p.pop()
# 'p.append(3)' appends 3 to the list p, so p now contains three numbers:
# p = [1, 2, 3]
# 'p.pop()' returns 3, and mutilates p so there are only 2 numbers again:
# p = [1, 2]
# Therefore, these procedures together do not change the final value
#of p.

#       x = p.pop()
#       y = p.pop()
#       p.append(x)
#       p.append(y)
# 'x = p.pop()' mutilates p, so p only has one number:
# p = [1]
#it returns the number that was "popped" off the end,
# 2, and assigns it to the variable x:
# x = 2
# 'y = p.pop()' mutilates p, so the list p now contains nothing:
# p = []
#it returns the number that was "popped" off the end,
# 1, and assigns it to the variable y:
# y = 1
# 'p.append(x)' appends x = 2 to the empty list p,
# so p now contains 1 number:
# p = [2]
# 'p.append(y)' appends y = 1 t0 the list p, so
# p now contains two numbers:
# p = [2, 1]
# Since the final value of p changes from [1, 2] to [2, 1], this answer
#should not be selected.

#       x = p.pop()
#       p.append(x)
# This pops off the last value, then appends it again, therefore
# the final value is the same, so this answer should be selected.

#       x = p.pop()
#       y = p.pop()
#       p.append(x)
#       p.append(y)

# This is the same as the other question like it, except this time
# x and y are appended to p in the opposite order, therefore returning
# the final value of p back to its original state, so this answer should
# be selected.
