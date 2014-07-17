<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xhtml" indent="yes"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:variable name="books" select="collection('books?select=*.xml')" as="document-node()+"/>
    <xsl:template match="/">
      <html>
          <head><title>Speeches</title></head>
          <body>
              
              
              <p>
                  <xsl:text>Number of speches: </xsl:text>
                  <xsl:value-of select="count($books//speech)"/>
              </p>
              <p>
                  <xsl:text>Number of speches by Jesus: </xsl:text>
                  <xsl:value-of select="count($books//speech[@ref='Jesus'])"/>
              </p>
              <p>
                  <xsl:text>Number of speches to Jesus: </xsl:text>
                  <xsl:value-of select="count($books//speech[@audience='Jesus'])"/>
              </p>
          </body>
      </html>
    </xsl:template>  
</xsl:stylesheet>