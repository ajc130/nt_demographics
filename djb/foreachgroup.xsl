<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="metadata">
        <html>
            <head>
                <title>Hi, Mom!</title>
            </head>
            <body>
             <div>    <xsl:for-each-group select="character" group-by="@ethnicity">
                   
                        <h2>
                            <xsl:text>Ethnicity: </xsl:text><xsl:value-of select="current-grouping-key()"/>
                            
                        </h2>
                           <xsl:for-each-group select="current-group()" group-by="@gender">
                               <xsl:sort select="current-grouping-key()"/>
                               <h3> <xsl:text>Gender: </xsl:text><xsl:value-of select="current-grouping-key()"/></h3>
                           
                                <xsl:for-each select="current-group()">
                            <xsl:sort select="@xml:id"/>
                                 <p>
                                <xsl:value-of select="@xml:id"/>
                            </p>
                       
                        
                    </xsl:for-each>
                </xsl:for-each-group> </xsl:for-each-group></div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
