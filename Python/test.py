
from enum import Enum

Month = Enum('Month', ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))

#dir(Month)

for name, member in Month.__members__.items():
    print(name, '=>', member, ',', member.value)


	
from enum import Enum, unique

@unique
class Weekday(Enum):
    Sun = 0 # Sun的value被设定为0
    Mon = 1
    Tue = 2
    Wed = 3
    Thu = 4
    Fri = 5
    Sat = 6
    Sat = 7

for name, member in Weekday.__members__.items():
    print(name, '=>', member, ',', member.value)
	
	


def f1(a, b, c=0, *args, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)

f1(1, 2)
f1(1, 2, 3)
f1(1, 2, 3, 'a', 'b', 'c')
f1(1, 2, 3, 'a', 'b', 'c', x=99)
kw = {'d': 99, 'x': '#'}
args = (1, 2, 3, 4)
f1(*args, **kw)

args = (1, 2, 3)
f1(*args, **kw)


def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum
	
	
t = calc(1, 3, 5, 7)
print(t)	


t =  '123'
t =  '456'
print(t)

classmates = ['Michael', 'Bob', 'Tracy']
classmates.append('dongyin')
classmates.insert(0, 'zuo')
classmates.pop()
print(classmates)
print(len(classmates))



print('hello %s' % 'dongyin')

t1 =  'ABC'.encode('ascii') 
print(t1)#b'ABC'

t1 =  b'ABC'.decode('ascii')
print(t1)#'ABC'

t1 =  '中文'.encode('utf-8')
print(t1)#b'\xe4\xb8\xad\xe6\x96\x87''




t1 =  ord('中')
print(t1)
print(chr(25991))

print('包含中文的str')

print('''line1
line2
line3''')



a = 100
if a >= 0:
    print(a)
else:
    print(-a)


#a = input();
#b = input();
#print(a, '*', b, '=', int(a) * int(b));



d = {'a': 1, 'b': 2, 'c': 3}
for key,value in d.items():
    print(key)
    print(value)
	
	
	
L = ['x*x = '+ str(x*x) for x in range(1,11) if(x*x > 50)]	
print(L)


import os
L = [f for f in os.listdir(".")]
#print(L)


L = ['Hello', 'World', 'IBM', 'Apple']
for k in L:
    print(k)
	
for x in [1, 2, 3, 4, 5]:
    pass	
	
	
	
	
def add(a,b,f):
    return f(a)+f(b)

def pingfang(x):
    return x*x;	
	
c = add(2, 3, pingfang)	
print(c)



def pingfang(x):
    return x*x;	
	
c5 = (list)(map(pingfang, [1,9,3,4,5]))
print(c5[1])


from functools import reduce
def fn(x, y):
    return x * 10 + y
c = reduce(fn, [1, 3, 5, 7, 9])
print(c)	


def filterFn(n):
    return n%2==1
c = list(filter(filterFn,[1,2,3,4,5]))
print(c)
	





