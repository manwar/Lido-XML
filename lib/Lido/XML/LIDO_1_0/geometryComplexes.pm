package Lido::XML::LIDO_1_0::geometryComplexes;

use Moo;

our $VERSION = '0.06';

sub content {
	my @lines = <DATA>;
	join '' , @lines;
}

1;
__DATA__
<?xml version="1.0" encoding="UTF-8"?>
<schema targetNamespace="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gml="http://www.opengis.net/gml" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified"
        version="3.1.1.2">
	<annotation>
		<appinfo source="urn:opengis:specification:gml:schema-xsd:geometryComplexes:v3.1.1">geometryComplexes.xsd</appinfo>
		<documentation>
			GML is an OGC Standard.
			Copyright (c) 2001,2005,2010 Open Geospatial Consortium.
			To obtain additional rights of use, visit http://www.opengeospatial.org/legal/ .
		</documentation>
	</annotation>
	<include schemaLocation="gml.xsd"/>
	<include schemaLocation="geometryAggregates.xsd"/>
	<!-- =========================================================== -->
	<element name="CompositeCurve" type="gml:CompositeCurveType" substitutionGroup="gml:_Curve"/>
	<!-- =========================================================== -->
	<complexType name="CompositeCurveType">
		<annotation>
			<documentation>A CompositeCurve is defined by a sequence of (orientable) curves such that the each curve in the sequence terminates at the start point of the subsequent curve in the list.</documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractCurveType">
				<sequence>
					<element ref="gml:curveMember" maxOccurs="unbounded">
						<annotation>
							<documentation>This element references or contains one curve in the composite curve. The curves are contiguous, the collection of curves is ordered.
NOTE: This definition allows for a nested structure, i.e. a CompositeCurve may use, for example, another CompositeCurve as a curve member.</documentation>
						</annotation>
					</element>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- ============================================================== -->
	<complexType name="CompositeCurvePropertyType">
		<sequence minOccurs="0">
			<element ref="gml:CompositeCurve"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =========================================================== -->
	<element name="CompositeSurface" type="gml:CompositeSurfaceType" substitutionGroup="gml:_Surface"/>
	<!-- =========================================================== -->
	<complexType name="CompositeSurfaceType">
		<annotation>
			<documentation>A CompositeSurface is defined by a set of orientable surfaces. A composite surface is geometry type with all the geometric properties of a (primitive) surface. Essentially, a composite surface is a collection of surfaces that join in pairs on common boundary curves and which, when considered as a whole, form a single surface.</documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractSurfaceType">
				<sequence>
					<element ref="gml:surfaceMember" maxOccurs="unbounded">
						<annotation>
							<documentation>This element references or contains one surface in the composite surface. The surfaces are contiguous.
NOTE: This definition allows for a nested structure, i.e. a CompositeSurface may use, for example, another CompositeSurface as a member.</documentation>
						</annotation>
					</element>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- ============================================================== -->
	<complexType name="CompositeSurfacePropertyType">
		<sequence minOccurs="0">
			<element ref="gml:CompositeSurface"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =========================================================== -->
	<element name="CompositeSolid" type="gml:CompositeSolidType" substitutionGroup="gml:_Solid"/>
	<!-- =========================================================== -->
	<complexType name="CompositeSolidType">
		<annotation>
			<documentation>A composite solid is a geometry type with all the geometric properties of a (primitive) solid. 
				Essentially, a composite solid is a collection of solids that join in pairs on common boundary surfaces and which, when considered as a whole, form a single solid.</documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractSolidType">
				<sequence>
					<element ref="gml:solidMember" maxOccurs="unbounded">
						<annotation>
							<appinfo>
								<sch:pattern name="Check either href or content not both">
									<sch:rule context="gml:solidMember">
										<sch:extends rule="hrefOrContent"/>
									</sch:rule>
								</sch:pattern>
							</appinfo>
							<documentation>This element references or contains one solid in the composite solid. The solids are contiguous.
NOTE: This definition allows for a nested structure, i.e. a CompositeSolid may use, for example, another CompositeSolid as a member.</documentation>
						</annotation>
					</element>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- ============================================================== -->
	<complexType name="CompositeSolidPropertyType">
		<sequence minOccurs="0">
			<element ref="gml:CompositeSolid"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =========================================================== -->
	<!-- complex/composite geometry objects -->
	<!-- =========================================================== -->
	<element name="GeometricComplex" type="gml:GeometricComplexType" substitutionGroup="gml:_Geometry"/>
	<!-- =========================================================== -->
	<complexType name="GeometricComplexType">
		<annotation>
			<documentation>A geometric complex.</documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractGeometryType">
				<sequence>
					<element name="element" type="gml:GeometricPrimitivePropertyType" maxOccurs="unbounded"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =========================================================== -->
	<complexType name="GeometricComplexPropertyType">
		<annotation>
			<documentation>A property that has a geometric complex as its value domain can either be an appropriate geometry element encapsulated in an element of this type or an XLink reference to a remote geometry element (where remote includes geometry elements located elsewhere in the same document). Either the reference or the contained element must be given, but neither both nor none.
NOTE: The allowed geometry elements contained in such a property (or referenced by it) have to be modelled by an XML Schema choice element since the composites inherit both from geometric complex *and* geometric primitive and are already part of the _GeometricPrimitive substitution group.</documentation>
		</annotation>
		<sequence minOccurs="0">
			<choice>
				<element ref="gml:GeometricComplex"/>
				<element ref="gml:CompositeCurve"/>
				<element ref="gml:CompositeSurface"/>
				<element ref="gml:CompositeSolid"/>
			</choice>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup">
			<annotation>
				<documentation>This attribute group includes the XLink attributes (see xlinks.xsd). XLink is used in GML to reference remote resources (including those elsewhere in the same document). A simple link element can be constructed by including a specific set of XLink attributes. The XML Linking Language (XLink) is currently a Proposed Recommendation of the World Wide Web Consortium. XLink allows elements to be inserted into XML documents so as to create sophisticated links between resources; such links can be used to reference remote properties.
A simple link element can be used to implement pointer functionality, and this functionality has been built into various GML 3 elements by including the gml:AssociationAttributeGroup.</documentation>
			</annotation>
		</attributeGroup>
	</complexType>
	<!-- =========================================================== -->
</schema>
