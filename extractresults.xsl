<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:functx="http://www.functx.com" xmlns:saxon="http://saxon.sf.net/" xmlns:xs="http://www.w3.org/2001/XMLSchema" extension-element-prefixes="saxon" version="2.0">
    <xsl:template match="term">
        <xsl:value-of select="./@uri"/>,<xsl:value-of select="sparql/results/result/binding[@name='o']"/>,<xsl:value-of select="sparql/results/result/binding[@name='label']/literal"/>, <xsl:value-of select="sparql/results/result/binding[@name='desc']/literal"/>    
    </xsl:template>    
</xsl:stylesheet>