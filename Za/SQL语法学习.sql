http:www.w3school.com.cnsqlindex.asp

select * from app

select name , time from app

select distinct name from test     去重复项

SELECT 列名称 FROM 表名称 WHERE 列 运算符 值

select * from test where time > 20

select * from test where time between 10 and 100

select * from test where time > 0 and name = 'dongyin'

select * from test where time > 0 or name = 'dongyin'  也可以把 AND 和 OR 结合起来（使用圆括号来组成复杂的表达式）

select * from test order by time 

select * from test order by time DESC

insert into test values ('test name 1' , 7.77,  '1992-11-11');

insert into test values ('dont' , 8888,  '1992-11-11');

insert into test (name , time ) values ('test name 3' , 50);

update test set name = 'don' where name = 'dongyin'

update test set name = 'dongyin', time = 100 where name = 'dong'

delete from test where name = 'test_name'

SQL 高级教程
select * from test limit 2

select * from test order by time desc limit 2

select top 2  * from app

SQL 通配符
select * from test where name like 'd%' or name like 't%'

select * from test where name like '%yi%'

select * from test where name not like 'don%'

select * from test where name like 'don_'

select * from test where name like '[dt]%'   pg不支持

select * from test where name in ('dongyin','dong')


JOIN 准备两张表格
create table app_list(
id       character varying(10),
name     character varying(20),
age      int,
sex      character varying(2),
pb       int, 
address  character varying(100),
app_group    character varying(20)
)          

select * from app_list

insert into app_list values('D22222', '2货', 22, '男', 2222, '深圳市福田莲花山顶','MM' )
 
update app_list set app_group = '多媒体小组' where id = 'D22211'

create table app_jixiao(
id       character varying(10),
month    int,
jixiao   character varying(2)
)          

insert into app_jixiao values('D00000', 201601 , 'D')

select * from app_jixiao

update app_jixiao set jixiao = 'S' where id = 'D22211'



JOIN: 如果表中有至少一个匹配，则返回行   INNER JOIN 与 JOIN 是相同的
LEFT JOIN: 即使右表中没有匹配，也从左表返回所有的行
RIGHT JOIN: 即使左表中没有匹配，也从右表返回所有的行
FULL JOIN: 只要其中一个表中存在匹配，就返回行  在某些数据库中， FULL JOIN 称为 FULL OUTER JOIN。


select app_jixiao.id , app_jixiao.month, app_jixiao.jixiao from app_jixiao , app_list where app_jixiao.id = app_list.id


select app_jixiao.id , app_jixiao.month, app_jixiao.jixiao from app_jixiao 
inner join app_list 
on app_jixiao.id = app_list.id
order by app_jixiao.id desc


select app_list.id , app_list.name, app_jixiao.jixiao from app_list 
join app_jixiao on app_list.id = app_jixiao.id

select app_list.id , app_list.name, app_jixiao.jixiao from app_list 
left join app_jixiao on app_list.id = app_jixiao.id

select app_list.id , app_list.name, app_jixiao.jixiao from app_list 
right join app_jixiao on app_list.id = app_jixiao.id

select app_list.id , app_list.name, app_jixiao.jixiao from app_list 
full join app_jixiao on app_list.id = app_jixiao.id

select app_list.id , app_list.name from app_list,app_jixiao where app_list.id = app_jixiao.id    


UNION 操作符

select app_list.id from app_list 
union 
select app_jixiao.id from app_jixiao

select app_list.id , app_list.id from app_list 
union all 
select app_jixiao.id , app_jixiao.id from app_jixiao



select * into app_list_backup from app_list

select pb into app_list_backup from app_list

alter table app_list_backup  add new_name character varying(20)  增加

select * from app_list_backup

update app_list_backup set new_name = app_list.name  from app_list where app_list_backup.pb = app_list.pb  copy


函数

select avg(age) from app_list

select sum(age) from app_list 

select max(age) from app_list 

select count(age) from app_list 

select name, sum(age) from app_list 
group by name 
having sum(age)> 20

select name , now() as PerDate  from app_list


select *  from app_list









