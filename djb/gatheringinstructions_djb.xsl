<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:variable name="books" select="collection('books')" as="document-node()+"/>
    <xsl:variable name="gsi" select="//$books//gsi" as="element(gsi)+"/>
    <xsl:variable name="esi" select="//$books//esi" as="element(esi)+"/>
    <xsl:variable name="csi" select="//$books//csi" as="element(csi)+"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="nt.css"/>
                <link
                    href="http://fonts.googleapis.com/css?family=Rock+Salt|Coming+Soon|Architects+Daughter"
                    rel="stylesheet" type="text/css"/>
                <title>Instruction</title>
            </head>
            <body>
                <xsl:comment>#include virtual="menu.html"</xsl:comment>
                <h3>Demographically Determined Instructions</h3>
                <p>There are <xsl:value-of select="count($gsi)"/>
                    <code>&lt;gsi&gt;</code> elements in all books, and they are:</p>
                <ol>
                    <xsl:for-each select="$gsi">
                        <xsl:sort select="base-uri(current())"/>
                        <li>
                            <strong>
                                <xsl:value-of
                                    select="substring-before(tokenize(base-uri(current()),'/')[last()],'.xml')"/>
                                <xsl:text>: </xsl:text>
                            </strong>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ol>
                <p>There are <xsl:value-of select="count($esi)"/>
                    <code>&lt;esi&gt;</code> elements in all books, and they are:</p>
                <ol>
                    <xsl:for-each select="$esi">
                        <xsl:sort select="base-uri(current())"/>
                        <li>
                            <strong>
                                <xsl:value-of
                                    select="substring-before(tokenize(base-uri(current()),'/')[last()],'.xml')"/>
                                <xsl:text>: </xsl:text>
                            </strong>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ol>
                <p>There are <xsl:value-of select="count($csi)"/>
                    <code>&lt;csi&gt;</code> elements in all books, and they are:</p>
                <ol>
                    <xsl:for-each select="$csi">
                        <xsl:sort select="base-uri(current())"/>
                        <li>
                            <strong>
                                <xsl:value-of
                                    select="substring-before(tokenize(base-uri(current()),'/')[last()],'.xml')"/>
                                <xsl:text>: </xsl:text>
                            </strong>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ol>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
