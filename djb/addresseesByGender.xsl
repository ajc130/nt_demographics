<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <!-- start of convenience variables; you don't need to use these (you can
    use full XPath expressions instead), but I find that they make the code 
    easier to understand-->
    <xsl:variable name="speeches" select="//speech"/>
    <xsl:variable name="distincAddressees" select="distinct-values($speeches/@audience)"/>
    <xsl:variable name="characters" select="//character"/>
    <xsl:variable name="distinctGenders" select="distinct-values($characters/@gender)"/>
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
                        <td>Total speeches</td>
                        <td>
                            <xsl:value-of select="count($speeches)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Total distinct addressess</td>
                        <td>
                            <xsl:value-of select="count($distincAddressees)"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Genders</td>
                        <td>
                            <xsl:value-of select="string-join($distinctGenders,', ')"/>
                        </td>
                    </tr>
                </table>
                <h2>Results</h2>
                <table>
                    <tr>
                        <th>Gender</th>
                        <th>Count</th>
                    </tr>
                    <xsl:for-each select="$distinctGenders">
                        <xsl:sort/>
                        <!-- get the @xml:id values for all characters of only this gender -->
                        <xsl:variable name="charactersByGender"
                            select="$characters[@gender = current()]/@xml:id"/>
                        <!-- to get audiences of this gender:
                        Look at the @audience attribute of each speech
                        Tokenize on white space in case there are multiple white-space separated values (e.g., in case Jesus speaks to two people at once)
                        Use general comparison ("=", not "eq"; see the difference in Kay) to see whether any token equals a character of the desired gender
                        -->
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
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
