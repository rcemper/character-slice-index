Class UnitTests.oex Extends %UnitTest.TestCase
{
Method OnAfterAllTests() As %Status
{
  quit $$$OK
}

Method OnBeforeAllTests() As %Status
{
 quit $$$OK
}

Method Test1Load() As %Status
{
  if '$g(^oex.mapD) {
#; no data loaded yet
  set sc=##class(oex.py).page(1)
  }
  else {
    for id=1:1:10 {
      set obj=##class(oex.map).%OpenId(id)
        ,obj.author="" 
        ,sc=obj.%Save()
    quit:'sc    
    }
  }
  quit sc
}

Method Test2Detail() As %Status
{
  for id=1:1:10 {
    &SQL(call oex.DETAIL(:id))
    quit:SQLCODE
    }  
  quit 'SQLCODE
}
}
