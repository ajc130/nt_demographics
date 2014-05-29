<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <!-- $books is a sequence of documents, read from the "books" subdirectory of wherever the XSLT file is being run -->
    <xsl:variable name="books" select="collection('books')" as="document-node()+"/>
    <!-- because some characters appear in multiple books, we use the distinct values of the @xml:id attributes to get rid of the duplicates -->
   <xsl:variable name="characters" select="distinct-values($books//metadata/character/@xml:id)" as="xs:string+"/>
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
                <h3>Characters Mentioned in Paul's Epistles</h3>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Class</th>
                        <th>Ethnicity</th>
                        <th>Number of Books</th>
                        <th>Number of Appearances</th>
                    </tr>
                    <xsl:for-each select="$characters">
                        <xsl:sort/>
                        <xsl:variable name="currentCharacter" select="$books//metadata/character[@xml:id = current()]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@gender)"/>
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@class)"/>
                            </td>
                            <td>
                                <xsl:value-of select="distinct-values($currentCharacter/@ethnicity)"/>
                            </td>
                            <td>
                                <!-- $books is a sequence of documents, and this counts the number of them that contain the @xml:id we're looking at -->
                                <xsl:value-of select="count($books[.//@xml:id = current()])"
                                />
                            </td>
                            <td>
                                <!-- We count the total number of @ref values in all books that are equal to the @xml:id that we're looking at -->
                                <xsl:value-of select="count($books//@ref[. = current()])"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
