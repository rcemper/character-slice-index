### common template

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 
Clone/git pull the repo into any local directory
```
git https://github.com/rcemper/Dataset-OEX-reviews.git
```
Run the IRIS container with your project: 
```
docker-compose up -d --build
```
## How to Test it
```
docker-compose exec iris iris session iris
```
**[or use Online Demo](https://oex-mapping.demo.community.intersystems.com/csp/sys/%25CSP.Portal.Home.zen) :**

There are 5 SQL procedures in Python to manipulate the table    
````
- oex.CLEAR()           to erase the whole table   
- oex.LOAD(first,last)  to load directory pages first to last..to   
- oex.PAGE(pn)          to load an inidividual directory page   
- oex.DETAIL(id)        to fill all details for a specific package   
````
You may any of them just use is by **CALL procedure()** or **SELECT procedure()**  
For details  **SELECT id,oex.DETAIL(id) from oex.map where author is null**    
is the most elegant way.  

### Data Load 
In practical tests it turned out that loading directory pages is no problen.   
Differently, with the package details I experienced network timeouts every 30..50 packages.   
Restarting the download is no problem and works OK. Though you have to watch it.   
As this rather unattractive and took 40 minutes or more I created an additional SQL procedure   
````
- CALL oex.TOTAL()
````
It trapps all all odd network or other incidents and restarts undtil completed   
Due to the long run time it is no well suted to SMB or Webterminal   
You better une it from the console with SQL shell to escape from timeouts   
````
$ docker-compose exec iris iris session iris
USER>do $system.SQL.Shell()
[SQL]USER>>CALL TOTAL()
1.      call oex.TOTAL()
2023-06-07 19:10:25 load directory
2023-06-07 19:10:27 directory page 1
2023-06-07 19:10:29 directory page 2
2023-06-07 19:10:31 directory page 3
2023-06-07 19:10:34 directory page 4
   -- -- - - 
````
And in [Mangement Portal](http://localhost:42773/csp/sys/UtilHome.csp) 
you may watch the table and the progress in loading   

[Article in DC](https://community.intersystems.com/post/oex-mapping)   

[Demo Server SMP](https://oex-mapping.demo.community.intersystems.com/csp/sys/UtilHome.csp)   
[Demo Server WebTerminal](https://oex-mapping.demo.community.intersystems.com/terminal/)    
        
