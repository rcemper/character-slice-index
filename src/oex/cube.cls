Class oex.cube Extends %DeepSee.CubeDefinition [ DependsOn = oex.map, ProcedureBlock ]
{
/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="oex" displayName="oex" disabled="false" abstract="false" sourceClass="oex.map" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="stars" disabled="false" hasAll="false" allCaption="All stars" allDisplayName="stars" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="stars" disabled="false" sourceProperty="stars" list="false" nullReplacement="0" useDisplayValue="true" sort="desc numeric" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="technology" disabled="false" hasAll="false" allCaption="All technology" allDisplayName="technology" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="technology" disabled="false" sourceProperty="technology" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="ZPM" disabled="false" hasAll="false" allCaption="All ZPM" allDisplayName="ZPM" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ZPM" disabled="false" sourceProperty="ZPM" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="IRIS" disabled="false" hasAll="false" allCaption="All IRIS" allDisplayName="IRIS" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="IRIS" disabled="false" sourceProperty="IRIS" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="review" disabled="false" hasAll="false" allCaption="All review" allDisplayName="review" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="review" disabled="false" sourceProperty="review" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="page" disabled="false" hasAll="false" allCaption="All page" allDisplayName="page" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="page" disabled="false" sourceProperty="page" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="author" disabled="false" hasAll="false" allCaption="All author" allDisplayName="author" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="author" disabled="false" sourceProperty="author" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="lastupdate" disabled="false" hasAll="false" allCaption="All lastupdate" allDisplayName="lastupdate" sourceProperty="lastupdate" type="data" calendar="partial" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="lastupdate" disabled="false" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
    </hierarchy>
  </dimension>
  <measure name="stars" disabled="false" sourceProperty="stars" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
</cube>
}
Parameter DOMAIN;
}
