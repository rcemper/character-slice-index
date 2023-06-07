Class oex.map Extends %Persistent [ Final ]
{

Property url As %String(MAXLEN = "") [ Private ];

Property label As %String(MAXLEN = "");

Property author As %String(MAXLEN = "");

Property technology As %String(MAXLEN = "");

Property zpmmodul As %String(MAXLEN = "");

Property review As %Boolean [ InitialExpression = 0 ];

Property page As %Integer [ InitialExpression = 0 ];

Property stars As %Numeric(SCALE = 1);

Property version As %String(MAXLEN = "");

Property lastupdate As %Date;

Method lastupdateSet(Arg As %String) As %Status [ ServerOnly = 1 ]
{
  Set i%lastupdate=$ZDH(Arg,3)
  Quit $$$OK
}

Property IRIS As %Boolean [ Calculated, SqlComputeCode = { set {*}=($zcvt({technology},"U")["IRIS") }, SqlComputed ];

Property ZPM As %Boolean [ Calculated, SqlComputeCode = { set {*}=$S({zpmmodul}/1={zpmmodul}:{zpmmodul},1:{zpmmodul}]"") }, SqlComputed ];

Property xurl As %String(MAXLEN = "") [ Calculated, SqlComputeCode = {set {*}="https://openexchange.intersystems.com"_{url}}, SqlComputed ];

Index url On url [ Unique ];

Index pgn On page;

ClassMethod unique(url As %String) As %Boolean
{
  quit '..urlExists(url)
}

Storage Default
{
<Data name="mapDefaultData">
<Value name="1">
<Value>url</Value>
</Value>
<Value name="2">
<Value>label</Value>
</Value>
<Value name="3">
<Value>author</Value>
</Value>
<Value name="4">
<Value>technology</Value>
</Value>
<Value name="5">
<Value>zpmmodul</Value>
</Value>
<Value name="6">
<Value>review</Value>
</Value>
<Value name="7">
<Value>page</Value>
</Value>
<Value name="8">
<Value>stars</Value>
</Value>
<Value name="9">
<Value>version</Value>
</Value>
<Value name="10">
<Value>lastupdate</Value>
</Value>
</Data>
<DataLocation>^oex.mapD</DataLocation>
<DefaultData>map1DefaultData</DefaultData>
<IdLocation>^oex.mapD</IdLocation>
<IndexLocation>^oex.mapI</IndexLocation>
<StreamLocation>^oex.mapS</StreamLocation>
<Type>%Storage.Persistent</Type>
}
}
                                    
