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
                <link rel="stylesheet" type="text/css" href="nt.css"/>
                <link
                    href="http://fonts.googleapis.com/css?family=Rock+Salt|Coming+Soon|Architects+Daughter"
                    rel="stylesheet" type="text/css"/>
                <title>Characters</title>
            </head>
            <body>
                <xsl:comment>#include virtual="menu.html"</xsl:comment>
                <h2>The Characters of the New Testament</h2>
                <h3>Women</h3>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Ethnicity</td>
                        <td>Class</td>
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                        <td>Total Mentions</td>
                        <td>Books Mentioned In</td>
                    </tr>
                    <xsl:for-each
                        select="distinct-values($books//metadata/character[@gender='female']/@xml:id)">
                        <xsl:sort/>
                        <xsl:variable name="currentCharacter"
                            select="$books//metadata/character[@xml:id = current()]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@ethnicity)"
                                />
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@class)"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//name/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//action/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//description/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//speech/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>

                                <xsl:value-of select="count($books//@ref[. = current()])"/>
                            </td>
                            <td>

                                <xsl:value-of select="count($books[.//@xml:id = current()])"/>
                            </td>

                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Men</h3>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Ethnicity</td>
                        <td>Class</td>
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                        <td>Total Mentions</td>
                        <td>Books Mentioned In</td>
                    </tr>
                    <xsl:for-each
                        select="distinct-values($books//metadata/character[@gender='male']/@xml:id)">
                        <xsl:sort/>
                        <xsl:variable name="currentCharacter"
                            select="$books//metadata/character[@xml:id = current()]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@ethnicity)"
                                />
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@class)"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//name/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//action/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//description/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//speech/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                
                                <xsl:value-of select="count($books//@ref[. = current()])"/>
                            </td>
                            <td>
                                
                                <xsl:value-of select="count($books[.//@xml:id = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Gender-Inclusive Groups</h3>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Ethnicity</td>
                        <td>Class</td>
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                        <td>Total Mentions</td>
                        <td>Books Mentioned In</td>
                    </tr>
                    <xsl:for-each
                        select="distinct-values($books//metadata/character[@gender='both']/@xml:id)">
                        <xsl:sort/>
                        <xsl:variable name="currentCharacter"
                            select="$books//metadata/character[@xml:id = current()]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@ethnicity)"
                                />
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@class)"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//name/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//action/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//description/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//speech/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                
                                <xsl:value-of select="count($books//@ref[. = current()])"/>
                            </td>
                            <td>
                                
                                <xsl:value-of select="count($books[.//@xml:id = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Persons and Grops of Unknown Gender</h3>
                <table>
                    <tr>
                        <td>Name</td>
                        <td>Ethnicity</td>
                        <td>Class</td>
                        <td>Name Usages</td>
                        <td>Actions</td>
                        <td>Descriptions</td>
                        <td>Speeches</td>
                        <td>Total Mentions</td>
                        <td>Books Mentioned In</td>
                    </tr>
                    <xsl:for-each
                        select="distinct-values($books//metadata/character[@gender='unspecified']/@xml:id)">

                        <xsl:sort/>
                        <xsl:variable name="currentCharacter"
                            select="$books//metadata/character[@xml:id = current()]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@ethnicity)"
                                />
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@class)"/>
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//name/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//action/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//description/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                <xsl:value-of
                                    select="count($books//speech/@ref[tokenize(.,'\s+') = current()])"
                                />
                            </td>
                            <td>
                                
                                <xsl:value-of select="count($books//@ref[. = current()])"/>
                            </td>
                            <td>
                                
                                <xsl:value-of select="count($books[.//@xml:id = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
