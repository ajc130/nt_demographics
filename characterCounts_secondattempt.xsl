<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output indent="yes"/>
    <xsl:variable name="root" select="/"/>
    <xsl:template match="/">
        <root>
            <xsl:for-each select="distinct-values(//@ref/tokenize(.,'\s+'))">
                <person>
                    <name>
                        <xsl:value-of select="current()"/>
                    </name>
                    <verse>
                        <xsl:value-of select="count(@ref)"/>
                    </verse>
                </person>
            </xsl:for-each>
        </root>
    </xsl:template>
</xsl:stylesheet>
