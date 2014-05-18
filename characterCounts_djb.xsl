<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:variable name="root" select="/"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Characters</title>
            </head>
            <body>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Number of References</td>
                    </tr>
                    <xsl:apply-templates select="//book"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="book">
        <xsl:for-each select="//metadata/character/@xml:id">
            <tr>
                <td>
                    <xsl:value-of select="current()"/>
                </td>
                <td>
                    <xsl:value-of select="count($root//@ref[. eq current()])"/>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>