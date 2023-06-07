Class oex.py [ Language = python ]
{
/// clear old stuff
ClassMethod clear() As %Boolean [ SqlName = CLEAR, SqlProc ]
{
 import iris
 st = iris.cls('oex.map')._KillExtent()
 return (st==1)
}
/// load oex directory 
ClassMethod load(
	first As %Integer = 1,
	last As %Integer = 1) As %String(MAXLEN="") [ SqlName = LOAD, SqlProc ]
{
import iris
pn  =first
if last<first:
  last=first
list=str(pn)
while (pn<=last):
   sc=iris.cls('oex.py').page(pn)
   if (pn>first) :
     list +=(','+str(pn))
   pn +=1  
return list
}
/// load and scan directory page
ClassMethod page(pn = 1) As %Boolean [ SqlName = PAGE, SqlProc ]
{
import iris  
import urllib.request as req

def cont(what,stop):
  f1=app.find(what)+len(what)
  t1=app.find(stop,f1)
  content=app[f1:t1]
  return content

link ='https://openexchange.intersystems.com/?page='+str(pn)
upd = iris.cls('oex.map')
pg = str(req.urlopen(link).read())

frm = 0
while True :
  frm = pg.find('<app-tile',frm)
  if frm<0:
    break
  til = pg.find('</app-tile',frm)
  app = pg[frm:til]
  url   =cont('href="','"')
##  special for a bad encoded URL
  if url.find('John')>0 :
     url=url.replace("\\'","'")
  label =cont('label"> ',' </')
  if upd.unique(url):
    obj      =upd._New()
    obj.url  =url
    obj.label=label
    obj.page =pn
    st       =obj._Save()
  frm=til
return True
}
/// load and scan package and review page
ClassMethod detail(id As %Integer) As %Boolean [ SqlName = DETAIL, SqlProc ]
{
import iris
import urllib.request as req
  
def past(what,f2):
  f1=pg.find(what,f2)
  if f1>0 :
    f1 += len(what)
  return f1  

obj = iris.cls('oex.map')._OpenId(id)
if type(obj) is str:
  return 0

link =obj.xurl
pg   =str(req.urlopen(link).read())
t1=0
f1=pg.find('oex-not-found')
if f1>0:
  return 0
  
## zpm
f1=past('">zpm "install ',t1)
if f1>0 :
  t1=pg.find('"',f1)
  val=pg[f1:t1]
  obj.zpmmodul=val
else:
  obj.zpmmodul=''
  
## rating
f1=past('Rating',t1)
f1=past('mp-sub-text">',f1)
t1=pg.find(' ',f1)
val=float(pg[f1:t1])
obj.stars=val

## technology
f1=past('data-info-technology=""><a',t1)
f1=past('">',f1)
t1=pg.find('</',f1)
val=pg[f1:t1]
obj.technology=val

## author
f1=past('data-info-author=""',t1)
f1=past('">',f1)
t1=pg.find('</',f1)
val=pg[f1:t1]
obj.author=val 

## version
f1=past('data-info-version="">',t1)
t1=pg.find('</',f1)
val=pg[f1:t1]
obj.version=val 

## lastupdate
f1=past('data-info-updated="">',t1)
if f1>0:
  t1=pg.find('</',f1)
  val=pg[f1:t1]
  obj.lastupdate=val

## review
revlk=link+'?tab=reviews'
rev=str(req.urlopen(revlk).read())
f1=rev.find('No reviews yet')
if f1<0:
  obj.review=1
  
st=obj._Save()
return 1
}
}
