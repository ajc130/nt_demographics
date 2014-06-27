<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


    <xsl:template match="metadata">
        <xsl:for-each-group select="character" group-by="@ethnicity">
            <h2>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>Ethnicity</xsl:text>
            </h2>
            <xsl:for-each select="current-group()">
                <xsl:sort select="@xml:id"/>
                <p>
                    <xsl:value-of select="@xml:id"/>
                </p>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>
