<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:variable name="books" select="collection('books?select=*.xml')" as="document-node()+"/>

    <xsl:variable name="esi" select="$books//esi"/>
    <xsl:variable name="gsi" select="$books//gsi"/>
    <xsl:variable name="csi" select="$books//csi"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Instructions in Epistles</title>
            </head>
            <body>
                <p>
                    <xsl:text>Number of Ethnic Specific Instructions </xsl:text>
                    <xsl:value-of select="count($esi)"/>
                </p>

                <p>
                    <xsl:text>Number of Ethnic Specific Instructions to Jews </xsl:text>
                    <xsl:value-of select="count($esi[@ethnicity='jew'])"/>
                </p>
                <p>
                    <xsl:text>Number of Ethnic Specific Instructions to Gentiles </xsl:text>
                    <xsl:value-of select="count($esi[@ethnicity='gentile'])"/>
                </p>

                <p>
                    <xsl:text>Number of Ethnic Specific Instructions to All Ethnicities </xsl:text>
                    <xsl:value-of select="count($esi[@ethnicity='all'])"/>
                </p>
                <p>
                    <xsl:text>Number of Gender Specific Instructions </xsl:text>
                    <xsl:value-of select="count($gsi)"/>
                </p>
                <p>
                    <xsl:text>Number of Gender Specific Instructions to Men </xsl:text>
                    <xsl:value-of select="count($gsi[@gender='male'])"/>
                </p>
                <p>
                    <xsl:text>Number of Gender Specific Instructions to Women </xsl:text>
                    <xsl:value-of select="count($gsi[@gender='female'])"/>
                </p>
                <p>
                    <xsl:text>Number of Gender Specific Instructions to Both Genders </xsl:text>
                    <xsl:value-of select="count($gsi[@gender='both'])"/>
                </p>
                <p>
                    <xsl:text>Number of Class Specific Instructions </xsl:text>
                    <xsl:value-of select="count($csi)"/>
                </p>

                <p>
                    <xsl:text>Number of Class Specific Instructions to Rich People </xsl:text>
                    <xsl:value-of select="count($csi[@class='rich'])"/>
                </p>
                <p>
                    <xsl:text>Number of Class Specific Instructions to Poor People</xsl:text>
                    <xsl:value-of select="count($csi[@class='poor'])"/>
                </p>

                <p>
                    <xsl:text>Number of Class Specific Instructions to Slaves</xsl:text>
                    <xsl:value-of select="count($csi[@class='slave'])"/>
                </p>
                <p>
                    <xsl:text>Number of Class Specific Instructions to Masters </xsl:text>
                    <xsl:value-of select="count($csi[@class='master'])"/>
                </p>
                <p>
                    <xsl:text>Number of Class Specific Instructions to All Classes </xsl:text>
                    <xsl:value-of select="count($csi[@class='all'])"/>
                </p>
                <h2>Instructions for Men</h2>
                <ul>
                    <xsl:for-each select="$gsi[@gender='male']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>

                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for Women</h2>
                <ul>
                    <xsl:for-each select="$gsi[@gender='female']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for Both Gender</h2>
                <ul>
                    <xsl:for-each select="$gsi[@gender='both']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for Jews</h2>
                <ul>
                    <xsl:for-each select="$esi[@ethnicity='jew']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for Gentiles</h2>
                <ul>
                    <xsl:for-each select="$esi[@ethnicity='gentile']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for All Ethnic Groups</h2>
                <ul>
                    <xsl:for-each select="$esi[@ethnicity='all']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for the Rich</h2>
                <ul>
                    <xsl:for-each select="$csi[@class='rich']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for the Poor</h2>
                <ul>
                    <xsl:for-each select="$csi[@class='poor']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for Slaves</h2>
                <ul>
                    <xsl:for-each select="$csi[@class='slave']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for Masters</h2>
                <ul>
                    <xsl:for-each select="$csi[@class='master']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <h2>Instructions for all Classes</h2>
                <ul>
                    <xsl:for-each select="$csi[@class='all']">
                        <xsl:sort/>
                        <xsl:variable name="bookTitle" select="//title"/>
                        
                        <li>
                            <xsl:value-of select="$bookTitle"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()/preceding::c[1]/@n"/>
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="current()/preceding::v[1]/@n"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="current()"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>

    </xsl:template>


</xsl:stylesheet>
