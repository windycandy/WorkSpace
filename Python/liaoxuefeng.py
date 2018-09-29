line = '-----------------------------------------------------------'


print("hi","man")
print("1800*2 = ", 1800*2)

age = 18 #= input("please input your age:")
print("my age is ",age)

if age>=18:
	print("hey, old man!")
else:
	print("hey, young man!")
	

	
#list
classmate = ["James", "Cater", "Tmac"]
classmate.append("leon")
classmate.insert(4, "dong");
classmate.insert(5, "yin");
classmate.pop()
print(classmate[len(classmate)-1])


#tuple
classmates = ('Michael', 'Bob', 'Tracy')


#dict
d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
print(d['Bob'])
d['Jack'] = 90
print(d)
print("yinyin" in d)
print(d.get("dongdong"))



#set
print(line)
s = set([1, 1, 2, 2, 3, 3])
s.add(1)
print(s) 


def t_abs(x):
    if x>=0:
        return x
    else:
	    return -x
		
print(t_abs(-8))




#关键字参数
print(line)
def person(name, age, **kw):
    print('name:', name, 'age:', age, 'other:', kw)

person('Michael', 30)	
person('Bob', 35, city='Beijing')
person('Adam', 45, gender='M', job='Engineer')

extra = {'city': 'Beijing', 'job': 'Engineer'}
person('Jack', 24, city=extra['city'], job=extra['job'])
person('Jack', 24, **extra)




#命名关键字参数
print(line)
def person(name, age, *, city, job, money):
    print(name, age, city, job, money)

person('Jack', 24, city='Beijing', job='Engineer', money='100')	
	

#递归函数
print(line)

def fact(n):
    if n==1:
        return 1
    return n * fact(n - 1)

print(fact(10))	



#切片
print(line)
L = ['Michael', 'Sarah', 'Tracy', 'Bob', 'Jack']
print(L[0:3])

L = list(range(100))
print(L[::5])

print((0, 1, 2, 3, 4, 5)[:3])

print('ABCDEFG'[::2])


#迭代
print(line)
from collections import Iterable
print(isinstance('123', Iterable))
print(isinstance(123, Iterable))


for ch in 'ABC':
    print(ch)

d = {'a': 1, 'b': 2, 'c': 3}
for key in d:
    print(key)	
	
for x, y in [(1, 1), (2, 4), (3, 9)]:
    print(x, y)	
	
	
	
#列表生成式
print(line)
print(list(range(0,100, 5)))
print([x * x for x in range(1, 11) if x%2 == 0 ])
print([m + n for m in 'ABC' for n in 'XYZ'])


#生成器
print(line)
g = (x * x for x in range(1, 11))
print(next(g))

print(isinstance(g, Iterable))

for k in g:
    print(k)



#类和实例	
print(line)
class Student(object):
    def __init__(self, name, score):
	    self.__name = name
	    self.__score = score

    def print_score(self):
        print('%s: %s' % (self.__name, self.__score))	
		
    def get_grade(self):
        if self.__score >= 90:
            return 'A'
        elif self.__score >= 60:
            return 'B'
        else:
            return 'C'		
		
mStu = Student("leon", 90)
mStu.__name = 'dongyin'
mStu.print_score()
print(mStu.get_grade())
