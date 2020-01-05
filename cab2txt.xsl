<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
       <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="//t:teiHeader">
        
    </xsl:template>
    
    <xsl:template match="//t:back">
        
    </xsl:template>
    
    <xsl:template match="//t:dateline">
        
    </xsl:template>
    
    <xsl:template match="//t:opener">
        
    </xsl:template>
    
    <xsl:template match="//t:closer">
        
    </xsl:template>
    
    <xsl:template match="//div[@type='appendix']">
        
    </xsl:template>
    
    <xsl:template match="//t:text/t:body/t:div[@type='transcription']">
        <xsl:for-each select="//(t:p|t:head)[not(ancestor::t:div[@type='appendix'])]//t:w">
            <xsl:value-of select="t:moot/@lemma"/><xsl:text> </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Zur Ausgabe von listen von Wörtern und ihren Lemmas in Gegenüberstellung: -->
    <!--<xsl:template match="//t:text/t:body/t:div[@type='transcription']">
        <xsl:for-each select="t:p//t:w">
            <xsl:value-of select="."/><xsl:text> : </xsl:text><xsl:value-of select="t:moot/@lemma"/><xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>-->
    
    
</xsl:stylesheet>