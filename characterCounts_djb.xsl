<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:variable name="books" select="collection('books?select=*.xml')" as="document-node()+"/>
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
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                    </tr>
                    <xsl:for-each select="distinct-values($books//metadata/character[@gender='female']/@xml:id) ">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//name/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//action/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//description/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>  <td>
                                <xsl:value-of
                                    select="count($root//speech/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                    </tr>
                    <xsl:for-each select="//metadata/character[@gender='male']/@xml:id ">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//name/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//action/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//description/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>  <td>
                                <xsl:value-of
                                    select="count($root//speech/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                    </tr>
                    <xsl:for-each select="//metadata/character[@gender='both']/@xml:id ">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//name/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//action/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//description/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>  <td>
                                <xsl:value-of
                                    select="count($root//speech/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                    </tr>
                    <xsl:for-each select="//metadata/character[@gender='unspecified']/@xml:id ">
                        <xsl:sort/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//name/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//action/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($root//description/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>  <td>
                                <xsl:value-of
                                    select="count($root//speech/@ref[tokenize(.,'\s+') = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
