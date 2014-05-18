<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
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
                        <tr>
                        <xsl:apply-templates select="//book"/>
                       
                        </tr>
                        
                    </table>
                </body>
            </html>
        </xsl:template>
    <xsl:template match="book">
        
        <xsl:apply-templates select="metadata/characters"/>
            <xsl:for-each select="@xml:id"></xsl:for-each>
        <td> <xsl:value-of select="current()"/></td>
    
        <td>
            <xsl:value-of select="body/count(@ref)"></xsl:value-of>
        </td>
        
    </xsl:template>
    </xsl:stylesheet>
