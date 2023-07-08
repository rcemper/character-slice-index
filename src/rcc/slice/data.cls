Class rcc.slice.data Extends %Persistent
{

Property documentid As %Integer;

Property lineid As %Integer;

Property line As %Text(LANGUAGECLASS = "rcc.slice.dictionary", MAXLEN = 32000);

Index slice On line(KEYS) [ Type = bitmap ];

Index lin On lineid [ Type = bitmap ];

/// return last ID
ClassMethod Populate(linesize As %Integer = 37) As %Integer [ SqlName = Pop, SqlProc ]
{
  set lorem="Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy "_
      "nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. "_
      "Ut wisi enim ad minim veniam, quis nostrud exercitation ulliam corper "_
      "suscipit lobortis nisl ut aliquip ex ea commodo consequat. "_
      "Duis autem veleum iriure dolor in hendrerit in vulputate velit esse molestie "_
      "consequat, vel willum lunombro dolore eu feugiat nulla facilisis at vero "_
      "eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril "_
      "delenit augue duis dolore te feugait nulla facilisi. "_
      "Li Europan lingues es membres del sam familie. "_
      "Lor separat existentie es un myth. Por scientie, musica, sport etc., "_
      "li tot Europa usa li sam vocabularium. Li lingues differe solmen in li grammatica, "_
      "li pronunciation e li plu commun vocabules. Omnicos directe al desirabilit? "_
      "de un nov lingua franca: on refusa continuar payar custosi traductores. "_
      "It solmen va esser necessi far uniform grammatica, pronunciation e plu sommun "_
      "paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es "_
      "plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca "_
      "va esser plu simplic e regulari quam li existent Europan lingues. "_
      "It va esser tam simplic quam Occidental: in fact, it va esser Occidental. "_
      "A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge "_
      "amico dit me que Occidental es."
  set max=0
  &sql(select max(%ID) into :max from rcc_charslice.data)
  set docid=$R(100)+max
  for lin=1:1 {
    set doc=..%New()
      , doc.documentid=docid
      , doc.lineid=lin
      , doc.line=$e(lorem,1,linesize)
      , lorem=$e(lorem,linesize+1,*)
      , sc=doc.%Save()
    quit:'$l(lorem)  
  }
  quit doc.%Id()
}

Storage Default
{
<Data name="dataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>documentid</Value>
</Value>
<Value name="3">
<Value>lineid</Value>
</Value>
<Value name="4">
<Value>line</Value>
</Value>
</Data>
<DataLocation>^rcc.slice.dataD</DataLocation>
<DefaultData>dataDefaultData</DefaultData>
<IdLocation>^rcc.slice.dataD</IdLocation>
<IndexLocation>^rcc.slice.dataI</IndexLocation>
<StreamLocation>^rcc.slice.dataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
