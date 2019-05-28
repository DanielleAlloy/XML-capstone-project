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
                <title>Machintosh Computers</title>
                <link href="final.css" rel="stylesheet" type="text/css" />
				<script>
				function myFunction() {
  					document.getElementById("computer").innerHTML = "Hello World";
}
</script>
           
            </head>

            <body>
                <header>
                    <h1>Machintosh Computers</h1>
                    <h2>Final Project by Danielle Hyland</h2>
                </header>
				<nav>
                    <ul>
                        <li>Home</li>
                        <li>Laptops</li>
                        <li>Desktops</li>
                        <li>Calculate cost</li>
                    </ul>
                </nav>
				<button onclick="myFunction()">Click me</button>

					<p id="demo"></p>

         <div class="mainContent">
                        <xsl:apply-templates select="//computer"/>
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
        <h2>Model: <xsl:value-of select="model[@modelNumber]" /></h2>
            <h1>Computer<xsl:value-of select="desc" /> </h1>
            
            <xsl:apply-templates select="specs"/>
            <h3><xsl:value-of select="price" /></h3>
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
                <li>Graphic Card: <xsl:value-of select="graphicsCard" /></li>
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



</xsl:stylesheet>