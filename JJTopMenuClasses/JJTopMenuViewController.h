//
//  JJTopMenuViewController.h
//
//
//  Created by Jhon Lopez on 1/31/14.
//  Copyright (c) 2014 jaiversin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJMenuItem.h"

@class JJTopMenuViewController;

@protocol JJTopMenuDelegate <NSObject>

@required

-(void)topMenu:(JJTopMenuViewController *)menu didSelectMenuItemAtIndex:(NSUInteger)index;
//-(void)topMenuDidSignout:(JJTopMenuViewController *)menu;

@end

@interface JJTopMenuViewController : UIViewController

//Designated initializer
-(id)initWithMenuItems:(NSArray *)menuItems selectedItemColor:(UIColor *)selectedItemColor selectedItemTextColor:(UIColor *)selectedItemTextColor itemTextColor:(UIColor *)itemTextColor;

-(id)initWithMenuItems:(NSArray *)menuItems selectedItemColor:(UIColor *)selectedItemColor selectedItemTextColor:(UIColor *)selectedItemTextColor;
-(id)initWithMenuItems:(NSArray *)menuItems selectedItemColor:(UIColor *)selectedItemColor;
-(id)initWithMenuItems:(NSArray *)menuItems;


#pragma mark - Protocol Delegate
@property(nonatomic, weak) id delegate;

#pragma mark - Properties
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) JJMenuItem *selectedMenuItem;
@property (nonatomic, strong) UIColor *selectedItemColor;
@property (nonatomic, strong) UIColor *selectedItemTextColor;
@property (nonatomic, strong) UIColor *itemTextColor;
@property (nonatomic) float menuHeight;
@property (nonatomic) JJMenuPosition menuPosition;

#pragma mark - Actions
- (void)selectMenuItem:(id)sender;
-(void)selectMenuItemAtIndex:(NSUInteger)index;

@end
