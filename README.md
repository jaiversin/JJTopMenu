JJTopMenu
=========

[Beta] Simple top menu with selected indicator.

How to use it
=============

Import this on your controller:

    #import "JJTopMenuViewController.h"

Add a [private] strong property to your controller:

    @interface MyViewController ()

    @property (nonatomic, strong) JJTopMenuViewController *menuVC;

    @end


Then instantiate the JJTopMenuViewController, maybe on your viewDidLoad:

    self.menuVC = [[JJTopMenuViewController alloc] initWithMenuItems:@[ [JJMenuItem initWithTitle:@"item 1" image:[UIImage imageNamed:@"forkandknife"] badgeValue:nil], [JJMenuItem initWithTitle:@"item 2" image:[UIImage imageNamed:@"pinetree"] badgeValue:nil]] selectedItemColor:[UIColor redColor] selectedItemTextColor:[UIColor grayColor] itemTextColor:[UIColor blueColor]];

Here, you can set the Items for the menu (right now you can set the title and the image, the badgeValue is not ready) and the properties:

    selectedItemColor // The color of the underline for the selected item
    selectedItemTextColor // The color of the text for the selected item
    itemTextColor // The color of the normal state of the items
    TODO: Add custom font, background and alignment

After this, make the layout specific settings for the frame of the view on JJTopMenuViewController and add it to the superview:

    self.menuVC.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 60);
    [self.view addSubview:self.menuVC.view];

Set the delegate to handle the menu items selection:

    self.menuVC.delegate = self;


The only (till now) method available on the protocol is the didSelectMenuItemAtIndex:

    -(void)topMenu:(JJTopMenuViewController *)menu didSelectMenuItemAtIndex:(NSUInteger)index;
    

And this is it. All your feedback is appreciated!



[@jaiversin](https://twitter.com/jaiversin "Twitt me!")


License
=======

The MIT License (MIT)

Copyright (c) 2014 Jhon Jaiver López

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
