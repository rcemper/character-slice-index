[![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2FOEX-mapping&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2FOEX-mapping)   
### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

### Installation 
Clone/git pull the repo into any local directory
```
git https://github.com/rcemper/character-slice-index.git
```
Run the IRIS container with your project: 
```
docker-compose up -d --build
```
## How to Test it
```
docker-compose exec iris iris session iris  
```

There is a populate procedure that you can run from SQL Shell   
The reply is the last ID generated    
The default line size is 37 char.   
You can change it by passing some different size  

```
USER>do $system.SQL.Shell()
[SQL]USER>>select rcc_slice.pop()
38
[SQL]USER>>select rcc_slice.pop(15)
130
[SQL]USER>>select rcc_slice.pop(50)
158
[SQL]USER>>select documentid,count(*) lines from rcc_slice.data group by documentid
documentid      lines
28      28
43      92
62      38
```
Next we look for lines containing **ol**     
Classic approach:    
```
[SQL]USER>>
        1>>SELECT ID, documentid, line, length(line), lineid
        2>>FROM rcc_slice.data WHERE line [ 'ol'
        3>>go   
27 Rows(s) Affected
statement prepare time(s)/globals/cmds/disk: 0.0841s/42,502/225,481/0ms
          execute time(s)/globals/cmds/disk: 0.0010s/ 159 /4,444/0ms
                          cached query class: %sqlcq.USER.cls7
---------------------------------------------------------------------------
```
Character Slice approach:    
```
[SQL]USER>>
        1>>SELECT ID, documentid, line, length(line), lineid
        2>>FROM rcc_slice.data WHERE line %CONTAINSTERM ('ol')
        3>>go
27 Rows(s) Affected
statement prepare time(s)/globals/cmds/disk: 0.0847s/42,849/238,674/0ms
          execute time(s)/globals/cmds/disk: 0.0011s/ 34 /3,900/0ms
                          cached query class: %sqlcq.USER.cls8
---------------------------------------------------------------------------  
```
Even with this small data sample we see only **34** Global Access instead of **159**   

Now let's look for 2 independent values **ol** and **w**    
Classic approach:
```
[SQL]USER>>
        1>>SELECT ID, documentid, line, length(line), lineid
        2>>FROM rcc_slice.data WHERE line [ 'ol' and line [ 'w'
        3>>go   
4 Rows(s) Affected
statement prepare time(s)/globals/cmds/disk: 0.0805s/42,670/233,791/0ms
          execute time(s)/globals/cmds/disk: 0.0004s/ 159 /2,340/0ms
                          cached query class: %sqlcq.USER.cls9
---------------------------------------------------------------------------
```
Character Slice approach:    
```
[SQL]USER>>
        1>>SELECT ID, documentid, line, length(line), lineid
        2>>FROM rcc_slice.data WHERE line %CONTAINSTERM ('ol','w')
        3>>go
4 Rows(s) Affected
statement prepare time(s)/globals/cmds/disk: 0.0901s/43,417/265,856/0ms
          execute time(s)/globals/cmds/disk: 0.0005s/ 15 / 1,632/0ms
                          cached query class: %sqlcq.USER.cls11
---------------------------------------------------------------------------
```
It's getting dramatic: less than 10% !    
Only **15** instead of **159** Global Access    
You are invited to extrapolation of these results    

[Article in DC](https://community.intersystems.com/post/character-slice-index)  
