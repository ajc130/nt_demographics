<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:variable name="books" select="collection('books?select=*.xml')" as="document-node()+"/>
    <xsl:variable name="characters" select="distinct-values($books//metadata/character/@xml:id)"
        as="xs:string+"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Meep</title>
            </head>
            <body>
                <p>
                    <xsl:text>Number of Characters: </xsl:text>
                    <xsl:value-of select="count($characters)"/>
                </p>
                <p>
                    <xsl:text>Number of women: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@gender='female']/@xml:id))"/>
                </p>

                <p>
                    <xsl:text>Number of men: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@gender='male']/@xml:id))"/>
                     
                    
                </p>
                <p>
                    <xsl:text>Number of persons whose gender is unspecified: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@gender='unspecified']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of groups with persons of all genders: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@gender='both']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of rich people: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='rich']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of poor people: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='poor']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of slaves: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='slave']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of masters: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='master']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of outcasts: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='outcast']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of religious leaders: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='religiousLeader']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of working class people: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='working']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of people whose class is complicated: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='complicated']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Groups of people of all classes: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='all']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of people whose class is unspecified: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@class='unspecified']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of Jews: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@ethnicity='jew']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of Gentiles: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@ethnicity='gentile']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of Samaritans: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@ethnicity='samaritan']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of people whose ethnicity is unspecified: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@ethnicity='unspecified']/@xml:id))"/>
                </p>
                <p>
                    <xsl:text>Number of groups containing people of all ethnicities: </xsl:text>
                    <xsl:value-of select="count(distinct-values($books//metadata/character[@ethnicity='all']/@xml:id))"/>
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
