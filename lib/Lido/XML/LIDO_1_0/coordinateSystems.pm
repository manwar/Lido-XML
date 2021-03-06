package Lido::XML::LIDO_1_0::coordinateSystems;

use Moo;

our $VERSION = '0.06';

sub content {
	my @lines = <DATA>;
	join '' , @lines;
}

1;
__DATA__
<?xml version="1.0" encoding="UTF-8"?>
<schema targetNamespace="http://www.opengis.net/gml" xmlns:gml="http://www.opengis.net/gml" xmlns="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" version="3.1.1.2" xml:lang="en">
	<annotation>
		<appinfo source="urn:opengis:specification:gml:schema-xsd:coordinateSystems:3.1.1"/>
		<documentation>How to encode coordinate system definitions. Builds on referenceSystems.xsd to encode the data needed to define coordinate systems, including the specific subtypes of coordinate systems. 
		This schema encodes the Coordinate System (CS_) package of the extended UML Model for OGC Abstract Specification Topic 2: Spatial Referencing by Coordinates. That UML model is adapted from ISO 19111 - Spatial referencing by coordinates, as described in Annex C of Topic 2. 
		Caution: The CRS package in GML 3.1 and GML 3.1.1 is preliminary, and is expected to undergo some modifications that are not backward compatible during the development of GML 3.2 (ISO 19136). The GML 3.2 package will implement the model described in the revised version of ISO 19111.
		
		GML is an OGC Standard.
		Copyright (c) 2001,2005,2010 Open Geospatial Consortium.
		To obtain additional rights of use, visit http://www.opengeospatial.org/legal/ .
		</documentation>
	</annotation>
	<!-- ======================================================
       includes and imports
	====================================================== -->
	<include schemaLocation="gml.xsd"/>
	<include schemaLocation="referenceSystems.xsd"/>
	<!-- ======================================================
       elements and types
	====================================================== -->
	<element name="CoordinateSystemAxis" type="gml:CoordinateSystemAxisType" substitutionGroup="gml:Definition"/>
	<!-- =================================================== -->
	<complexType name="CoordinateSystemAxisBaseType" abstract="true">
		<annotation>
			<documentation>Basic encoding for coordinate system axis objects, simplifying and restricting the DefinitionType as needed. </documentation>
		</annotation>
		<complexContent>
			<restriction base="gml:DefinitionType">
				<sequence>
					<element ref="gml:metaDataProperty" minOccurs="0" maxOccurs="unbounded"/>
					<element ref="gml:name">
						<annotation>
							<documentation>The name by which this coordinate system axis is identified. </documentation>
						</annotation>
					</element>
				</sequence>
				<attribute ref="gml:id" use="required"/>
			</restriction>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<complexType name="CoordinateSystemAxisType">
		<annotation>
			<documentation>Definition of a coordinate system axis. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:CoordinateSystemAxisBaseType">
				<sequence>
					<element ref="gml:axisID" minOccurs="0" maxOccurs="unbounded">
						<annotation>
							<documentation>Set of alternative identifications of this coordinate system axis. The first axisID, if any, is normally the primary identification code, and any others are aliases. </documentation>
						</annotation>
					</element>
					<element ref="gml:remarks" minOccurs="0">
						<annotation>
							<documentation>Comments on or information about this coordinate system axis, including data source information. </documentation>
						</annotation>
					</element>
					<element ref="gml:axisAbbrev"/>
					<element ref="gml:axisDirection"/>
				</sequence>
				<attribute ref="gml:uom" use="required"/>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="axisID" type="gml:IdentifierType">
		<annotation>
			<documentation>An identification of a coordinate system axis. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="axisAbbrev" type="gml:CodeType">
		<annotation>
			<documentation>The abbreviation used for this coordinate system axis. This abbreviation can be used to identify the ordinates in a coordinate tuple. Examples are X and Y. The codeSpace attribute can reference a source of more information on a set of standardized abbreviations, or on this abbreviation. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="axisDirection" type="gml:CodeType">
		<annotation>
			<documentation>Direction of this coordinate system axis (or in the case of Cartesian projected coordinates, the direction of this coordinate system axis at the origin). Examples: north or south, east or west, up or down. Within any set of coordinate system axes, only one of each pair of terms can be used. For earth-fixed CRSs, this direction is often approximate and intended to provide a human interpretable meaning to the axis. When a geodetic datum is used, the precise directions of the axes may therefore vary slightly from this approximate direction. Note that an EngineeringCRS can include specific descriptions of the directions of its coordinate system axes. For example, the path of a linear CRS axis can be referenced in another document, such as referencing a GML feature that references or includes a curve geometry. The codeSpace attribute can reference a source of more information on a set of standardized directions, or on this direction. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<attribute name="uom" type="anyURI">
		<annotation>
			<documentation>Identifier of the unit of measure used for this coordinate system axis. The value of this coordinate in a coordinate tuple shall be recorded using this unit of measure, whenever those coordinates use a coordinate reference system that uses a coordinate system that uses this axis.</documentation>
		</annotation>
	</attribute>
	<!-- =================================================== -->
	<element name="coordinateSystemAxisRef" type="gml:CoordinateSystemAxisRefType"/>
	<!-- =================================================== -->
	<complexType name="CoordinateSystemAxisRefType">
		<annotation>
			<documentation>Association to a coordinate system axis, either referencing or containing the definition of that axis. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:CoordinateSystemAxis"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<!-- =================================================== -->
	<element name="_CoordinateSystem" type="gml:AbstractCoordinateSystemType" abstract="true" substitutionGroup="gml:Definition"/>
	<!-- =================================================== -->
	<complexType name="AbstractCoordinateSystemBaseType" abstract="true">
		<annotation>
			<documentation>Basic encoding for coordinate system objects, simplifying and restricting the DefinitionType as needed. </documentation>
		</annotation>
		<complexContent>
			<restriction base="gml:DefinitionType">
				<sequence>
					<element ref="gml:metaDataProperty" minOccurs="0" maxOccurs="unbounded"/>
					<element ref="gml:csName"/>
				</sequence>
				<attribute ref="gml:id" use="required"/>
			</restriction>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="csName" type="gml:CodeType" substitutionGroup="gml:name">
		<annotation>
			<documentation>The name by which this coordinate system is identified. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<complexType name="AbstractCoordinateSystemType" abstract="true">
		<annotation>
			<documentation>A coordinate system (CS) is the set of coordinate system axes that spans a given coordinate space. A CS is derived from a set of (mathematical) rules for specifying how coordinates in a given space are to be assigned to points. The coordinate values in a coordinate tuple shall be recorded in the order in which the coordinate system axes associations are recorded, whenever those coordinates use a coordinate reference system that uses this coordinate system. This abstract complexType shall not be used, extended, or restricted, in an Application Schema, to define a concrete subtype with a meaning equivalent to a concrete subtype specified in this document. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemBaseType">
				<sequence>
					<element ref="gml:csID" minOccurs="0" maxOccurs="unbounded">
						<annotation>
							<documentation>Set of alternative identifications of this coordinate system. The first csID, if any, is normally the primary identification code, and any others are aliases. </documentation>
						</annotation>
					</element>
					<element ref="gml:remarks" minOccurs="0">
						<annotation>
							<documentation>Comments on or information about this coordinate system, including data source information. </documentation>
						</annotation>
					</element>
					<element ref="gml:usesAxis" maxOccurs="unbounded">
						<annotation>
							<documentation>Ordered sequence of associations to the coordinate system axes included in this coordinate system. </documentation>
						</annotation>
					</element>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="csID" type="gml:IdentifierType">
		<annotation>
			<documentation>An identification of a coordinate system. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="usesAxis" type="gml:CoordinateSystemAxisRefType">
		<annotation>
			<documentation>Association to a coordinate system axis. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="coordinateSystemRef" type="gml:CoordinateSystemRefType"/>
	<!-- =================================================== -->
	<complexType name="CoordinateSystemRefType">
		<annotation>
			<documentation>Association to a coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:_CoordinateSystem"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="EllipsoidalCS" type="gml:EllipsoidalCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="EllipsoidalCSType">
		<annotation>
			<documentation>A two- or three-dimensional coordinate system in which position is specified by geodetic latitude, geodetic longitude, and (in the three-dimensional case) ellipsoidal height. An EllipsoidalCS shall have two or three usesAxis associations. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="ellipsoidalCSRef" type="gml:EllipsoidalCSRefType"/>
	<!-- =================================================== -->
	<complexType name="EllipsoidalCSRefType">
		<annotation>
			<documentation>Association to an ellipsoidal coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:EllipsoidalCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="CartesianCS" type="gml:CartesianCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="CartesianCSType">
		<annotation>
			<documentation>A 1-, 2-, or 3-dimensional coordinate system. Gives the position of points relative to orthogonal straight axes in the 2- and 3-dimensional cases. In the 1-dimensional case, it contains a single straight coordinate axis. In the multi-dimensional case, all axes shall have the same length unit of measure. A CartesianCS shall have one, two, or three usesAxis associations. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="cartesianCSRef" type="gml:CartesianCSRefType"/>
	<!-- =================================================== -->
	<complexType name="CartesianCSRefType">
		<annotation>
			<documentation>Association to a Cartesian coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:CartesianCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="VerticalCS" type="gml:VerticalCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="VerticalCSType">
		<annotation>
			<documentation>A one-dimensional coordinate system used to record the heights (or depths) of points. Such a coordinate system is usually dependent on the Earth's gravity field, perhaps loosely as when atmospheric pressure is the basis for the vertical coordinate system axis. A VerticalCS shall have one usesAxis association. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="verticalCSRef" type="gml:VerticalCSRefType"/>
	<!-- =================================================== -->
	<complexType name="VerticalCSRefType">
		<annotation>
			<documentation>Association to a vertical coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:VerticalCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="TemporalCS" type="gml:TemporalCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="TemporalCSType">
		<annotation>
			<documentation>A one-dimensional coordinate system containing a single time axis, used to describe the temporal position of a point in the specified time units from a specified time origin. A TemporalCS shall have one usesAxis association. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="temporalCSRef" type="gml:TemporalCSRefType"/>
	<!-- =================================================== -->
	<complexType name="TemporalCSRefType">
		<annotation>
			<documentation>Association to a temporal coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:TemporalCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="LinearCS" type="gml:LinearCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="LinearCSType">
		<annotation>
			<documentation>A one-dimensional coordinate system that consists of the points that lie on the single axis described. The associated ordinate is the distance from the specified origin to the point along the axis. Example: usage of the line feature representing a road to describe points on or along that road. A LinearCS shall have one usesAxis association. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="linearCSRef" type="gml:LinearCSRefType"/>
	<!-- =================================================== -->
	<complexType name="LinearCSRefType">
		<annotation>
			<documentation>Association to a linear coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:LinearCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="UserDefinedCS" type="gml:UserDefinedCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="UserDefinedCSType">
		<annotation>
			<documentation>A two- or three-dimensional coordinate system that consists of any combination of coordinate axes not covered by any other coordinate system type. An example is a multilinear coordinate system which contains one coordinate axis that may have any 1-D shape which has no intersections with itself. This non-straight axis is supplemented by one or two straight axes to complete a 2 or 3 dimensional coordinate system. The non-straight axis is typically incrementally straight or curved. A UserDefinedCS shall have two or three usesAxis associations. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="userDefinedCSRef" type="gml:UserDefinedCSRefType"/>
	<!-- =================================================== -->
	<complexType name="UserDefinedCSRefType">
		<annotation>
			<documentation>Association to a user-defined coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:UserDefinedCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="SphericalCS" type="gml:SphericalCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="SphericalCSType">
		<annotation>
			<documentation>A three-dimensional coordinate system with one distance measured from the origin and two angular coordinates. Not to be confused with an ellipsoidal coordinate system based on an ellipsoid "degenerated" into a sphere. A SphericalCS shall have three usesAxis associations. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="sphericalCSRef" type="gml:SphericalCSRefType"/>
	<!-- =================================================== -->
	<complexType name="SphericalCSRefType">
		<annotation>
			<documentation>Association to a spherical coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:SphericalCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="PolarCS" type="gml:PolarCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="PolarCSType">
		<annotation>
			<documentation>A two-dimensional coordinate system in which position is specified by the distance from the origin and the angle between the line from the origin to a point and a reference direction. A PolarCS shall have two usesAxis associations. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="polarCSRef" type="gml:PolarCSRefType"/>
	<!-- =================================================== -->
	<complexType name="PolarCSRefType">
		<annotation>
			<documentation>Association to a polar coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:PolarCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="CylindricalCS" type="gml:CylindricalCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="CylindricalCSType">
		<annotation>
			<documentation>A three-dimensional coordinate system consisting of a polar coordinate system extended by a straight coordinate axis perpendicular to the plane spanned by the polar coordinate system. A CylindricalCS shall have three usesAxis associations. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="cylindricalCSRef" type="gml:CylindricalCSRefType"/>
	<!-- =================================================== -->
	<complexType name="CylindricalCSRefType">
		<annotation>
			<documentation>Association to a cylindrical coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:CylindricalCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="ObliqueCartesianCS" type="gml:ObliqueCartesianCSType" substitutionGroup="gml:_CoordinateSystem"/>
	<!-- =================================================== -->
	<complexType name="ObliqueCartesianCSType">
		<annotation>
			<documentation>A two- or three-dimensional coordinate system with straight axes that are not necessarily orthogonal. An ObliqueCartesianCS shall have two or three usesAxis associations. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCoordinateSystemType"/>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="obliqueCartesianCSRef" type="gml:ObliqueCartesianCSRefType"/>
	<!-- =================================================== -->
	<complexType name="ObliqueCartesianCSRefType">
		<annotation>
			<documentation>Association to an oblique-Cartesian coordinate system, either referencing or containing the definition of that coordinate system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:ObliqueCartesianCS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
</schema>

