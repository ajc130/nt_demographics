<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="b">
   <b>
       <title>
          <xsl:apply-templates select="@n"/>
       </title>
       <body>
           <xsl:apply-templates/>
       </body>
   </b>
    </xsl:template>
    <xsl:template match="c">
        <c n="{@n}"/>
            <xsl:apply-templates/>
      
          
    </xsl:template>
    
    <xsl:template match="v">
        <v n="{@n}"/>
            <xsl:apply-templates/>
        
        
    </xsl:template>
</xsl:stylesheet>