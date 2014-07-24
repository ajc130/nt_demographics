<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <!-- start of convenience variables; you don't need to use these (you can
    use full XPath expressions instead), but I find that they make the code 
    easier to understand-->
    <xsl:variable name="books" select="collection('books?select=*.xml')" as="document-node()+"/>
    <xsl:variable name="speeches" select="$books//speech"/>
    <xsl:variable name="names" select="$books//name"/>
    <xsl:variable name="descriptions" select="$books//description"/>
    <xsl:variable name="actions" select="$books//action"/>
    <xsl:variable name="distinctAddressees" select="distinct-values($speeches/@audience)"/>
    <xsl:variable name="distinctSpeakers" select="distinct-values($speeches/@ref)"/>
    <xsl:variable name="distinctActors" select="distinct-values($actions/@ref)"/>
    <xsl:variable name="distinctDescribed" select="distinct-values($descriptions/@ref)"/>
    <xsl:variable name="distinctNamed" select="distinct-values($names/@ref)"/>
    <xsl:variable name="characters" select="$books//character"/>
    <xsl:variable name="distinctGenders" select="distinct-values($characters/@gender)"/>
    <xsl:variable name="distinctClasses" select="distinct-values($characters/@class)"/>
    <xsl:variable name="distinctEthnicities" select="distinct-values($characters/@ethnicity)"/>
    <!-- end of convenience variables -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Addressees by gender</title>
            </head>
            <body>
                <h1>Addressees by gender</h1>
                <h2>Summary</h2>
                <table>
                    <tr>
                        <td>Total actions</td>
                        <td>
                            <xsl:value-of select="count($actions)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total names</td>
                        <td>
                            <xsl:value-of select="count($names)"/>
                        </td>
                    </tr><tr>
                        <td>Total descriptions</td>
                        <td>
                            <xsl:value-of select="count($descriptions)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total speeches</td>
                        <td>
                            <xsl:value-of select="count($speeches)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total distinct addressess</td>
                        <td>
                            <xsl:value-of select="count($distinctAddressees)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Distinct Speakers</td>
                        <td>
                            <xsl:value-of select="count($distinctSpeakers)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Distinct Actors</td>
                        <td>
                            <xsl:value-of select="count($distinctActors)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Distinct Described</td>
                        <td>
                            <xsl:value-of select="count($distinctDescribed)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Distinct Named</td>
                        <td>
                            <xsl:value-of select="count($distinctNamed)"/>
                        </td>
                    </tr>
                </table>
                <h2>Results</h2>
             
                <h3>Actor by Gender</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctGenders">
                        <xsl:sort/>
                        <xsl:variable name="charactersByGender"
                            select="$characters[@gender = current()]/@xml:id"/>
                        <xsl:variable name="actorsByGender"
                            select="$actions[tokenize(@ref,'\s+') = $charactersByGender]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($actorsByGender)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Actor by Class</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctClasses">
                        <xsl:sort/>
                        <xsl:variable name="charactersByClass"
                            select="$characters[@class = current()]/@xml:id"/>
                        <xsl:variable name="actorsByClass"
                            select="$actions[tokenize(@ref,'\s+') = $charactersByClass]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($actorsByClass)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Actor by Ethnicity</h3>
                <table>
                    <tr>
                        <th>Ethnicity</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctEthnicities">
                        <xsl:sort/>
                        <xsl:variable name="charactersByEthnicity"
                            select="$characters[@ethnicity = current()]/@xml:id"/>
                        <xsl:variable name="actorsByEthnicity"
                            select="$actions[tokenize(@ref,'\s+') = $charactersByEthnicity]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($actorsByEthnicity)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>described by Gender</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctGenders">
                        <xsl:sort/>
                        <xsl:variable name="charactersByGender"
                            select="$characters[@gender = current()]/@xml:id"/>
                        <xsl:variable name="describedByGender"
                            select="$descriptions[tokenize(@ref,'\s+') = $charactersByGender]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($describedByGender)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>described by Class</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctClasses">
                        <xsl:sort/>
                        <xsl:variable name="charactersByClass"
                            select="$characters[@class = current()]/@xml:id"/>
                        <xsl:variable name="describedByClass"
                            select="$descriptions[tokenize(@ref,'\s+') = $charactersByClass]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($describedByClass)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>described by Ethnicity</h3>
                <table>
                    <tr>
                        <th>Ethnicity</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctEthnicities">
                        <xsl:sort/>
                        <xsl:variable name="charactersByEthnicity"
                            select="$characters[@ethnicity = current()]/@xml:id"/>
                        <xsl:variable name="describedByEthnicity"
                            select="$descriptions[tokenize(@ref,'\s+') = $charactersByEthnicity]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($describedByEthnicity)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Named by Gender</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctGenders">
                        <xsl:sort/>
                        <xsl:variable name="charactersByGender"
                            select="$characters[@gender = current()]/@xml:id"/>
                        <xsl:variable name="namedByGender"
                            select="$names[tokenize(@ref,'\s+') = $charactersByGender]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($namedByGender)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Named by Class</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctClasses">
                        <xsl:sort/>
                        <xsl:variable name="charactersByClass"
                            select="$characters[@class = current()]/@xml:id"/>
                        <xsl:variable name="namedByClass"
                            select="$names[tokenize(@ref,'\s+') = $charactersByClass]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($namedByClass)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Named by Ethnicity</h3>
                <table>
                    <tr>
                        <th>Ethnicity</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctEthnicities">
                        <xsl:sort/>
                        <xsl:variable name="charactersByEthnicity"
                            select="$characters[@ethnicity = current()]/@xml:id"/>
                        <xsl:variable name="namedByEthnicity"
                            select="$names[tokenize(@ref,'\s+') = $charactersByEthnicity]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($namedByEthnicity)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Audience by Gender</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctGenders">
                        <xsl:sort/>
                        <xsl:variable name="charactersByGender"
                            select="$characters[@gender = current()]/@xml:id"/>
                        <xsl:variable name="audiencesByGender"
                            select="$speeches[tokenize(@audience,'\s+') = $charactersByGender]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($audiencesByGender)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Speaker by Gender</h3>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctGenders">
                        <xsl:sort/>
                        <xsl:variable name="charactersByGender"
                            select="$characters[@gender = current()]/@xml:id"/>
                        <xsl:variable name="speakerByGender"
                            select="$speeches[tokenize(@ref,'\s+') = $charactersByGender]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($speakerByGender)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Audience by Class</h3>
                <table>
                    <tr>
                        <th>Class</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctClasses">
                        <xsl:sort/>
                        <xsl:variable name="charactersByClass"
                            select="$characters[@class = current()]/@xml:id"/>
                        <xsl:variable name="audiencesByClass"
                            select="$speeches[tokenize(@audience,'\s+') = $charactersByClass]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($audiencesByClass)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Speaker by Class</h3>
                <table>
                    <tr>
                        <th>Class</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctClasses">
                        <xsl:sort/>
                        <xsl:variable name="charactersByClass"
                            select="$characters[@class = current()]/@xml:id"/>
                        <xsl:variable name="speakerByClass"
                            select="$speeches[tokenize(@ref,'\s+') = $charactersByClass]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($speakerByClass)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Audience by Ethnicity</h3>
                <table>
                    <tr>
                        <th>Ethnicity</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctEthnicities">
                        <xsl:sort/>
                        <xsl:variable name="charactersByEthnicity"
                            select="$characters[@ethnicity = current()]/@xml:id"/>
                        <xsl:variable name="audiencesByEthnicity"
                            select="$speeches[tokenize(@audience,'\s+') = $charactersByEthnicity]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($audiencesByEthnicity)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Speaker by Ethnicity</h3>
                <table>
                    <tr>
                        <th>Ethnicity</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctEthnicities">
                        <xsl:sort/>
                        <xsl:variable name="charactersByEthnicity"
                            select="$characters[@ethnicity = current()]/@xml:id"/>
                        <xsl:variable name="speakerByEthnicity"
                            select="$speeches[tokenize(@ref,'\s+') = $charactersByEthnicity]"/>
                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>
                            <td>
                                <xsl:value-of select="count($speakerByEthnicity)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
