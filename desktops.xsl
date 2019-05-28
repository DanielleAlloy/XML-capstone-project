<?xml version="1.0" encoding="UTF-8" ?>
<!--

    Macintosh Desktop Computers Comparison Stylesheet
    BCS 303 - XML - Final Project

    Final Project XSLT Style Sheet
    Author: Danielle Hyland 
    Date:   12/10/18

    Filename:         desktops.xsl
    Supporting Files: 

-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

    <!--The root template; forms the framework of the site-->
     <xsl:template match="/">
        <html>
            <head>
                <title>Machintosh Computers - Desktops</title>
                <link href="final.css" rel="stylesheet" type="text/css" />
           
            </head>
            <body>
            <!--Header image-->
                <header>
                    <img src="header.jpg" alt="Macintosh Computers; a final by Danielle Hyland" />
                </header>
                <!--Navbar code-->
				<nav>
                    <ul>
                        <li><a href="home.xml" alt="Home">Home</a></li>
                        <li><a href="Vocabulary1s.xml" alt="Laptops">Laptops</a></li>
                        <li><a href="Vocabulary2.xml" alt="Desktops">Desktops</a></li>
                        <li><a href="CombinedVocab.xml" alt="Compare">Compare Models</a></li>
                    </ul>
                </nav>

                <!--The main content for the site-->
                <div id="mainContent">
                    <xsl:apply-templates select="desktops/computer" />
                </div>
            <!--Footer code--> 
            <footer>
                <p>Created by Danielle Hyland for BCS 303 - XML Farmingdale State College</p>
            </footer>
            </body>

        </html>

     </xsl:template>
    <!--Adds the computer section to the heading -->
    <!--Includes the computer name, size, modelNumber and dateReleased-->
     <xsl:template match="computer">
        <div id="computer">
            <h1><xsl:value-of select=".//desc" /> </h1>
            <xsl:apply-templates select="model" />
            <xsl:apply-templates select=".//specs"/>
            <xsl:apply-templates select=".//price" />
        </div>
    </xsl:template>

    <!--Add the specs section and formats it-->
    <!--The specs include processor, storageSpace, ram, graphicsCard, display, and touchBar(yes or no; displays an image)-->
    <xsl:template match="specs">
        <div class="specs">
            <ul>
                <li>Processor: <xsl:value-of select="processor" /></li>
                <li>Storage Space: <xsl:value-of select="storageSpace" /></li>
                <li>RAM: <xsl:value-of select="ram" /></li>
                <!--Displays each value for GraphicsCard-->
                <xsl:for-each select="graphicsCard">
                    <li>Graphic Card: <xsl:value-of select="." /></li>
                </xsl:for-each>
                <li>Display: <xsl:value-of select="display" /></li>
                <!--Displays each value for Port-->
                <li>Ports:</li>
                <xsl:for-each select="ports">
                    <li class="if-indent"><xsl:value-of select="." /></li>
                </xsl:for-each>              
            </ul>
        </div>
    </xsl:template>

    <!--Display different product pictures based on the model number attrubute-->
    <xsl:template match="model">
     <h2>Model Number: <xsl:value-of select="./@modelNumber" /></h2>
        <p><xsl:choose>
            <!--If the modelNumber attribute is A1418 display an image of A1418.jpg-->
            <xsl:when test="@modelNumber='A1418'" >
                <img src="A1418.jpg" alt="A1418" />
            </xsl:when>
            <!--If the modelNumber attribute is A1419 display an image of A1419.jpg-->
            <xsl:when test="@modelNumber='A1419'" >
                <img src="A1419.jpg" alt="A1419" />
            </xsl:when>
        </xsl:choose>
        </p>
    </xsl:template>

    <!--Displays the price of computer, Calculates and displays the total cost after taxt -->
    <xsl:template match="price">
        <!--Formats the price to thousands (4 Digits with a comma)-->
        <h1><xsl:value-of select="format-number(.,'$#,#00')" /></h1>
        <!--Store the value of the price times the NYS sales Tax rate (8.275%) in variable taxPrice-->
        <xsl:variable name="taxPrice" select="number(.) * .0875" />
        <!--Formats price to be seen as a number and adds that to taxPrice-->
        <xsl:variable name="fullPrice" select="number(.) + $taxPrice" />
        <!--Formats the fullPrice to thousands (4 Digits with a comma)-->
        <h4 class="price"><xsl:value-of select="format-number($fullPrice,'$#,#00.00')"/> 
        Total price after NY sales tax.</h4>    
    </xsl:template>

</xsl:stylesheet>