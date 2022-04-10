<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="HW4">
<packages>
<package name="DIL28-3" urn="urn:adsk.eagle:footprint:20609/1" locally_modified="yes">
<description>&lt;B&gt;Dual In Line&lt;/B&gt;&lt;p&gt;
package type P</description>
<wire x1="-17.78" y1="-1.27" x2="-17.78" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="1.27" x2="-17.78" y2="-1.27" width="0.1524" layer="21" curve="-180"/>
<wire x1="17.78" y1="-2.54" x2="17.78" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="2.54" x2="-17.78" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="2.54" x2="17.78" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-17.653" y1="-2.54" x2="17.78" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-16.51" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-13.97" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="13.97" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="16.51" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="16.51" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="13.97" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="17" x="11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="18" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="19" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="20" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="21" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="22" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="23" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="24" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="25" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="26" x="-11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="27" x="-13.97" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="28" x="-16.51" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-17.907" y="-5.08" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-19.558" y="5.4102" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="PIC32MX170F256B">
<pin name="1.MCLR" x="-17.78" y="33.02" length="middle"/>
<pin name="2.A0" x="-17.78" y="27.94" length="middle"/>
<pin name="3.A1" x="-17.78" y="22.86" length="middle"/>
<pin name="4.B0-PGD" x="-17.78" y="17.78" length="middle"/>
<pin name="5.B1-PGC" x="-17.78" y="12.7" length="middle"/>
<pin name="6.B2" x="-17.78" y="7.62" length="middle"/>
<pin name="7.B3" x="-17.78" y="2.54" length="middle"/>
<pin name="8.VSS" x="-17.78" y="-2.54" length="middle"/>
<pin name="9.A2" x="-17.78" y="-7.62" length="middle"/>
<pin name="10.A3" x="-17.78" y="-12.7" length="middle"/>
<pin name="11.B4" x="-17.78" y="-17.78" length="middle"/>
<pin name="12.A4" x="-17.78" y="-22.86" length="middle"/>
<pin name="13.VDD" x="-17.78" y="-27.94" length="middle"/>
<pin name="14.B5" x="-17.78" y="-33.02" length="middle"/>
<pin name="15.B6" x="17.78" y="-33.02" length="middle" rot="R180"/>
<pin name="16.B7" x="17.78" y="-27.94" length="middle" rot="R180"/>
<pin name="17.B8" x="17.78" y="-22.86" length="middle" rot="R180"/>
<pin name="18.B9" x="17.78" y="-17.78" length="middle" rot="R180"/>
<pin name="19.VSS" x="17.78" y="-12.7" length="middle" rot="R180"/>
<pin name="20.VCAP" x="17.78" y="-7.62" length="middle" rot="R180"/>
<pin name="21.B10" x="17.78" y="-2.54" length="middle" rot="R180"/>
<pin name="22.B11" x="17.78" y="2.54" length="middle" rot="R180"/>
<pin name="23.B12" x="17.78" y="7.62" length="middle" rot="R180"/>
<pin name="24.B13" x="17.78" y="12.7" length="middle" rot="R180"/>
<pin name="25.B14" x="17.78" y="17.78" length="middle" rot="R180"/>
<pin name="26.B15" x="17.78" y="22.86" length="middle" rot="R180"/>
<pin name="27.AVSS" x="17.78" y="27.94" length="middle" rot="R180"/>
<pin name="28.AVDD" x="17.78" y="33.02" length="middle" rot="R180"/>
<wire x1="-15.24" y1="-35.56" x2="15.24" y2="-35.56" width="0.254" layer="94"/>
<wire x1="15.24" y1="-35.56" x2="15.24" y2="35.56" width="0.254" layer="94"/>
<wire x1="15.24" y1="35.56" x2="-15.24" y2="35.56" width="0.254" layer="94"/>
<wire x1="-15.24" y1="35.56" x2="-15.24" y2="-35.56" width="0.254" layer="94"/>
<text x="-10.16" y="40.64" size="1.27" layer="94">&gt;NAME</text>
<text x="-10.16" y="38.1" size="1.27" layer="94">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="PIC32MX170F256B">
<gates>
<gate name="G$1" symbol="PIC32MX170F256B" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL28-3">
<connects>
<connect gate="G$1" pin="1.MCLR" pad="1"/>
<connect gate="G$1" pin="10.A3" pad="10"/>
<connect gate="G$1" pin="11.B4" pad="11"/>
<connect gate="G$1" pin="12.A4" pad="12"/>
<connect gate="G$1" pin="13.VDD" pad="13"/>
<connect gate="G$1" pin="14.B5" pad="14"/>
<connect gate="G$1" pin="15.B6" pad="15"/>
<connect gate="G$1" pin="16.B7" pad="16"/>
<connect gate="G$1" pin="17.B8" pad="17"/>
<connect gate="G$1" pin="18.B9" pad="18"/>
<connect gate="G$1" pin="19.VSS" pad="19"/>
<connect gate="G$1" pin="2.A0" pad="2"/>
<connect gate="G$1" pin="20.VCAP" pad="20"/>
<connect gate="G$1" pin="21.B10" pad="21"/>
<connect gate="G$1" pin="22.B11" pad="22"/>
<connect gate="G$1" pin="23.B12" pad="23"/>
<connect gate="G$1" pin="24.B13" pad="24"/>
<connect gate="G$1" pin="25.B14" pad="25"/>
<connect gate="G$1" pin="26.B15" pad="26"/>
<connect gate="G$1" pin="27.AVSS" pad="27"/>
<connect gate="G$1" pin="28.AVDD" pad="28"/>
<connect gate="G$1" pin="3.A1" pad="3"/>
<connect gate="G$1" pin="4.B0-PGD" pad="4"/>
<connect gate="G$1" pin="5.B1-PGC" pad="5"/>
<connect gate="G$1" pin="6.B2" pad="6"/>
<connect gate="G$1" pin="7.B3" pad="7"/>
<connect gate="G$1" pin="8.VSS" pad="8"/>
<connect gate="G$1" pin="9.A2" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="HW4" deviceset="PIC32MX170F256B" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="73.66" y="43.18" smashed="yes">
<attribute name="NAME" x="63.5" y="83.82" size="1.27" layer="94"/>
<attribute name="VALUE" x="63.5" y="81.28" size="1.27" layer="94"/>
</instance>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
