<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:variable name="books" select="collection('books')" as="document-node()+"/>
    <xsl:variable name="gsi" select="//$books//gsi"/>
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
                <ul>
                    <xsl:for-each select="$gsi">
                        <xsl:sort/>
                        <li>
                           <xsl:value-of select="$books//$gsi"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
