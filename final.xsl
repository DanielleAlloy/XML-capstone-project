<?xml version="1.0" encoding="UTF-8" ?>
<!--
    BCS 303 - XML
    Final Project

    Final Project XSLT Style Sheet
    Author: Danielle Hyland 
    Date:   12/10/18

    Filename:         final.xsl
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
                <title>Macintosh Computers</title>
                <link href="final.css" rel="stylesheet" type="text/css" />
				<script>
				function myFunction() {
  					document.getElementById("computer").innerHTML = "Hello World";
}
</script>
           
            </head>
            <body>
                <header>
                    <img src="header.jpg" alt="Macintosh Computers; a final by Danielle Hyland" />
                </header>
				<nav>
                    <ul>
                        <li><a href="home.xml" alt="Laptops">Home</a></li>
                        <li><a href="Vocabulary1s.xml" alt="Laptops">Laptops</a></li>
                        <li><a href="Vocabulary2.xml" alt="Laptops">Desktops</a></li>
                        <li><a href="CombinedVocab.xml" alt="Laptops">Calculate cost</a></li>
                    </ul>
                </nav>
				<button onclick="myFunction()">Click me</button>

					<p id="demo"></p>

         <div id="mainContent">
            <xsl:apply-templates select="laptops/computer" />
                    </div>
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
                <li>Graphics Card:</li>
                <xsl:for-each select="graphicsCard">
                    <li class="if-indent"><xsl:value-of select="." /></li>
                </xsl:for-each>
                <li>Display: <xsl:value-of select="display" /></li>
                <li>Touch Bar: <xsl:apply-templates select="touchBar" /></li>                 
            </ul>
        </div>
    </xsl:template>

    <!--If the touchBar='yes' include one image, if the touchBar='no' display a different image-->
    <xsl:template match="touchBar">
        <xsl:choose>
            <xsl:when test=".='yes'" >
            Yes
                <img src="touchBar.jpg" alt="Touch Bar Included" />
            </xsl:when>
            <xsl:when test=".='no'" >
            No
                <img src="touchBarNo.jpg" alt="Touch Bar Not Included" />
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!--Display different product pictures based on the model number attrubute-->
    <xsl:template match="model">
     <h2>Model Number: <xsl:value-of select="./@modelNumber" /></h2>
        <p><xsl:choose>
            <xsl:when test="@modelNumber='A1708'" >
                <img src="A1708.jpg" alt="A1708" />
            </xsl:when>
            <xsl:when test="@modelNumber='A1989'" >
                <img src="A1989.jpg" alt="A1989" />
            </xsl:when>
            <xsl:when test="@modelNumber='A1990'" >
                <img src="A1990.jpg" alt="A1990" />
            </xsl:when>
        </xsl:choose>
        </p>
    </xsl:template>

    <!--Displays the price of computer, Calculates and displays the total cost after taxt -->
    <xsl:template match="price">
        <h1><xsl:value-of select="format-number(.,'$#,#00')" /></h1>
        <xsl:variable name="taxPrice" select="number(.) * .0875" />
        <xsl:variable name="fullPrice" select="number(.) + $taxPrice" />
        <h4 class="price"><xsl:value-of select="format-number($fullPrice,'$#,#00.00')"/> 
        Total price after NY sales tax.</h4>    
    </xsl:template>
</xsl:stylesheet>