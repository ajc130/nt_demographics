<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:variable name="root" select="/"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="nt.css" />
                <link
                    href="http://fonts.googleapis.com/css?family=Rock+Salt|Coming+Soon|Architects+Daughter"
                    rel="stylesheet" type="text/css" />
                <title>Characters</title>
            </head>
            <body>
                <xsl:comment>#include virtual="menu.html"</xsl:comment>
                <h3>Characters Mentioned in Paul's Epistles</h3>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Class</th>
                        <th>Ethnicity</th>
                        <th>Number of Books Appearing In </th>
                    </tr>
                    <xsl:for-each select="//characters/character">
                        <xsl:sort select="current()/@xml:id"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()/@xml:id"/>
                                
                            </td>
                            <td>
                                <xsl:value-of
                                    select="current()/@gender"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="current()/@class"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="current()/@ethnicity"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="current()/@books"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
