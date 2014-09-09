<?xml version="1.0" standalone="no" ?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" language="JavaScript">
	<xsl:template match="/">
	<xsl:for-each select="xwork/package">
		<xsl:apply-templates />
	</xsl:for-each>
	</xsl:template>

	<xsl:template match="action">
		<xsl:value-of select ="../@name"/>,/<xsl:value-of select ="../@name"/>/<xsl:value-of select ="@name"/>.action<br/>
		<xsl:apply-templates />
	</xsl:template>
<!--
	<xsl:template match="name">
		<span xmlname="name"><xsl:value-of /></span>
	</xsl:template>
	<xsl:template match="begin-time">
		<span xmlname="begin-time"><xsl:value-of /></span>
	</xsl:template>
	<xsl:template match="end-time">
		<span xmlname="end-time"><xsl:value-of /></span>
	</xsl:template>
	<xsl:template match="executor">
		<span xmlname="executor"><xsl:value-of /></span>
	</xsl:template>
	<xsl:template match="description">
		<span xmlname="description"><xsl:value-of /></span>
	</xsl:template>
-->
</xsl:stylesheet>
