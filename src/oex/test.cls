Class oex.test Extends %UnitTest.TestCase
{

ClassMethod Run() As %Status
{
  write "Running test", !
  set dir=$system.Util.ManagerDirectory()_"unittest/oex/test"
  do ##class(%File).CreateDirectoryChain(dir)
  Set ^UnitTestRoot=$system.Util.ManagerDirectory()_"unittest"
  set className = ..%ClassName(1)
  set testcase = className
  set testsuite = className
  set testspec = testsuite _ ":" _ testcase
  set qualifiers = "/load=0/recursive=0/nodelete"
  set status = ##class(%UnitTest.Manager).RunTest(testspec, qualifiers)
  quit status
}

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
