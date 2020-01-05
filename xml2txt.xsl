<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <!-- Transformationsdatei für das Topic Modeling der Briefe Hugo Schuchardts aus xml ins txt -->
       
    <xsl:template match="/">
        <xsl:if test="contains(//t:langUsage/t:language[1]/@ident, 'ita') or contains(//t:langUsage/t:language[2]/@ident, 'ita')"><!-- Sprachkürzel anpassen -->
            <!-- Output kontrollieren - wenn Dateien mit einer anderen Sprachendung drinnen landen, dann entscheiden, ob mit beiden Sprachen analysiert werden soll -->
            <xsl:apply-templates select="t:TEI/t:text/t:body/t:div[@type='transcription']" />
        </xsl:if>
               
    </xsl:template>
    
    <xsl:template match="t:TEI/t:text/t:body/t:div[@type='transcription']">
        <xsl:apply-templates />
    </xsl:template>
    
  
    <xsl:template match="t:dateline">
        
    </xsl:template>
    
    <xsl:template match="t:opener">
        
    </xsl:template>
    
    <xsl:template match="t:p">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="t:closer">
      
    </xsl:template>
        
    <xsl:template match="t:note[@type='editorial']" />
    
</xsl:stylesheet>