


import requests
import urllib

r = requests.get('http://music.163.com/api/playlist/detail?id=3779629')
arr = r.json()['result']['tracks']['album']
print(arr[0]['picId'])


#############################################################################
#coding=utf-8
import urllib.request
import re
import os

'''
Urllib 模块提供了读取web页面数据的接口，我们可以像读取本地文件一样读取www和ftp上的数据
urlopen 方法用来打开一个url
read方法 用于读取Url上的数据
'''

def getHtml(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    html = urllib.request.urlopen(req).read()
    print('html >>>>>\n', html)
    return html;

def getImg(html):
    imglist = re.findall('img src="(http.*?)"',html)
    print('imglist >>>> ', len(imglist))
    return imglist

html = getHtml("http://blog.csdn.net/feifeiwendao/article/details/51008181").decode("utf-8");
print('decode html >>>>>\n', html)

imagesUrl = getImg(html);

if os.path.exists("D:/imags") == False:
    os.mkdir("D:/imags");
    
count = 0;
for url in imagesUrl:
    print(url)
    if(url.find('.') != -1):
        #name = url[url.find('.',len(url) - 5):];
        name = url.split('.')[-1]
        bytes = urllib.request.urlopen(url);
        f = open("D:/imags/"+str(count)+ "." + name, 'wb');
        f.write(bytes.read());
        f.flush();
        f.close();
        count+=1;

