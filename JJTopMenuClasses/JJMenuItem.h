//
//  JJMenuItem.h
//
//
//  Created by Jhon Lopez on 12/26/13.
//  Copyright (c) 2013 jaiversin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJMenuButton.h"

static float const LEFT_PADDING = 25.0f;
static float const RIGHT_PADDING = 5.0f;
static NSString * const EmptyString = @"";


@interface JJMenuItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) JJMenuButton *button;

@property (nonatomic, strong) UIFont *itemFont;
@property (nonatomic, strong) UIColor *selectedItemColor;
@property (nonatomic, strong) UIColor *selectedItemTextColor;
@property (nonatomic, strong) UIColor *itemTextColor;

@property (nonatomic) JJMenuPosition menuPosition;


+ (id)itemWithTitle:(NSString *)title image:(UIImage *)image;
+ (id)initWithTitle:(NSString *)title image:(UIImage *)image badgeValue:(NSString *)badgeValue;
- (id)initWithTitle:(NSString *)title image:(UIImage *)image;
- (id)initWithTitle:(NSString *)title image:(UIImage *)image badgeValue:(NSString *)badgeValue;
@end
