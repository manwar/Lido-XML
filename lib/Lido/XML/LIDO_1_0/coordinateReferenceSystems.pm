package Lido::XML::LIDO_1_0::coordinateReferenceSystems;

use Moo;

sub content {
	my @lines = <DATA>;
	join '' , @lines;
}

1;
__DATA__
<?xml version="1.0" encoding="UTF-8"?>
<schema targetNamespace="http://www.opengis.net/gml" xmlns="http://www.w3.org/2001/XMLSchema" xmlns:gml="http://www.opengis.net/gml" elementFormDefault="qualified" version="3.1.1.2" xml:lang="en">
	<annotation>
		<appinfo source="urn:opengis:specification:gml:schema-xsd:coordinateReferenceSystems:3.1.1"/>
		<documentation>How to encode coordinate reference system definitions. Builds on referenceSystems.xsd to encode the data needed to define coordinate reference systems, including the specific subtypes of coordinate reference systems. 
		This schema encodes the Coordinate Reference System (SC_) package of the extended UML Model for OGC Abstract Specification Topic 2: Spatial Referencing by Coordinates, with the exception of the abstract "SC_CRS" class. The "SC_CRS" class is encoded in referenceSystems.xsd, to eliminate the (circular) references from coordinateOperations.xsd to coordinateReferenceSystems.xsd. That UML model is adapted from ISO 19111 - Spatial referencing by coordinates, as described in Annex C of Topic 2. 
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
	<include schemaLocation="coordinateSystems.xsd"/>
	<include schemaLocation="datums.xsd"/>
	<include schemaLocation="coordinateOperations.xsd"/>
	<!-- ======================================================
       elements and types
	====================================================== -->
	<element name="_CoordinateReferenceSystem" type="gml:AbstractReferenceSystemType" abstract="true" substitutionGroup="gml:_CRS">
		<annotation>
			<documentation>A coordinate reference system consists of an ordered sequence of coordinate system axes that are related to the earth through a datum. A coordinate reference system is defined by one datum and by one coordinate system. Most coordinate reference system do not move relative to the earth, except for engineering coordinate reference systems defined on moving platforms such as cars, ships, aircraft, and spacecraft. For further information, see OGC Abstract Specification Topic 2.

Coordinate reference systems are commonly divided into sub-types. The common classification criterion for sub-typing of coordinate reference systems is the way in which they deal with earth curvature. This has a direct effect on the portion of the earth's surface that can be covered by that type of CRS with an acceptable degree of error. The exception to the rule is the subtype "Temporal" which has been added by analogy. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="coordinateReferenceSystemRef" type="gml:CoordinateReferenceSystemRefType"/>
	<!-- =================================================== -->
	<complexType name="CoordinateReferenceSystemRefType">
		<annotation>
			<documentation>Association to a coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:_CoordinateReferenceSystem"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="CompoundCRS" type="gml:CompoundCRSType" substitutionGroup="gml:_CRS"/>
	<!-- =================================================== -->
	<complexType name="CompoundCRSType">
		<annotation>
			<documentation>A coordinate reference system describing the position of points through two or more independent coordinate reference systems. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<element ref="gml:includesCRS" minOccurs="2" maxOccurs="unbounded">
						<annotation>
							<documentation>Ordered sequence of associations to all the component coordinate reference systems included in this compound coordinate reference system. </documentation>
						</annotation>
					</element>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="includesCRS" type="gml:CoordinateReferenceSystemRefType">
		<annotation>
			<documentation>An association to a component coordinate reference system included in this compound coordinate reference system. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="compoundCRSRef" type="gml:CompoundCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="CompoundCRSRefType">
		<annotation>
			<documentation>Association to a compound coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:CompoundCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="GeographicCRS" type="gml:GeographicCRSType" substitutionGroup="gml:_CoordinateReferenceSystem"/>
	<!-- =================================================== -->
	<complexType name="GeographicCRSType">
		<annotation>
			<documentation>A coordinate reference system based on an ellipsoidal approximation of the geoid; this provides an accurate representation of the geometry of geographic features for a large portion of the earth's surface.</documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<element ref="gml:usesEllipsoidalCS"/>
					<element ref="gml:usesGeodeticDatum"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="usesEllipsoidalCS" type="gml:EllipsoidalCSRefType">
		<annotation>
			<documentation>Association to the ellipsoidal coordinate system used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="usesGeodeticDatum" type="gml:GeodeticDatumRefType">
		<annotation>
			<documentation>Association to the geodetic datum used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="geographicCRSRef" type="gml:GeographicCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="GeographicCRSRefType">
		<annotation>
			<documentation>Association to a geographic coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:GeographicCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="VerticalCRS" type="gml:VerticalCRSType" substitutionGroup="gml:_CoordinateReferenceSystem"/>
	<!-- =================================================== -->
	<complexType name="VerticalCRSType">
		<annotation>
			<documentation>A 1D coordinate reference system used for recording heights or depths. Vertical CRSs make use of the direction of gravity to define the concept of height or depth, but the relationship with gravity may not be straightforward. By implication, ellipsoidal heights (h) cannot be captured in a vertical coordinate reference system. Ellipsoidal heights cannot exist independently, but only as an inseparable part of a 3D coordinate tuple defined in a geographic 3D coordinate reference system. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<element ref="gml:usesVerticalCS"/>
					<element ref="gml:usesVerticalDatum"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="usesVerticalCS" type="gml:VerticalCSRefType">
		<annotation>
			<documentation>Association to the vertical coordinate system used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="usesVerticalDatum" type="gml:VerticalDatumRefType">
		<annotation>
			<documentation>Association to the vertical datum used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="verticalCRSRef" type="gml:VerticalCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="VerticalCRSRefType">
		<annotation>
			<documentation>Association to a vertical coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:VerticalCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="GeocentricCRS" type="gml:GeocentricCRSType" substitutionGroup="gml:_CoordinateReferenceSystem"/>
	<!-- =================================================== -->
	<complexType name="GeocentricCRSType">
		<annotation>
			<documentation>A 3D coordinate reference system with the origin at the approximate centre of mass of the earth. A geocentric CRS deals with the earth's curvature by taking a 3D spatial view, which obviates the need to model the earth's curvature. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<choice>
						<element ref="gml:usesCartesianCS"/>
						<element ref="gml:usesSphericalCS"/>
					</choice>
					<element ref="gml:usesGeodeticDatum"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="usesCartesianCS" type="gml:CartesianCSRefType">
		<annotation>
			<documentation>Association to the Cartesian coordinate system used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="usesSphericalCS" type="gml:SphericalCSRefType">
		<annotation>
			<documentation>Association to the spherical coordinate system used by this CRS.</documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="geocentricCRSRef" type="gml:GeocentricCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="GeocentricCRSRefType">
		<annotation>
			<documentation>Association to a geocentric coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:GeocentricCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="_GeneralDerivedCRS" type="gml:AbstractGeneralDerivedCRSType" abstract="true" substitutionGroup="gml:_CoordinateReferenceSystem"/>
	<!-- =================================================== -->
	<complexType name="AbstractGeneralDerivedCRSType" abstract="true">
		<annotation>
			<documentation>A coordinate reference system that is defined by its coordinate conversion from another coordinate reference system (not by a datum). This abstract complexType shall not be used, extended, or restricted, in an Application Schema, to define a concrete subtype with a meaning equivalent to a concrete subtype specified in this document. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<element ref="gml:baseCRS"/>
					<element ref="gml:definedByConversion"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="baseCRS" type="gml:CoordinateReferenceSystemRefType">
		<annotation>
			<documentation>Association to the coordinate reference system used by this derived CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="definedByConversion" type="gml:GeneralConversionRefType">
		<annotation>
			<documentation>Association to the coordinate conversion used to define this derived CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="ProjectedCRS" type="gml:ProjectedCRSType" substitutionGroup="gml:_GeneralDerivedCRS"/>
	<!-- =================================================== -->
	<complexType name="ProjectedCRSType">
		<annotation>
			<documentation>A 2D coordinate reference system used to approximate the shape of the earth on a planar surface, but in such a way that the distortion that is inherent to the approximation is carefully controlled and known. Distortion correction is commonly applied to calculated bearings and distances to produce values that are a close match to actual field values. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractGeneralDerivedCRSType">
				<sequence>
					<element ref="gml:usesCartesianCS"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="projectedCRSRef" type="gml:ProjectedCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="ProjectedCRSRefType">
		<annotation>
			<documentation>Association to a projected coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:ProjectedCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="DerivedCRS" type="gml:DerivedCRSType" substitutionGroup="gml:_GeneralDerivedCRS"/>
	<!-- =================================================== -->
	<complexType name="DerivedCRSType">
		<annotation>
			<documentation>A coordinate reference system that is defined by its coordinate conversion from another coordinate reference system but is not a projected coordinate reference system. This category includes coordinate reference systems derived from a projected coordinate reference system. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractGeneralDerivedCRSType">
				<sequence>
					<element ref="gml:derivedCRSType"/>
					<element ref="gml:usesCS"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="derivedCRSType" type="gml:DerivedCRSTypeType"/>
	<!-- =================================================== -->
	<complexType name="DerivedCRSTypeType">
		<annotation>
			<documentation>Type of a derived coordinate reference system. </documentation>
		</annotation>
		<simpleContent>
			<restriction base="gml:CodeType">
				<attribute name="codeSpace" type="anyURI" use="required">
					<annotation>
						<documentation>Reference to a source of information specifying the values and meanings of all the allowed string values for this DerivedCRSTypeType. </documentation>
					</annotation>
				</attribute>
			</restriction>
		</simpleContent>
	</complexType>
	<!-- =================================================== -->
	<element name="usesCS" type="gml:CoordinateSystemRefType">
		<annotation>
			<documentation>Association to the coordinate system used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="derivedCRSRef" type="gml:DerivedCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="DerivedCRSRefType">
		<annotation>
			<documentation>Association to a non-projected derived coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:DerivedCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="EngineeringCRS" type="gml:EngineeringCRSType" substitutionGroup="gml:_CoordinateReferenceSystem"/>
	<!-- =================================================== -->
	<complexType name="EngineeringCRSType">
		<annotation>
			<documentation>A contextually local coordinate reference system; which can be divided into two broad categories:
- earth-fixed systems applied to engineering activities on or near the surface of the earth;
- CRSs on moving platforms such as road vehicles, vessels, aircraft, or spacecraft.
For further information, see OGC Abstract Specification Topic 2. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<element ref="gml:usesCS"/>
					<element ref="gml:usesEngineeringDatum"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="usesEngineeringDatum" type="gml:EngineeringDatumRefType">
		<annotation>
			<documentation>Association to the engineering datum used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="engineeringCRSRef" type="gml:EngineeringCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="EngineeringCRSRefType">
		<annotation>
			<documentation>Association to an engineering coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:EngineeringCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="ImageCRS" type="gml:ImageCRSType" substitutionGroup="gml:_CoordinateReferenceSystem"/>
	<!-- =================================================== -->
	<complexType name="ImageCRSType">
		<annotation>
			<documentation>An engineering coordinate reference system applied to locations in images. Image coordinate reference systems are treated as a separate sub-type because a separate user community exists for images with its own terms of reference. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<choice>
						<element ref="gml:usesCartesianCS"/>
						<element ref="gml:usesObliqueCartesianCS"/>
					</choice>
					<element ref="gml:usesImageDatum"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="usesObliqueCartesianCS" type="gml:ObliqueCartesianCSRefType">
		<annotation>
			<documentation>Association to the oblique Cartesian coordinate system used by this CRS.</documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="usesImageDatum" type="gml:ImageDatumRefType">
		<annotation>
			<documentation>Association to the image datum used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="imageCRSRef" type="gml:ImageCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="ImageCRSRefType">
		<annotation>
			<documentation>Association to an image coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:ImageCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
	<element name="TemporalCRS" type="gml:TemporalCRSType" substitutionGroup="gml:_CoordinateReferenceSystem"/>
	<!-- =================================================== -->
	<complexType name="TemporalCRSType">
		<annotation>
			<documentation>A 1D coordinate reference system used for the recording of time. </documentation>
		</annotation>
		<complexContent>
			<extension base="gml:AbstractReferenceSystemType">
				<sequence>
					<element ref="gml:usesTemporalCS"/>
					<element ref="gml:usesTemporalDatum"/>
				</sequence>
			</extension>
		</complexContent>
	</complexType>
	<!-- =================================================== -->
	<element name="usesTemporalCS" type="gml:TemporalCSRefType">
		<annotation>
			<documentation>Association to the temporal coordinate system used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="usesTemporalDatum" type="gml:TemporalDatumRefType">
		<annotation>
			<documentation>Association to the temporal datum used by this CRS. </documentation>
		</annotation>
	</element>
	<!-- =================================================== -->
	<element name="temporalCRSRef" type="gml:TemporalCRSRefType"/>
	<!-- =================================================== -->
	<complexType name="TemporalCRSRefType">
		<annotation>
			<documentation>Association to a temporal coordinate reference system, either referencing or containing the definition of that reference system. </documentation>
		</annotation>
		<sequence minOccurs="0">
			<element ref="gml:TemporalCRS"/>
		</sequence>
		<attributeGroup ref="gml:AssociationAttributeGroup"/>
	</complexType>
	<!-- =================================================== -->
</schema>
