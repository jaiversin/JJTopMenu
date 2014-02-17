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

@synthesize itemTextColor = _itemTextColor, menuPosition = _menuPosition, selectedItemColor = _selectedItemColor, selectedItemTextColor = _selectedItemTextColor;

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

#pragma mark - Default Values
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

-(JJMenuPosition)menuPosition
{
    if (!_menuPosition) {
        _menuPosition = JJMenuPositionTop;
    }
    return _menuPosition;
}

#pragma mark - Setters
-(void)setItemTextColor:(UIColor *)itemTextColor{
    _itemTextColor = itemTextColor;
    [self updateMenuItemsProperties];
}

-(void)setSelectedItemTextColor:(UIColor *)selectedItemTextColor
{
    _selectedItemTextColor = selectedItemTextColor;
    [self updateMenuItemsProperties];
}

-(void)setSelectedItemColor:(UIColor *)selectedItemColor
{
    _selectedItemColor = selectedItemColor;
    [self updateMenuItemsProperties];
}

-(void)setMenuPosition:(JJMenuPosition)menuPosition
{
    _menuPosition = menuPosition;
    [self updateMenuItemsProperties];
}

#pragma mark - Setting Buttons

- (void)setMenuItems:(NSArray *)menuItems{
    // clean buttons for dynamic adding
    for (id button in self.menuItems) {
        [button removeFromSuperview];
    }
    
    _menuItems = menuItems;
    [self updateMenuItemsProperties];
//    NSMutableArray *buttons = [NSMutableArray arrayWithCapacity:self.menuItems.count];
//    
//    for (NSUInteger i = 0; i < menuItems.count; i++) {
//        JJMenuItem *item = [menuItems objectAtIndex:i];
//        [item setSelectedItemColor:self.selectedItemColor];
//        [item setSelectedItemTextColor:self.selectedItemTextColor];
//        [item setItemTextColor:self.itemTextColor];
//        [item setMenuPosition:self.menuPosition];
//        
//        [buttons addObject:item.button];
//    }
//
//    _menuItems = buttons;
    
    int index = 0;
    for (JJMenuItem *menuItem in self.menuItems) {
        JJMenuButton *button = menuItem.button;
        
        float originX = 0;
        if (index) {
            UIButton *lastButton = ((JJMenuItem *)self.menuItems[index-1]).button;
            originX = CGRectGetMinX(lastButton.frame) + CGRectGetWidth(lastButton.bounds);
        }
        
        CGRect frame = CGRectMake(originX + BUTTON_MARGIN, 0, button.bounds.size.width, 60.f);
        [button setFrame:frame];
        [self.view addSubview:button];
        index++;
        
        // Adding the action to the buttons
        [button addTarget:self action:@selector(selectMenuItem:) forControlEvents:UIControlEventTouchDown];
    }
    
    if (self.menuItems && [self.menuItems count] > 0) {
        [self selectMenuItem:((JJMenuItem *)self.menuItems[0]).button];
    }

}

- (void)selectMenuItem:(id)sender
{
    
    JJMenuItem *selectedItem = [self getMenuItemForButton:sender];
    
    // check for non selected button
    if (self.selectedMenuItem != selectedItem) {
        
        for (JJMenuItem *item in self.menuItems) {
            [item.button setSelected:NO];
        }
        
        [selectedItem.button setSelected:YES];
        self.selectedMenuItem = selectedItem;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(topMenu:didSelectMenuItemAtIndex:)]) {
            [self.delegate topMenu:self didSelectMenuItemAtIndex:[self.menuItems indexOfObject:selectedItem]];
        }
    }
}

-(void)selectMenuItemAtIndex:(NSUInteger)index
{
    id itemToSelect = ((JJMenuItem *)self.menuItems[index]).button;
    
    [self selectMenuItem:itemToSelect];
}

-(JJMenuItem *)getMenuItemForButton:(JJMenuButton *)button
{
    for (JJMenuItem *currentItem in self.menuItems) {
        if (currentItem.button == button) {
            return currentItem;
        }
    }
    
    return nil;
}

-(void)updateMenuItemsProperties
{
    
    for (NSUInteger i = 0; i < self.menuItems.count; i++) {
        JJMenuItem *item = [self.menuItems objectAtIndex:i];
        [item setSelectedItemColor:self.selectedItemColor];
        [item setSelectedItemTextColor:self.selectedItemTextColor];
        [item setItemTextColor:self.itemTextColor];
        [item setMenuPosition:self.menuPosition];
        
    }

}

@end
