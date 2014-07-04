<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:variable name="books" select="collection('books?select=*.xml')" as="document-node()+"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Hi, Mom!</title>
            </head>
            <body>
                <div>
                    <xsl:for-each-group select="$books//metadata/character" group-by="@ethnicity">
                        <h2>
                            <xsl:text>Ethnicity: </xsl:text>
                            <xsl:value-of select="current-grouping-key()"/>
                        </h2>
                        <xsl:for-each-group select="current-group()" group-by="@gender">
                            <xsl:sort select="current-grouping-key()"/>
                            <h3>
                                <xsl:text>Gender: </xsl:text>
                                <xsl:value-of select="current-grouping-key()"/>
                            </h3>
                            <xsl:for-each-group select="current-group()" group-by="@class">
                                <xsl:sort select="current-grouping-key()"/>
                                <h4>
                                    <xsl:text>Class: </xsl:text>
                                    <xsl:value-of select="current-grouping-key()"/>
                                </h4>
                                <xsl:for-each select="distinct-values(current-group()/@xml:id)">
                                    <xsl:sort select="current()"/>
                                    <p>
                                        <xsl:value-of select="current()"/>
                                    </p>
                                </xsl:for-each>
                            </xsl:for-each-group>
                        </xsl:for-each-group>
                    </xsl:for-each-group>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
