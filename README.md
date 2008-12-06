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

The Gutterless `box` will even allow nesting of span-x divs, as they will always have a calculable inner-width divisible by 10.  **Note:**  The precise pixel amounts of the box class will disrupt the vertical rhythm promoted by the Blueprint factory setup.  If this is important to you, the box class can always be overwritten back to default values.  Personally, the efficiency and simplicity of the box class with pixel values is of more value to me than ensuring a perfect vertical rhythm.


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
      <div class="box right">
        Menu
      </div>
    </div>
    
We could also use the `left`, `top`, and `bottom` classes to remove other padding on `box` divs.

**Borders** - If you want to add borders to your columns simply add the `border` class to the div like below:
    
    <div class="span-10 border">Content</div>
    
You can also limit borders to one, two or three sides of the div with `border-top`, `border-bottom`, `border-left` and `border-right`:

    <div class="span-10 border-top border-right">Content</div>
    
The `border` classes will account for the additional pixel usage and adjust the div accordingly so as not to disrupt the grid.


## The Semantic Grid - Have your Grid and be semantic too!

If you use [Sass](http://haml.hamptoncatlin.com/docs/rdoc/classes/Sass.html) (and you should), then you can use the [Blueprint](http://www.blueprintcss.org/) grid (or other grid systems) and be "semantic" at the same time.  

### Why should I care?

Let us take a look at a very simple [Blueprint](http://www.blueprintcss.org/) layout as an example:

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

The major criticism of a [Blueprint](http://www.blueprintcss.org/) layout (and other grid layouts) such as this is that all of these "span-x" tags don't give us a whole lot of insight into the underlying _meaning_ of a specific area of a page.  Rather than naming the area which will contain news with an id of "news", we instead gave it a class like "span-30".  This "span-30" may be just fine for display in Firefox, but may make no sense in a mobile browser that has a lot less screen real estate to work with.  Additionally, calling this area out in Javascript is problematic, because we don't have anything unique to latch on to...and even if we did, our Javascript would be mightily confusing.  Sure, we can fix this problem by tossing in another id or class to add this _meaning_, but that adds unnecessary clutter to our layouts.  Even more problematic, in sites with multiple templates (and partials in Rails) and nested divs, revising the span-x values can quickly become a maintenance nightmare.  Worst of all, there is a nearly cult-like group of semantic evangelists that will deride us to no end for breaking the Internet.

### What's a developer to do?

We know that we like the consistency and solid foundation that [Blueprint](http://www.blueprintcss.org/) gives us to rapidly develop layouts.  We also know the caveats of specifying design details in HTML.  Thanks to a little help from our friend, [Sass](http://haml.hamptoncatlin.com/docs/rdoc/classes/Sass.html), we can keep the former and cut the latter.

[Sass](http://haml.hamptoncatlin.com/docs/rdoc/classes/Sass.html) offers a lot of features to more easily manage stylesheets, such as constants, rule nesting and arithmetic.  If you are not using it, I promise you that your stylesheets are much more difficult to maintain than they need to be.  A handy feature of Sass, called "Mixins", allow you to define groups of CSS attributes and include them in multiple selectors throughout a document.

A mixin is defined like so:

    =my-cool-rules
      :color #999
      :border 1px solid red
      :padding 5px
      
This mixin can then be used throughout a Sass document like this:

    #some-other-rule
      :margin-bottom 9px
      :background-color #FFFF00
      +my-cool-rules
      
The resulting CSS will be compiled to:

    #some-other-rule {
      margin-bottom: 9px;
      background-color: #FFFF00;
      color: #999;
      border: 1px solid red;
      padding: 5px;
    }
    
We can leverage the power of mixins to "mixin" the Blueprint "span-x" functionality to a semantic selector rule.  The `semantic_mixins.sass` document in this repository contains mixin declarations for span-x, append-x and prepend-x rules that mimic the rules within a Blueprint stylesheet.  This Sass document was generated specifically for the [Gutterless Blueprint](http://github.com/bilson/gutterless_blueprint_css/tree/master) setup, but this is a method that could be used for any grid system with the help of Sass.

Here is an example span-x mixin declaration:
    
    =span-30
      :width 300px
      :float left
      :margin-right 0px

We can use this is in our main Sass document like this:

    #news
      +span-30

We can do the same for other areas of the page:

    #header
      +span-100
    #menu
      +span-30
    #main_content
      +span-40
    #news
      +span-30
    #footer
      +span-100

If we decide to change the #news section to be 200px in the future, the change only needs to be made in one place.  Also, our layout is not cluttered with extra classes or ids.  And it has _meaning_!  Hooray!  Tell the Semantic Police to get off our backs.

### Installing Semantic Mixins

The simplest way to make use of the semantic mixins is to use the Sass @import directive to import `semantic_mixins.sass` into your main sass file.  Example:
    
    stylesheets/sass/application.sass
    
    // At top of file
    @import ../gutterless_blueprint_css/semantic_mixins.sass

    
    

