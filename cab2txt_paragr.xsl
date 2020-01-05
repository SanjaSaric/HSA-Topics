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
    
    <xsl:template match="//t:text/t:body/t:div[@type='transcription']//t:p[not(ancestor::t:div[@type='appendix']) and not(ancestor::t:postscript)]">
        
            <xsl:variable name="ord_nmbr"><!-- Variable fürs Zählen der Paragrafen -->
                <xsl:number value="count(ancestor::t:p | preceding::t:p) +1" />
            </xsl:variable>
            <xsl:variable name="base-uri" select="base-uri()"/>
            <xsl:variable name="filename1" select="tokenize($base-uri,'/')[last()]"/>
            <xsl:variable name="filename" select="tokenize($filename1, '.xml')[1]"/>
            <xsl:result-document method="text" href="../hsa_deu_cab_paragraph/{$filename}_x{$ord_nmbr}.txt">             
                    
                        <xsl:for-each select=".//t:w">
                            <xsl:value-of select="t:moot/@lemma"/><xsl:text> </xsl:text>
                        </xsl:for-each>
            
            </xsl:result-document>
        
    </xsl:template>
 
</xsl:stylesheet>