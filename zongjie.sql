1、房地产开发项目和信用系统 estatedevelop
2、房地产评估和信用系统 estateAppraisal
3、房地产经纪和信用系统 estateBrokerage
4、房地产物业和信用系统 estateMgmt



#是否自动回收超时连接
spring.datasource.removeAbandoned= true
#超时时间(以秒数为单位) 
spring.datasource.removeAbandonedTimeout= 180
#是否在自动回收超时连接的时候打印连接的超时错误 
spring.datasource.logAbandoned= true


--南京堡垒机地址
https://218.94.77.54:8168/welcome.php


--通过这条sql语句可以查询到数据库的字符集，
select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET';   
--//注意：单引号里边的字串一定要是大写的，否则查询不到数据
--变量名：NLS_LANG
--变量值为：SIMPLIFIED CHINESE_CHINA.ZHS16GBK  
--//注意：如果查询出的数据库的编码是utf-8，那么这个变量值可以设为：AMERICAN_AMERICA.AL32UTF8


--创建db link
CREATE DATABASE LINK 连接名
CONNECT TO 用户名 IDENTIFIED BY 密码
USING '服务名'; 

--查看已创建的db link：
select owner,object_name from dba_objects where object_type='DATABASE LINK';

-- 查看nttschsac用户是否具备创建database link 权限
select * from user_sys_privs where privilege like upper('%DATABASE LINK%') AND USERNAME='NTTFEHSAC';

-- 给nttschsac用户授予创建dblink的权限
grant create public database link to nttschsac;

-- 注意一点，如果密码是数字开头，用“”括起来
create public database link TESTLINK2 connect to WANGYONG identified by "123456" USING 'ORCL21'

-- 创建同义词
create synonym TESTSYNONYM FOR company@TESTLINK1;

-- 查询ORCL2中WANGYONG用户的表COMPANY
SELECT * FROM TESTSYNONYM order by id


--svn
http://subclipse.tigris.org/update_1.8.x
-

--wifi密码
--高新:xian-BIT-service
--vpn密码
--yanguang/44k3b8

--导出dmp
exp system/oracle@ntttest file=C:\wtemp\nttfehsac-0524-1.dmp log=C:\wtemp\nttfehsac-0524-1.log owner=(nttfehsac) buffer=655000 compress=y
exp system/oracle@ntttest file=C:\wtemp\nttschsac-0524-1.dmp log=C:\wtemp\nttschsac-0524-1.log owner=(nttschsac) buffer=655000 compress=y

exp userid='sys/oracle123@32.31.104.178:1521/ntttest as sysdba' file=C:\wtemp\restontt-0314-1.dmp log=C:\wtemp\restontt-0314-1.log owner=(restontt) buffer=65500000 compress=y

exp system/oracleabc123@32.31.104.178:1521/ntttest file=C:\wtemp\restontt-0314-1.dmp log=C:\wtemp\restontt-0314-1.log owner=(restontt) buffer=655000 compress=y

--导入dmp  
 imp system/oracle@ntttest file=C:\wtemp\nttschsac-0524-1.dmp log=C:\wtemp\nttschsac-0524-2.log  fromuser=(nttschsac) touser=(nttschsac) buffer=655000 ignore=y

--openoffice 4    d:\Program Files (x86)\OpenOffice 4\program
soffice -headless -accept="socket,host=127.0.0.1,port=8100;urp;" -nofirststartwizard &

soffice --headless --accept="socket,host=127.0.0.1,port=8100;urp;" --nofirststartwizard &
 
--升级
 yum update
--安装openoffice4
rpm -ivh *.rpm 
--进入目录：
cd desktop-integration
--安装：
yum localinstall openoffice4.1.3-redhat-menus-4.1.3-9783.noarch.rpm

--删除其他版本的office
yum remove openoffice* libreoffice* 


 --卸载openoffice4
rpm -e `rpm -qa |grep openoffice` `rpm -qa |grep ooobasis` 


--tomcat 内存溢出 linux版
--在/bin/catalina.sh  位置  cygwin=false 前添加
export JAVA_OPTS ="-Xms256m -Xmx512m -XX:PermSize=128M -XX:MaxPermSize=512M"

----context.xml 配置
 <Resources cachingAllowed="true" cacheMaxSize="100000" />  


--内存溢出
-Xms256m -Xmx512m -XX:PermSize=128M -XX:MaxPermSize=512M
-Xms1024m   -Xmx2048m
---redis
redis-cli config set notify-keyspace-events Egx

java -Xms256m -Xmx512m -XX:PermSize=128M -XX:MaxPermSize=512M -jar  nttschsac-back.jar  --spring.profiles.active=rel

java -Xms256m -Xmx512m -XX:PermSize=128M -XX:MaxPermSize=512M -jar  nttfehsac-back.jar  --spring.profiles.active=rel

java -jar demo.jar --spring.config.location=/path/test_evn.properties

java -Xms8000m -Xmx8000m -Xmn6000m -jar nttschsac_back.jar --spring.profiles.active=rel --spring.config.location=application.properties

--后台启动
nohup java -Xms8000m -Xmx8000m -Xmn6000m -jar nttschsac-back.jar --spring.profiles.active=rel --spring.config.location=application.properties >temp.out 2>&1 &

nohup java -Xms1024m -Xmx2048m -Xmn1024m -jar nttfehsac-back.jar --spring.profiles.active=rel --spring.config.location=application.properties >temp.out 2>&1 &


nohup java -Xms256m -Xmx512m -XX:PermSize=128M -XX:MaxPermSize=512M -jar nttschsac-back.jar  --spring.profiles.active=rel   --spring.config.location=application.properties >temp.out 2>&1 &

nohup java -Xms256m -Xmx512m -XX:PermSize=128M -XX:MaxPermSize=512M -jar nttfehsac-back.jar  --spring.profiles.active=rel   --spring.config.location=application.properties >temp.out 2>&1 &


--后台启动eureka
nohup java -jar bitservice-eureka.jar --spring.config.location=application.properties >temp.out 2>&1 &

nohup java -jar bitservice-zuul.jar --spring.config.location=application.properties >temp.out 2>&1 &

--查看后台
tail -f tmep.out
01a000911
--被锁的表
select sess.sid,sess.SERIAL#,lo.*,ao.*,sess.*  from v$locked_object lo, dba_objects ao,v$session sess where ao.OBJECT_ID = lo.OBJECT_ID and lo.SESSION_ID = sess.sid;

select * from v$session t1 ,v$locked_object t2 where t1.SID = t2.SESSION_ID;

alter system kill session '3185,1218';

--激活的连接数
select username,count(*) from v$session where status='INACTIVE'  group by username;
--1、耗时长sql查证：--
select * from (select SQL_TEXT,round(ELAPSED_TIME/1000000,2),round(ELAPSED_TIME/1000000/decode(EXECUTIONS,0,1,null,1,EXECUTIONS),2) perELAPSED_time,EXECUTIONS
   from (select * from v$sql order by ELAPSED_TIME desc) where rownum<26) order by perELAPSED_time desc

--6、查看表空间的使用情况
SELECT SUM(bytes) / (1024 * 1024) AS free_space, tablespace_name
FROM dba_free_space
GROUP BY tablespace_name;
SELECT a.tablespace_name,
a.bytes total,
b.bytes used,
c.bytes free,
(b.bytes * 100) / a.bytes "% USED ",
(c.bytes * 100) / a.bytes "% FREE "
FROM sys.sm$ts_avail a, sys.sm$ts_used b, sys.sm$ts_free c
WHERE a.tablespace_name = b.tablespace_name
AND a.tablespace_name = c.tablespace_name;

--注册jar包到本地mvn库
mvn install:install-file -Dfile=D:\jbarcode-0.2.8.jar -DgroupId=com.bitservice -DartifactId=jbarcode -Dversion=0.2.8 -Dpackaging=jar  

--创建表
drop table hzlbgrz;
--户坐落变更日志
create table hzlbgrz(
       id number(8),
       hxh number(8),
       bgqzl varchar2(500),
       bghzl varchar2(500),
       bgsj date,
       czz number(8)
);

--添加主键
alter table hzlbgrz add constraint pk_id primary key (id);
--添加注释
comment on column hzlbgrz.id is '序号';
comment on column hzlbgrz.hxh is '户序号';
comment on column hzlbgrz.bgqzl is '变更前坐落';
comment on column hzlbgrz.bghzl is '变更后坐落';
comment on column hzlbgrz.bgsj is '变更时间';
comment on column hzlbgrz.czz is '操作者';

drop sequence seq_hzlbgrz;
--seq_ckrz
create sequence seq_gr start with 1 nocache;

-- [tri_ckrz] 
create or replace trigger tri_hql_bi
	before insert on hql for each row
declare
begin
	if :new.hqlxh is null or :new.hqlxh < 0 then
		select seq_hql.nextval into :new.hqlxh from dual;
	end if;
end;
/
show err;


--输入以下命令, 修改 oracle 最大游标数为 1000
alter system set open_cursors=1000 scope=both;

--(4). 查看最大游标数是否已修改成功
show parameter open_cursors;


---如何导出空表，在dmp文件里
--1、先查询一下当前用户下的所有空表
    select table_name from user_tables where NUM_ROWS=0;  

--  2、用以下这句查找空表
    select 'alter table '||table_name||' allocate extent;' from user_tables where num_rows=0  

--  3、把查询结果导出，执行导出的语句
    'ALTERTABLE'||TABLE_NAME||'ALLOCATEEXTENT;'   
    -----------------------------------------------------------       
    alter table AQ$_AQ$_MEM_MC_H allocate extent;        
    alter table AQ$_AQ$_MEM_MC_G allocate extent;  
    alter table AQ$_AQ$_MEM_MC_I allocate extent;  
    alter table AQ$_AQ_PROP_TABLE_T allocate extent;        
    alter table AQ$_AQ_PROP_TABLE_H allocate extent;       
    alter table AQ$_AQ_PROP_TABLE_G allocate extent;       
    alter table AQ$_AQ_PROP_TABLE_I allocate extent;       
    alter table AQ$_KUPC$DATAPUMP_QUETAB_T allocate extent;        
    alter table AQ$_KUPC$DATAPUMP_QUETAB_H allocate extent;        
    alter table AQ$_KUPC$DATAPUMP_QUETAB_G allocate extent;       
    alter table AQ$_KUPC$DATAPUMP_QUETAB_I allocate extent;  

--4、然后再执行导出即可。

2）windows下

编辑tomcat的catalina.bat文件，在第一行的后面增加一句：
set JAVA_OPTS=-server -Xms256m -Xmx512m -XX:PermSize=128M -XX:MaxPermSize=256M

--查询数据
select  re_housecertificatecode,d.ps_name from afs2012_descartes d
  where getAfs2012_Re_Category(0,ac_id,ac_cat_biz,ac_name_biz,ps_category,re_category,re_regstatus)='房屋所有权'
   and de_category='参照录入' and re_regstatus=0 order by ps_name;

select d.HS_CODE,ps_idcardno, re_housecertificatecode, d.ps_name
  from afs2012_descartes d
 where getAfs2012_Re_Category(0,
                              ac_id,
                              ac_cat_biz,
                              ac_name_biz,
                              ps_category,
                              re_category,
                              re_regstatus) = '房屋所有权'
   and de_category = '参照录入'
   and re_regstatus = 0
   and ps_idcardno is not null
   and length(replace(ps_idcardno, ' ', '')) > 0
   and re_housecertificatecode like '%苏%'
   and rownum < 3000
 order by ps_name

--打开到jar包所在的路径 
cd /applicaton/nttschsac/eureka/

--后台启动 jar包

nohup java -jar bitservice_zuul.jar >temp1.txt 2>1& &

--查看 后台启动的进程
ps -aux |grep java 


--创建同义词
connect di/bitservice;

grant all on descartes_bld2 to ntt;
grant all on building_bld2 to ntt;
grant all on house_bld2 to ntt;
grant all on housearchive_bld2 to ntt;
grant all on parcel_bld2 to ntt;
grant all on division_bld2 to ntt;
grant execute on pkg_businesscodecreator to ntt;

connect ntt/bitservice;

create synonym afs2012_descartes for di.descartes_bld2;
create synonym afs2012_building for di.building_bld2;
create synonym afs2012_house for di.house_bld2;
create synonym afs2012_housearchive for di.housearchive_bld2;
create synonym afs2012_parcel for di.parcel_bld2;
create synonym afs2012_division for di.division_bld2;

--创建用户 
connect system/oracle;


--创建表空间
create tablespace FIREHOUSETBS datafile 'e:\test.ora' size 1000m;

--删除表空间
DROP TABLESPACE FIREHOUSETBS INCLUDING CONTENTS AND DATAFILES;

--删除用户
 drop user TEMPUSER cascade;

create user nttschsac identified by bitservice;
grant resource,connect to nttschsac ;
grant select any dictionary to nttschsac ;
grant select any sequence to nttschsac ;
grant select any table to nttschsac ;
grant create any table,alter any table,drop any table,create any view to nttschsac ;
grant select any table,update any table to nttschsac ;
grant insert any table,delete any table to nttschsac ;
grant create any table,alter any table,drop any table to nttschsac ;
grant create any trigger,alter any trigger,drop any trigger to nttschsac ;
grant create any procedure,alter any procedure,drop any procedure to nttschsac ;
grant create any sequence,alter any sequence,drop any sequence to nttschsac ;
grant create any synonym,drop any synonym to nttschsac ;


select count(*) from v$process --当前的连接数
select value from v$parameter where name = 'processes' --数据库允许的最大连接数

--修改最大连接数:
alter system set processes = 300 scope = spfile;

--重启数据库:
shutdown immediate;
startup;

--查看当前有哪些用户正在使用数据
SELECT osuser, a.username,cpu_time/executions/1000000||'s', sql_fulltext,machine 
from v$session a, v$sqlarea b
where a.sql_address =b.address order by cpu_time/executions desc;


netstat -ntulp |grep java

--前几天为了测试oracle超过最大连接数会带来什么后果，故意将最大连接数设置的比较小一点，
--今天在使用pl/sql developer连接数据库的时候就出现了
--“ORA-12516: TNS: 监听程序找不到符合协议堆栈要求的可用处理程序”的错误。

--错误解决方案如下：
--1。首先查看oracle的最大连接数是多少引用
SQL> show parameter processes;
NAME                                 TYPE        VALUE
------------------------------------ ----------- -------------
aq_tm_processes                      integer     0
db_writer_processes                  integer     1
gcs_server_processes                 integer     0
global_txn_processes                 integer     1
job_queue_processes                  integer     1000
log_archive_max_processes            integer     4
processes                            integer     50
SQL> show parameter sessions;
NAME                                 TYPE        VALUE
------------------------------------ ----------- -------------
java_max_sessionspace_size           integer     0
java_soft_sessionspace_limit         integer     0
license_max_sessions                 integer     0
license_sessions_warning             integer     0
sessions                             integer     98
shared_server_sessions               integer

--2。然后查看process和session的使用情况引用
SQL> select count(*) from v$process;
  COUNT(*)
----------
        49
SQL> select count(*) from v$session;
  COUNT(*)
----------
        46
--发现明显process的使用几乎达到的峰值

--3。修改oracle的process和session的值，加大他们的最大连接数引用
  SQL> alter system set processes=300 scope=spfile;
  System altered.
  SQL> alter system set sessions=335 scope=spfile;
  System altered.

--4。重起数据库，保存修改
  SQL> shutdown immediate;   
  SQL> startup;   
 

SELECT * FROM all_objects WHERE OBJECT_TYPE = 'TABLE' and owner = 'NTTSCHSAC';

select * from pt_tyjmfz;  --平台统一界面分组
select * from pt_tyjm;  --平台统一界面
select * from pt_tyjmywfzgx;  ---平台统一界面业务分组关系
select * from pt_cd ;  --平台菜单
select * from pt_cdqx;  --平台菜单权限
select * from pt_jsyh;  --平台用户角色
select * from pt_qxjs;  --平台权限角色
select * from pt_xzhd; --平台行政活动
select * from pt_xzhdlb; --平台行政活动列表
select * from pt_ywlc;--平台业务流程
select * from pt_ywlclb;--平台业务流程列表  
select * from hu;  --户
select * from zh;   --撞
select * from c;    --层
select * from qz; --权证
select * from ql;   --权利
select * from hql; --户权利
select * from pz; --票证
select * from yw_ysxk; --业务预售许可
select * from yw_ysxk_descartes_log; --业务预售许可log表
select * from yw_qfrg; --业务期房认购
select * from yw_qfqy; --业务期房签约
select * from yw_ysba; --业务预售备案
select * from hdslb; --活动实例表（总业务表）


--这个是 生成 所有存量房网签 相关房屋的数据
exec  pck_impafs2010bldbr.proc_importsinglebldroom2(~楼栋序号~,~房屋序号~);

exec proc_resyn_clf




select name grqch,'居民身份证' zjlb ,cardno zjhm,sex xb,birthdate,communicateaddr lxdz,zipcode yzbm, mobile lxdh,
graduate xl,certno ZZZH,certdate FZRQ, tag zyzt,lgn yhm, psw kl ,fdate  xzqsrq, tdate xzzzrq,1 nfdl, 0 sfxz,sysdate jlshj 
from broker a,loginmsg b where a.brokerid = b.brokerid;


 --建立job

declare  
   x number;
begin 
    dbms_job.submit(
                      job => x, 
                      what => 'proc_autoSetYwxhqz(1);',
                      next_date => sysdate,
                      interval => 'sysdate+30/(24*60)',
                      no_parse => TRUE 
                      );
    dbms_output.put_line('Job Number is: ' || to_char(x));  
    commit;
end;
/
show err;


--查看job
select * from dba_jobs;
--删除job
begin
dbms_job.remove(61); 
end;


--1、每分钟执行
TRUNC(sysdate,'mi')+1/(24*60)

--1.1 每30分钟运行一次
sysdate+30/(24*60)

--2、每天定时执行
--例如：
--每天凌晨0点执行
TRUNC(sysdate+1)
--每天凌晨1点执行
TRUNC(sysdate+1)+2/24
--每天早上8点30分执行
TRUNC(SYSDATE+1)+(8*60+30)/(24*60)

--3、每周定时执行
--例如：
--每周一凌晨2点执行
TRUNC(next_day(sysdate,1))+2/24
TRUNC(next_day(sysdate,'星期一'))+2/24
--每周二中午12点执行
TRUNC(next_day(sysdate,2))+12/24
TRUNC(next_day(sysdate,'星期二'))+12/24

--4、每月定时执行
--例如：
--每月1日凌晨0点执行
TRUNC(LAST_DAY(SYSDATE)+1)
--每月1日凌晨1点执行
TRUNC(LAST_DAY(SYSDATE)+1)+1/24

--5、每季度定时执行
--每季度的第一天凌晨0点执行
TRUNC(ADD_MONTHS(SYSDATE,3),'q')
--每季度的第一天凌晨2点执行
TRUNC(ADD_MONTHS(SYSDATE,3),'q')+2/24
--每季度的最后一天的晚上11点执行
TRUNC(ADD_MONTHS(SYSDATE+ 2/24,3),'q')-1/24

--6、每半年定时执行
--例如：
--每年7月1日和1月1日凌晨1点执行
ADD_MONTHS(TRUNC(sysdate,'yyyy'),6)+1/24

--7、每年定时执行
--例如：
--每年1月1日凌晨2点执行
ADD_MONTHS(TRUNC(sysdate,'yyyy'),12)+2/24




  select ac_id,
  d.HS_CODEINVESTBITSERVICE,
         hs_code,
         re_housecertificatecode,
         ps_name,
        ac_name_biz,
        ac_cat_biz,
        d.PS_IDCARDNO
    from afs2012_descartes d
   where de_category = '参照录入'
     and re_regstatus = 0
     and getAfs2012_Re_Category(0,
                                ac_id,
                                ac_cat_biz,
                                ac_name_biz,
                                ps_category,
                                re_category,
                                re_regstatus)='房屋所有权'
      and hs_code= '13128015-XXIX-54'
       and ps_name = '罗志敏'
       and re_housecertificatecode = '宁房权证建改字第040055号'


JSONObject  dataJson=new JSONObject("你的Json数据");
JSONObject  response=dataJson.getJSONObject("response");
JSONArray data=response.getJSONArray("data");
JSONObject info=data.getJSONObject(0);
String province=info.getString("province");
String city=info.getString("city");
String district=info.getString("district");
String address=info.getString("address");
System.out.println(province+city+district+address);


create table gr_bak as select grxh,钥匙盘号,姓名 from gr where 钥匙盘号 is not null;

update gr set 钥匙盘号=null where 钥匙盘号 is not null;

commit;

proc_oldDataCreatNewYwclfqy




--统计查询  周报  
select rq,count(ywxh) ,sum(mj),sum(zj) from (
SELECT to_char(HDWCsj, 'yyyy-mm-dd') rq,
       ywxh,
       (select hu.jzmj
          from hu
         where hu.hxh = (select zbjlbh
                           from pt_sw2d
                          where gxbh = 26460107
                            and zhbjlbh = y.ywxh
                            and flbh = 0)) as mj,
       zj
  FROM YW_CLFQY Y
 WHERE HDLB IN (1, 2)
   AND SFYX = -1
   AND YWZT = -1
   AND HDWCsj > TO_DATE('20180101 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
    AND HDWCsj < TO_DATE('20180101 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
   ) where 1=1 group by rq order by rq ;


--统计查询  周报   住宅
select rq,count(ywxh) ,sum(mj),sum(zj) from (
SELECT to_char(HDWCsj, 'yyyy-mm-dd') rq,
       ywxh,
       (select hu.jzmj
          from hu
         where hu.hxh = (select zbjlbh
                           from pt_sw2d
                          where gxbh = 26460107
                            and zhbjlbh = y.ywxh
                            and flbh = 0)) as mj,
       zj,  (SELECT ghyt
          FROM hu hu
         WHERE hu.hxh = (SELECT pt.zbjlbh
                           FROM pt_sw2d pt
                          WHERE pt.zhbjlbh = y.ywxh
                            AND pt.gxbh = 26460107
                            AND pt.flbh = 0)) as ghyt
  FROM YW_CLFQY Y
 WHERE HDLB IN (1, 2)
   AND SFYX = -1
   AND YWZT = -1
   AND HDWCsj > TO_DATE('20180312 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
    AND HDWCsj < TO_DATE('20180319 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
   ) where 1=1 and ghyt like '%住宅%'
   group by rq order by rq ;


--住建部统计数据  区县分组
select * from (
select qxmc,ghyt,count(ywxh) count1,sum(jzmj) jzmj,sum(zj) zj from (
select y.ywxh,
       (SELECT qxmc
          FROM pt_xzqh
         WHERE xzqhxh = (SELECT zh.qxbh
                           FROM zh zh
                          WHERE zh.zxh = (SELECT pt.zbjlbh
                                            FROM pt_sw2d pt
                                           WHERE pt.zhbjlbh = y.ywxh
                                             AND pt.gxbh = 26460101
                                             AND pt.flbh = 0))) AS qxmc,
       (SELECT ghyt
          FROM hu hu
         WHERE hu.hxh = (SELECT pt.zbjlbh
                           FROM pt_sw2d pt
                          WHERE pt.zhbjlbh = y.ywxh
                            AND pt.gxbh = 26460107
                            AND pt.flbh = 0)) as ghyt,
       (SELECT jzmj
          FROM hu hu
         WHERE hu.hxh = (SELECT pt.zbjlbh
                           FROM pt_sw2d pt
                          WHERE pt.zhbjlbh = y.ywxh
                            AND pt.gxbh = 26460107
                            AND pt.flbh = 0)) as jzmj,
       y.zj

  from yw_clfqy y
 where 1 = 1
   and ywzt = -1
   and sfyx = -1
   and hdlb in (1, 2)
   and hdwcsj between to_date('20180201 00:00:00', 'YYYY-MM-DD hh24:mi:ss') and
       to_date('20180301 00:00:00', 'YYYY-MM-DD hh24:mi:ss')
)
where 1=1 group by qxmc,ghyt )
where 1=1 order by qxmc,count1 desc

--二手房23-29日，按天、用途的套数、面积、金额统计
select * from (
select hdwcsj,ghyt,count(ywxh) count1,sum(jzmj) jzmj,sum(zj) zj from (
select y.ywxh,to_char(hdwcsj,'YYYY-MM-DD') hdwcsj,
     
       (SELECT ghyt
          FROM hu hu
         WHERE hu.hxh = (SELECT pt.zbjlbh
                           FROM pt_sw2d pt
                          WHERE pt.zhbjlbh = y.ywxh
                            AND pt.gxbh = 26460107
                            AND pt.flbh = 0)) as ghyt,
       (SELECT jzmj
          FROM hu hu
         WHERE hu.hxh = (SELECT pt.zbjlbh
                           FROM pt_sw2d pt
                          WHERE pt.zhbjlbh = y.ywxh
                            AND pt.gxbh = 26460107
                            AND pt.flbh = 0)) as jzmj,
       y.zj
  from yw_clfqy y
 where 1 = 1
   and ywzt = -1
   and sfyx = -1
   and hdlb in (1, 2)
   and hdwcsj between to_date('20180423 00:00:00', 'YYYY-MM-DD hh24:mi:ss') and
       to_date('20180430 00:00:00', 'YYYY-MM-DD hh24:mi:ss')
)
where 1=1 group by hdwcsj,ghyt )
where 1=1 order by hdwcsj,count1 desc




--内外网公用
route -p add 32.0.0.0 mask 255.0.0.0 192.168.40.1
设置内网ip 192.168.40.111 子网掩码 默认， 其他不管。



南京房产提供的共享楼盘在 restontt 用户，该用户的口令为 restontt 。


connect restontt/restontt;

grant all on mapbuild to nttfehsac;
grant all on maphouse to nttfehsac;
grant all on mapproject to nttfehsac;
connect nttfehsac/bitservice;

create synonym mapbuild for restontt.mapbuild;
create synonym maphouse for restontt.maphouse;
create synonym mapproject for restontt.mapproject;





L^~#@NJuAnSz~9F



-----更新coidid
declare
  l_cnt number(8);
begin
     for rs in(select * from firehouse.company where coid > 0) loop
       select count(1) into l_cnt from dw where dw.dwqch = rs.compname and dw.zjhm = rs.licenseno and dwlb = 48;
       if l_cnt = 1 then 
          update dw set dw.coid = rs.coid,dw.parentno=rs.parentco where dw.dwqch = rs.compname and dw.zjhm = rs.licenseno and dwlb = 48;
          for rs1 in(select * from firehouse.broker where coid = rs.coid)loop
            select count(1) into l_cnt from gr where dwxh <>46 and gr.grqch = rs1.name and gr.zjhm=rs1.cardno  and dwxh = (select dwxh from dw where dw.coid = rs1.coid);
            if l_cnt =1 then
              update gr set gr.coid = rs.coid ,gr.brokerid = rs1.brokerid where dwxh <>46 and gr.grqch = rs1.name and gr.zjhm=rs1.cardno   and dwxh = (select dwxh from dw where dw.coid = rs1.coid);
            elsif l_cnt = 2 then
              insert into temp_gr1(grqch,zjhm,coid,brokerid) values(rs1.name,rs1.cardno,rs.coid,rs1.brokerid);
            else
              insert into temp_gr2(grqch,zjhm,coid,brokerid) values(rs1.name,rs1.cardno,rs.coid,rs1.brokerid);
            end if;
          end loop;   
       elsif l_cnt = 2 then
          insert into temp_dw1(dwqch,zjhm,coid) values(rs.compname,rs.licenseno,rs.coid);
       else
          insert into temp_dw2(dwqch,zjhm,coid) values(rs.compname,rs.licenseno,rs.coid);
       end if;    
     end loop;   
end;
/
show err;


--创建索引
create  unique index uq_gr_brokerid on gr(brokerid);
  create  unique index uq_dw_coid on dw(coid);

用户名：train2   密码：bitservice 

用户名：spfbankroll2   密码：bitservice 



--对于预售许可生成zh/hu的丘权号需要转一下，规则如下
--幢丘权号 转换   mapbulid 默认丘权号  ：  04857521006
-- 1、截取后四位连接处加‘-’  
--2、在末尾 加'-'  然后用如下方法转化为  带罗马数字 的丘权号  
--3、将转换后的  0485752-VI-  去掉末尾的 '-' ， 即 0485752-VI 为要保存到 zh表的丘权号 
select gwtools.get_hillno_from_number('0485752-1006-') from dual;
--户上类似   注意： maphouse 默认户的 丘权号 如: 04857521006-12   ,转完为：0485752-VI-12  直接保存到 hu 表
select gwtools.get_hillno_from_number('0485752-1006-12') from dual;


--通知测绘配图
nj_ch_fcfhtNoticeInfo_clfwq?{"ywbh":"@ywxh@"}|

--新增
window.parent.openK(_code)

--修改
window.parent.openEdit(row,_code)

--删除
delGridData()

window.parent.deleteYqcs(row)
--设置宽度
{QueryInputWidth:230}
--下拉列表
defineSelect?_code=sjzd&dic_type=gr_zjlb


--make: *** No targets specified and no makefile found. Stop.
--(这是指redhat和CentOS是这样的) 
yum install gcc 
--(Debian使用apt-get install gcc）)
apt-get install gcc 



--政务外网地址
http://10.250.143.158:11020/nttschsac/main.jsp


 新网签访问地址  大家更新一下 http://m.mynj.cn:11018/nttschsac/index.jsp

 

部署存量房网签系统，正式服务器
32.31.11.46     L^~#(@NJ.q.js$5q 
32.31.11.47     L^~#(@NJa,mYxgXz
备用 应用
32.31.0.86		L^~#(@NJ%0DV$2J5
32.31.0.87  	L^~#(@NJp[0^W2FH
redis
32.31.111.48	L^~#(@NJbPWpwWV2   正式
32.31.0.88		L^~#(@NJ8nvUaKbr   




潍坊远程方式： teamviewer: 266089036  /123456
桌面远程到应用服务器：172.16.0.30   administrator / Admin123


centos 下关闭防火墙
systemctl stop firewalld.service #停止

systemctl disable firewalld.service #禁用

添加路由
route add  -p 192.168.12.38 mask 255.255.255.0 10.0.0.2




--南京 从测绘库取房屋编码
--张希 2018/6/20 11:42:04
目前房产提供的测绘数据部分房屋没有房屋编码：
 1 对于提供房屋编码的情况，就以房产测绘提供的为准。
 2 对于没有提供房屋编码的情况：
    2.1 期房，一体化平台自己生成。
	2.2 已经期现房对应的现房，继承期房的房屋编码。
	2.3 没有期现房对应的现房，一体化平台自己生成。

--张希 2018/6/20 11:42:22
房屋编码的规则为：4位年份+8位序列号（从1开始）

--张希 2018/6/20 11:48:08
ntt.func_getfwbm

--张希 2018/6/20 11:48:26
这个是获取房屋编码的函数




处理器 i7 8700散片 
散热器 玄冰400    
主板 华硕B360 PLUS GAMING   
内存 威刚 XPG 2400 8G
固态 INTEL 760P 128G 
显卡 技嘉G1 1070 GAMING 8G
机箱 鑫谷光韵7PLUS  
电源 安泰克BP500
风扇 鑫谷RGB 套   
原价 7446  特价   7199 


处理器 i5-8400 散片(6核)
散热器 玄冰400    
主板 华硕B360 MA  
内存 威刚  2400  8G马甲  
固态 创见MTS 820 120G 
显卡 华硕 1060 6G 雪豹/冰骑士
机箱 鑫谷光韵7PLUS  
电源 鑫谷战全模组550
配件 鑫谷全模组镀银线

原价  5460 特价5299

CPU ：I5-8400                ＝1219
散热：东海X4         　      ＝75      
主板：微星B360M PRO-VDH      ＝579  品质主板 
内存：海盗船8G 2400 D4 复仇者＝499  特价100条 
固态：金士顿A400 120G SATA   ＝219 
显卡：索泰GTX1060 6G毁灭     ＝1850 品质特价
机箱：先马 塞恩 3            ＝160 【推荐】
电源：酷冷雷霆II450          ＝249  80品质 
风扇：乔思伯 FR-601日食      ＝30    
运费：顺丰到付

特价：4880【限量特惠50台】



CPU ：I5-8400                ＝1199
散热：东海X4         　      ＝75      
主板：微星B360M PRO-VDH      ＝599  品质主板 
内存：海盗船8G 2400 D4 复仇者＝499  特价100条 
固态：金士顿A400 120G SATA   ＝219 
显卡：索泰GTX1060 6G毁灭     ＝1899 品质特价
机箱：先马 塞恩 3            ＝160 【推荐】
电源：酷冷雷霆II450          ＝249  80品质 
风扇：乔思伯 FR-601日食      ＝30    
运费：顺丰到付

特价：4899【限量特惠50台】

处理器 i7 8700散片 
散热器 玄冰400    
主板 华硕B360 PLUS GAMING   
内存 海盗船复仇者 2400 8GX2  
固态 INTEL 760P 128G 
显卡 技嘉G1 1070 GAMING 8G
机箱 鑫谷光韵7PLUS  
电源 安泰克BP500
风扇 鑫谷RGB 套   
机械 西数WD1TB 
  特价   7969



  CPU ：I7-8700                ＝2199
散热：酷冷T400I        　      ＝90     
主板：微星B360M PRO-VDH      ＝579  品质主板 
内存：海盗船16G 2400 D4 复仇者＝499*2   
固态：金士顿A400 120G SATA   ＝219 
硬盘：ST1T                               =260
显卡：技嘉GTX1070WF2 -8G      ＝2999  
机箱：先马 坦克            ＝195
电源：安钛克BP600               ＝350 
风扇：乔思伯 FR-601日食*3      ＝30*3   
运费：顺丰到付
7979