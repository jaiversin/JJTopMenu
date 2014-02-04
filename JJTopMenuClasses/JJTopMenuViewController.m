//
//  JJTopMenuViewController.m
//
//
//  Created by Jhon Lopez on 1/31/14.
//  Copyright (c) 2014 jaiversin. All rights reserved.
//

#import "JJTopMenuViewController.h"

#define BUTTON_MARGIN       1.0f

@interface JJTopMenuViewController ()

@end

@implementation JJTopMenuViewController

-(id)initWithMenuItems:(NSArray *)menuItems{
    self = [self initWithMenuItems:menuItems selectedItemColor:nil selectedItemTextColor:nil itemTextColor:nil];
    
    if (self) {

    }
    return self;
}


-(id)initWithMenuItems:(NSArray *)menuItems selectedItemColor:(UIColor *)selectedItemColor{
    self = [self initWithMenuItems:menuItems selectedItemColor:selectedItemColor selectedItemTextColor:nil itemTextColor:nil];
    
    if (self) {
        
    }
    return self;
}

-(id)initWithMenuItems:(NSArray *)menuItems selectedItemColor:(UIColor *)selectedItemColor selectedItemTextColor:(UIColor *)selectedItemTextColor {
    self = [self initWithMenuItems:menuItems selectedItemColor:selectedItemColor selectedItemTextColor:selectedItemTextColor itemTextColor:nil];
    
    if (self) {
        
    }
    return self;
}

-(id)initWithMenuItems:(NSArray *)menuItems selectedItemColor:(UIColor *)selectedItemColor selectedItemTextColor:(UIColor *)selectedItemTextColor itemTextColor:(UIColor *)itemTextColor{
    self = [self init];
    
    if (self) {
        _selectedItemColor = selectedItemColor;
        _selectedItemTextColor = selectedItemTextColor;
        _itemTextColor = itemTextColor;
        [self setMenuItems:menuItems];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(UIColor *)selectedItemColor
{
    if (!_selectedItemColor) {
        _selectedItemColor = [UIColor blueColor];
    }
    return _selectedItemColor;
}

-(UIColor *)itemTextColor
{
    if (!_itemTextColor) {
        _itemTextColor = [UIColor blackColor];
    }
    return _itemTextColor;
}

-(UIColor *)selectedItemTextColor
{
    if (!_selectedItemTextColor) {
        _selectedItemTextColor = [UIColor lightGrayColor];
    }
    return _selectedItemTextColor;
}

#pragma mark - Setting Buttons

- (void)setMenuItems:(NSArray *)menuItems{
    // clean buttons for dynamic adding
    for (id button in self.menuItems) {
        [button removeFromSuperview];
    }
    
    NSMutableArray *buttons = [NSMutableArray arrayWithCapacity:self.menuItems.count];
    
    for (NSUInteger i = 0; i < menuItems.count; i++) {
        JJMenuItem *item = [menuItems objectAtIndex:i];
        [item setSelectedItemColor:self.selectedItemColor];
        [item setSelectedItemTextColor:self.selectedItemTextColor];
        [item setItemTextColor:self.itemTextColor];
        
        [buttons addObject:item.button];
    }
    
    _menuItems = buttons;
    
    // Adding the action to the buttons
    for (id button in self.menuItems) {
        
        [button addTarget:self action:@selector(selectMenuItem:) forControlEvents:UIControlEventTouchDown];
    }
    
    int index = 0;
    for (UIButton *button in self.menuItems) {
        float originX = 0;
        if (index) {
            UIButton *lastButton = self.menuItems[index-1];
            originX = CGRectGetMinX(lastButton.frame) + CGRectGetWidth(lastButton.bounds);
        }
        
        CGRect frame = CGRectMake(originX + BUTTON_MARGIN, 0, button.bounds.size.width, 60.f);
        [button setFrame:frame];
        [self.view addSubview:button];
        index++;
    }
    
    if (self.menuItems && [self.menuItems count] > 0) {
        [self selectMenuItem:self.menuItems[0]];
    }

}

- (void)selectMenuItem:(id)sender
{
    // check for non selected button
    if (self.selectedMenuItem != sender) {
        for (id item in self.menuItems) {
            [item setSelected:NO];
        }
        [sender setSelected:YES];
        self.selectedMenuItem = sender;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(topMenu:didSelectMenuItemAtIndex:)]) {
            [self.delegate topMenu:self didSelectMenuItemAtIndex:[self.menuItems indexOfObject:sender]];
        }
    }
}


@end
