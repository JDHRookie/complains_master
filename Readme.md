# 《JavaEE期末项目》

**-----------------基于SSM框架的工单回执管理系统**

#  一、项目简介

​	现如今各个事务单位都有很多的任务需要完成，而平常的推发任务都是口头的说明，这种方式效率极低且不方便沟通，传统的分配任务的方式相对来书太过的繁琐，且不利于管理，管理人员面的成千上万的任务量也需会忙的晕头转向的。而且人工的搜索查找对比起电脑的高精度，准确度搞的查找方式来说，人会慢很多倍而且面对如此庞大的数据也不免经常犯错，但是对于这种重要的任务单子，一旦错了就会酿成很大的错误，无法弥补。而一个好的业务以及对任务工单的管理的一个好的管理系统和就尤为的重要。

​	我设计的管理系统很好的解决了数据大，数据多，数据难等一些列不好管理的问题。下面来看看有些什么功能。

## 二、项目功能

1、项目实现了对所有的用户，任务工单，公告通知，实施人员以及工单的任务类型的增，删，改，查的功能。

2、不同用户拥有不同的角色和权限理所当然拥有不同的功能，用户只能查看和修改自己的信息，而管理员可以对所有的业务进行管理。

3、项目实现了任务工单的下发处理，以及管理人员处理任务工单返回的回执结果。

4、系统实现了数据的备份，在工单被完成之后，可以保存到工单完结状态一栏当中留作备用户，当然也可以删除数据删除备份。

5、在查询业务当中也对各类的数据进行精准的查询。

## 三、系统开发技术

​	本系统后端主要采用SSM的框架结构，前端主要采用boostrap来布局。SSM最大优点就是它大大地降低了程序的耦合性，强制将程序的输入、处理。和空值分开。其次MVC的结构分明持久层，业务逻辑层，前端控制器层，各个层次分工鲜明提高了效率。其二，Mybatis的强大功能，对比上一学期的JavaWeb学习的Statement的sql，Mybatis那就是非常的好用了实现了动态的sql语句，大大地提高了效率，让我少写了很多的sql语句几个功能都可以使用一个sql语句这就是Mbatis的强大之处。SSM的整合，也大大地处理了各个层麻烦的问题，让使用者更加的方便了。

## 四、系统框架

1、基本功能：包括对人员，任务工单，工单类型，公告信息等数据实现了增删改查的基本功能。

2、用户功能：可对自己的信息进行修改，可以看到管理员发布的公告通知，可以将完成并且提交管理员下发的任务工单，进行回执。

3、管理员功能：能管理任务工单的派发，向谁派发工单，新增工单以及工单类型。可以实时的修改用户的数据可以最大限度的控制用户的数据以及权限。还能进行对公告的处理发步公告修改等操作。

4、数据备份，已近完成的工单可以暂时储存下来备份，也可以将其删除

## 五、数据库需求分析

​	本系统一共五个数据表，用户表实现对用户的处理以及管理，公告表存储日常系统的公告 进行发布，以及存储公告信息，时间和内容用的，还有修改公告。任务工单表，存储工单数据以及状态的表，也是本系统最重要的表，里面存储了工单的详细信息，还存储了处理人的一些关系信息，对系统的整个运转起了呈上启下的作用。工单类型表 ，对工单类型的存储。历史纪录表，用来备份数据用的表，存储那些已经完成了的任务工单进行临时的备份存储。以上就是本系统的全部表。

用户表(tb_admin)

![image-20220606062350500](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606062350500.png)

公告表(tb_announce)

![image-20220606062440327](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606062440327.png)

工单表(tb_complain)

![image-20220606062513039](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606062513039.png)

工单类型表(tb_complaintype)

![image-20220606062559986](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606062559986.png)

历史记录表(tb_history)

![image-20220606062633325](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606062633325.png)

## 六、系统实现与测试

1、开发平台

服务器:Tomcat8.5.70

数据库:Mysql

平台技术:SSM框架

操作系统:windows

2、程序结构图

本系统的根目录是com.svtcc。view是前端网页，是WEB-INF下面是包，资源里有css，js，image等资源文件src目录则是包括以下一个包：

(1)包

bean包，controller包，dao包，interceptor包，service包，serviceImp包，resourec资源配置文件包，webapp服务器包

(2) 配置文件

applicationContext.xml，log4j.properties，log4j2.xml，mybatis-config.xml，spring-mvc.xml以及最重要的pom.xml文件

3、项目页面

管理员对工单的增删改查操作

![image-20220606063651826](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606063651826.png)

管理进行派发任务工单的操作

![image-20220606063725407](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606063725407.png)

用户对工单进行处理的页面

![image-20220606063808030](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606063808030.png)

用户完成工单后的工单的状态，工单状态已经完成

![image-20220606063848859](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606063848859.png)

对工单数据进行备份存储

![image-20220606063934850](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606063934850.png)

对用户的各个数据进行操作修改以及对其的权限修改

![image-20220606064020652](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606064020652.png)

用户对个人资料的修改页面

![image-20220606064115023](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606064115023.png)

日志的输出页面

![image-20220606064151716](C:\Users\蒋登禾\AppData\Roaming\Typora\typora-user-images\image-20220606064151716.png)

4、系统测试

安装jdk，tomcat8.5.70,mysql

将项目导入idea中

启动服务其根据你的ip地址进入页面

成功后即可进入页面进行操作

