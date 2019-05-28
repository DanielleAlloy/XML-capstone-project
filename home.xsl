<?xml version="1.0" encoding="UTF-8" ?>
<!--

    Macintosh Computers Homepage Stylesheet
    BCS 303 - XML - Final Project

    Final Project XSLT Style Sheet
    Author: Danielle Hyland 
    Date:   12/10/18

    Filename:         home.xsl
    Supporting Files: 

-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:lap="http://example.com/laptops"
     xmlns:des="http://example.com/desktops">

    <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

    <!--The root template; forms the framework of the site-->
     <xsl:template match="/">
        <html>
            <head>
                <title>Macintosh Computers - Home</title>
                <link href="final.css" rel="stylesheet" type="text/css" />           
            </head>
            <body>
            <!--Header image-->
                <header>
                    <img src="header.jpg" alt="Macintosh Computers; a final by Danielle Hyland" />
                </header>
                <!--The Navbar code-->
				<nav>
                    <ul>
                        <li><a href="home.xml" alt="Home">Home</a></li>
                        <li><a href="Vocabulary1s.xml" alt="Laptops">Laptops</a></li>
                        <li><a href="Vocabulary2.xml" alt="Desktops">Desktops</a></li>
                        <li><a href="CombinedVocab.xml" alt="Compare">Compare Models</a></li>
                    </ul>
                </nav>
                <!--The main content for the site-->
                <div class="home">
                    <!--Displays and image and link to  Vocabulary1S.xml-->
                    <a href="Vocabulary1s.xml" alt="laptops"><img src="A1708.jpg" alt="laptops" /></a>
                    <!--Displays and image and link to  Vocabulary2.xml-->
                    <a href="Vocabulary2.xml" alt="desktops"><img src="A1418.jpg" class="imgRight" alt="desktops" /></a>
                </div>
            <!--Footer code--> 
            <footer>
                <p>Created by Danielle Hyland for BCS 303 - XML Farmingdale State College</p>
            </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
