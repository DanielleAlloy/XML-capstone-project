<?xml version="1.0" encoding="UTF-8" ?>
<!--

    Macintosh Laptop/Desktop Computers Comparison Stylesheet
    BCS 303 - XML - Final Project

    Final Project XSLT Style Sheet
    Author: Danielle Hyland 
    Date:   12/10/18

    Filename:         combined.xsl
    Supporting Files: 

-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:lap="http://example.com/laptops"
     xmlns:des="http://example.com/desktops">

     <xsl:variable name="laptopName" select="lap:laptops/lap:computer/lap:desc" />

    <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

    <!--The root template; forms the framework of the site-->
     <xsl:template match="/">
        <html>
            <head>
                <title>Macintosh Computers - Comparision</title>
                <link href="final.css" rel="stylesheet" type="text/css" />
                <!--CSS and jQuery Script code for tabs-->
                <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
                <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                <script>
                    $( function() {
                        $( "#tabs" ).tabs();
                    } );
                </script>
           
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
                <h1>Comparison Tables</h1>
                <p class="center">Compare different models of Macintosh computers. Laptops and desktops are on seperate tabs, for easy comparison.</p> 
                <!--jQuery Tabs-->
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Laptops</a></li>
                        <li><a href="#tabs-2">Desktops</a></li>
                    </ul>
                    <!--jQuery Tabs Content--> 
                    <!--jQuery Laptop data-->   
                    <div id="tabs-1">
                        <h1>Laptop Comparison Table</h1>
                        <xsl:call-template name="drawLaptopTable"> </xsl:call-template>
                    </div>
                    <!--jQuery Desktops data-->
                    <div id="tabs-2">
                        <h1>Desktop Comparison Table</h1>
                        <xsl:call-template name="drawDesktopTable"> </xsl:call-template>
                    </div>
                </div>   
                <!--Was trying to do something but it didn't quite work out
                <xsl:call-template name="drawcheapTable"> 
                    <xsl:with-param name="lapprice" select="number(//lap:price)" />
                </xsl:call-template>-->
            <!--Footer code--> 
            <footer>
                <p>Created by Danielle Hyland for BCS 303 - XML Farmingdale State College</p>
            </footer>
            </body>
        </html>
     </xsl:template>


    <!--Creates the Laptop comparison table-->
    <xsl:template name="drawLaptopTable">
     <!--Laptop Comparison Table-->
        <table id="compare">
            <tr>
                <th>Computer Name</th>
                <th>Specs</th> 
                <th>Price</th> 
                <th>Total Price after NY sales tax</th>
            </tr>
            <xsl:apply-templates select="lap:laptops/lap:computer" />
        </table>
    </xsl:template>

    <!--Creates the Desktop comparison table-->
     <xsl:template name="drawDesktopTable">
        <!--Desktop Comparison Table-->
        <table id="compare">
         <tr>
            <th>Computer Name</th>                    
            <th>Specs</th> 
            <th>Price</th> 
            <th>Total Price after NY sales tax</th>
        </tr>
            <!--Fills the table with data-->
            <xsl:apply-templates select="//des:computer" />
        </table>
        </xsl:template>

    <!--Draw a new table for products under 1500; not working-->
    <xsl:template name="drawcheapTable">
        <xsl:param name="lapprice" />
         <xsl:if test="$lapprice > 1500"> 
         <table id="compare">
            <tr>
                <th>Computer Name</th>
                <th>Specs</th> 
                <th>Price</th> 
                <th>Total Price after NY sales tax</th>
            </tr>
            <xsl:apply-templates select="lap:laptops/lap:computer" />
        </table>
        </xsl:if>
    </xsl:template>

    <!--Adds the laptop info to the table -->
    <!--Includes the Laptop computer name, size and dateReleased-->
     <xsl:template match="lap:computer">
        <tr>
            <td><xsl:value-of select=".//lap:desc" /></td>
            <xsl:apply-templates select=".//lap:specs" />
            <xsl:apply-templates select=".//lap:price" />
        </tr>
    </xsl:template>

    <!--Add the specs section to the table and formats it-->
    <!--The specs include processor, storageSpace, ram, graphicsCard, display, and touchBar(yes or no;)-->
    <xsl:template match="lap:specs">
        <td class="specs">
            <ul>
                <li>Processor: <xsl:value-of select="lap:processor" /></li>
                <li>Storage Space: <xsl:value-of select="lap:storageSpace" /></li>
                <li>RAM: <xsl:value-of select="lap:ram" /></li>
                <!--Displays each value for GraphicsCard-->
                <li><b>Graphics Card:</b></li>
                <xsl:for-each select="lap:graphicsCard">
                    <li class="if-indent"><xsl:value-of select="." /></li>
                </xsl:for-each>
                <li>Display: <xsl:value-of select="lap:display" /></li>
                <li>Touch Bar: <xsl:apply-templates select="lap:touchBar" /></li>                 
            </ul>
        </td>
    </xsl:template>

    <!--If the touchBar='yes' display 'Yes', if the touchBar='no' displays 'No'-->
    <xsl:template match="lap:touchBar">
        <xsl:choose>
            <!--If the touchBar is included display a green 'Yes'-->
            <xsl:when test=".='yes'" >
            <span class="yes">Yes</span>
            </xsl:when>
            <!--If the touchBar is not included display a red 'No'-->
            <xsl:when test=".='no'" >
            <span class="no">No</span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!--Displays the price of computer, Calculates and displays the total cost after taxt -->
    <xsl:template match="lap:price">
        <!--Formats the price to thousands (4 Digits with a comma)-->
        <td><xsl:value-of select="format-number(.,'$#,#00')" /></td>
        <!--Store the value of the price times the NYS sales Tax rate (8.275%) in variable taxPrice-->
        <xsl:variable name="taxPrice" select="number(.) * .0875" />
        <!--Formats price from string to a number and adds that to taxPrice-->
        <xsl:variable name="fullPrice" select="number(.) + $taxPrice" />
        <!--Formats the fullPrice to thousands (4 Digits with a comma)-->
        <td class="priceTable"><xsl:value-of select="format-number($fullPrice,'$#,#00.00')"/> </td>    
    </xsl:template>

    <!--Adds the computer section to the heading -->
    <!--Includes the computer name, size, modelNumber and dateReleased-->
     <xsl:template match="des:computer">
        <tr>
            <td><xsl:value-of select=".//des:desc" /></td>
            <xsl:apply-templates select=".//des:specs" />
            <xsl:apply-templates select=".//des:price" />
        </tr>
    </xsl:template>

    <!--Add the specs section and formats it-->
    <!--The specs include processor, storageSpace, ram, graphicsCard, display, and touchBar(yes or no; displays an image)-->
    <xsl:template match="des:specs">
        <td class="specs">
            <ul>
                <li>Processor: <xsl:value-of select="des:processor" /></li>
                <li>Storage Space: <xsl:value-of select="des:storageSpace" /></li>
                <li>RAM: <xsl:value-of select="des:ram" /></li>
                <!--Displays each value for GraphicsCard-->
                <xsl:for-each select="des:graphicsCard">
                    <li>Graphic Card: <xsl:value-of select="." /></li>
                </xsl:for-each>
                <li>Display: <xsl:value-of select="des:display" /></li>
                <!--Displays each value for Port-->
                <li><b>Ports:</b></li>
                <xsl:for-each select="des:ports">
                    <li class="if-indent"><xsl:value-of select="." /></li>
                </xsl:for-each>              
            </ul>
        </td>
    </xsl:template>

    <!--Displays the price of computer, Calculates and displays the total cost after taxt -->
    <xsl:template match="des:price">
        <!--Formats the price to thousands (4 Digits with a comma)-->
        <td><xsl:value-of select="format-number(.,'$#,#00')" /></td>
        <!--Store the value of the price times the NYS sales Tax rate (8.275%) in variable taxPrice-->
        <xsl:variable name="taxPrice" select="number(.) * .0875" />
        <!--Formats price to be seen as a number and adds that to taxPrice-->
        <xsl:variable name="fullPrice" select="number(.) + $taxPrice" />
        <!--Formats the fullPrice to thousands (4 Digits with a comma)-->
        <td class="priceTable"><xsl:value-of select="format-number($fullPrice,'$#,#00.00')"/> </td>    
    </xsl:template>
</xsl:stylesheet>