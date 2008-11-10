Gutterless Blueprint CSS
========================

### What?
Gutterless Blueprint CSS is an opinionated method and slightly supplemented flavor of the [Blueprint CSS framework](http://github.com/joshuaclayton/blueprint-css/tree/master).  It is a Blueprint setup that never needs to be regenerated.  The default is set to 150 columns, each spanning 10px and with a **0px** gutter width.  The width of the layout is specified by overriding the `container` class in your custom stylesheet.  

### Why?

Blueprint is great, but I often find that the gutters work against me rather than for me.  Sometimes I want a gutter between columns and sometimes not.  Because the Gutterless column widths are only 10px, I am free to use them to create gutters if necessary (though you will see that the `box` class usually makes this unecessary).

### Benefits

- No need to generate new Blueprint files for each layout.  Layout widths are set via the `container` class and the column (10px) and gutter (0px) widths never change.
- Easy math.  No more computing of (column width x 40) - 10px to figure out the amount of space in a column.  Simply add a zero to span-x and you know the exact pixel amount. 
- No need to end rows with the `last` class.  This class simply sets right-margin (gutter) to 0px.  Since we have no gutter, this is unecessary.

### Box is your friend.

Gutterless suggests copious usage of the `box` class.  The defaults of this class have been overriden from percentage based to exact pixel amounts.  Placing a div with the `box` class inside of a column will set 20 pixels of padding within the div.  There are also box classes with pad values from 10 to 100px.  These classes are, unsurprisingly, named `box-1`, `box-2` (same as `box`), `box-3`...`box-10`.  

The Gutterless `box` will even allow nesting of span-x divs, as they will always have a calculable inner-width divisible by 10.


## Simple Tutorial

**Stylesheets** - Place links to the following stylesheets in your page.  Note the addition of `gutterless.css`:

    <link rel="stylesheet" href="css/blueprint/screen.css" type="text/css" media="screen, projection">
    <link rel="stylesheet" href="css/blueprint/gutterless.css" type="text/css" media="screen, projection">
    <link rel="stylesheet" href="css/blueprint/print.css" type="text/css" media="print">    
    <!--[if IE]><link rel="stylesheet" href="css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->

    <link rel="stylesheet" href="css/my_custom_styles.css" type="text/css" media="screen, projection, print">
    

**Layout Width** - Set the width of your layout in your custom stylesheet by overriding the `container` class:

    css/my_custom_styles.css
    
    .container {
      width: 1000px;
    }
    
**Basic Layout** - Below is a basic three column layout with a header and footer.  Note that our left and right columns are 300px and our main content column is 400px.  Our header and footer span the entire layout.  There is no need to add the `last` class to the last column in the middle section because there are no gutter margins to remove.

    <div class="container">
      <div class="span-100">
        Header
      </div>
      <div class="span-30">
        Menu
      </div>
      <div class="span-40">
        Main Content
      </div>
      <div class="span-30">
        News
      </div>
      <div class="span-100">
        Footer
      </div>
    </div>
    
**Padding** - We need some padding around our elements so that the text does not run into the header and the columns to each side.  To do so, we will add a div with the `box` class within each div.  This will add 20 pixels of padding to each.  You now know that the Menu area has exactly 240 pixels (300 - (20 + 20)) of inner width in which to place content.

    <div class="container">
      <div class="span-100">
        Header
      </div>
      <div class="span-30">
        <div class="box">
          Menu
        </div>
      </div>
      <div class="span-40">
        <div class="box">
          Main Content
        </div>
      </div>
      <div class="span-30">
        <div class="box">
          News
        </div>
      </div>
      <div class="span-100">
        Foo
    </div>

**Consistent Spacing** - One issue with the above layout is that the `box` class is adding 20 pixels of right-padding to the Menu area and 20 pixels of left-padding to the Main Content area.  This makes for 40 pixels between the content of the divs.  This may or may not be an issue in your layout, but it is often desirable to have consistent spacing between the outer edges and between content areas.  To solve this problem, we will remove the right-padding of the Menu area by adding the `right` class to the `box` div like so:

    <div class="span-30">
      <div class="box.right">
        Menu
      </div>
    </div>
    
We could also use the `left`, `top`, and `bottom` classes to remove other padding on `box` divs.

** Borders ** - If you want to add borders to your columns simply add the `border` class to the div like below:
    
    <div class="span-10.border">Content</div>
    
You can also limit borders to one, two or three sides of the div with `border-top`, `border-bottom`, `border-left` and `border-right`:

    <div class="span-10.border-top.border-right">Content</div>
    
The `border` classes will account for the additional pixel usage and adjust the div accordingly so as not to disrupt the grid.


## Caveats

- This has not been heavily tested as of yet, so use at your own peril.
- The Gutterless `box` class will disrupt the em-based "baseline" Blueprint default.