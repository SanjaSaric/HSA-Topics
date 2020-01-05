<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <xsl:variable name="files" select="collection('hsa_xml/?select*.xml')"/>
    <!-- Tabelle mit Metadaten der Briefe vom Hugo Schuchardt Archiv -->
    <xsl:template match="/">
        
        <html>
        <head>
            <title>Hugo Schuchadt Archiv - Briefe</title>
            <style>
                table {
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
                }
                
                th {
                cursor: pointer;
                }
                
                th, td {
                text-align: left;
                padding: 16px;
               
                }
                
                tr:nth-child(even) {
                background-color: #f2f2f2
                }
                
                
            </style>
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> <xsl:text> </xsl:text> </script>
            <script type="text/javascript" src="./sort_metadata.js">
                <xsl:text> </xsl:text>
            </script>
        </head>    
        <body>
            
            <h1>Hugo Schuchadt Archiv</h1>
            <h2>Liste aller Briefe</h2>
            <p id="count"> </p>
            <button id="count_button">Ausgewählte zählen</button><span> Ergebnis: </span><span id="result"></span>
            
                <table id="myTable">
                    <tr>                       
                        <th>ID <input id="searchFilter_id" type="text" class="container form-control" placeholder="filtern" /></th>
                        <th>Sender <br /> <input id="searchFilter_sender" type="text" class="container form-control" placeholder="filtern" /></th>
                        <th>Empfänger <input id="searchFilter_reciever" type="text" class="container form-control" placeholder="filtern" /></th>
                        <th>Datum <input id="searchFilter_date" type="text" class="container form-control" placeholder="filtern" /></th>
                        <th>Absendeort <input id="searchFilter_place" type="text" class="container form-control" placeholder="filtern" /></th>
                        <th>Sprache <input id="searchFilter_language" type="text" class="container form-control" placeholder="filtern" /></th>
                        <th>Art <input id="searchFilter_type" type="text" class="container form-control" placeholder="filtern" /></th>
                        
                    </tr>
                    
                    <xsl:apply-templates select="$files" />
                                    
                </table>
             
        </body>
    </html>
    </xsl:template>
    
    <xsl:template match="$files">
        <tr>            
            <td class="id">
                <xsl:value-of select="substring-after(//t:idno[@type='PID'], 'o:hsa.letter.')"/>
            </td>
            <td class="sender">
                <xsl:choose>
                    <xsl:when test="//t:correspAction[@type='sending']/t:persName/text()">
                        <xsl:value-of select="//t:correspAction[@type='sending']/t:persName"/>
                    </xsl:when>
                    <xsl:otherwise>
                        Unbekannt
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
                
            </td>
            <td class="reciever">
                <xsl:choose>
                    <xsl:when test="//t:correspAction[@type='receiving']/t:persName/text()">
                        <xsl:value-of select="//t:correspAction[@type='receiving']/t:persName"/>
                    </xsl:when>
                    <xsl:otherwise>
                        Unbekannt
                    </xsl:otherwise>
                </xsl:choose>               
            </td>
            <td class="date">
                <xsl:choose>
                    <xsl:when test="//t:correspAction[@type='sending']/t:date/@when">
                        <xsl:value-of select="//t:correspAction[@type='sending']/t:date/@when"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="//t:correspAction[@type='sending']/t:date"/>
                    </xsl:otherwise>
                </xsl:choose>
                
            </td>
            <td class="place">
                <xsl:choose>
                    <xsl:when test="//t:correspAction[@type='sending']/t:placeName/text()">
                        <xsl:value-of select="//t:correspAction[@type='sending']/t:placeName"/>
                    </xsl:when>
                    <xsl:otherwise>
                        Unbekannt
                    </xsl:otherwise>
                </xsl:choose> 
   
            </td>
            <td class="language">
                <xsl:choose>
                    <xsl:when test="//t:langUsage/t:language/@ident">
                        <xsl:value-of select="//t:langUsage/t:language/@ident"/>
                    </xsl:when>
                    <xsl:otherwise>
                        Unbekannt
                    </xsl:otherwise>
                </xsl:choose> 
                              
            </td>
            <td class="type">
                <xsl:choose>
                    <xsl:when test="//t:objectDesc//text()">
                        <xsl:value-of select="//t:objectDesc"/>
                    </xsl:when>
                    <xsl:otherwise>
                        Unbekannt
                    </xsl:otherwise>
                </xsl:choose>                 
               
            </td>
        </tr>
    </xsl:template>
       
</xsl:stylesheet>