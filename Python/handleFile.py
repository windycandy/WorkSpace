



import re

f = open('E:/YY/SB.txt','r')

for l in f:
	m = re.match(r'([\w.]+)\@[\w-]+\.[\w.]+', l)
	if(m):
		print(m.group(1))

f.close()    



import os
r = os.popen('adb shell getprop ro.debuggable')
print("result = " + r.read())