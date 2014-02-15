//
//  JJMenuItem.m
//
//
//  Created by Jhon Lopez on 12/26/13.
//  Copyright (c) 2013 jaiversin. All rights reserved.
//

#import "JJMenuItem.h"
#import "JJMenuButton.h"

@interface JJMenuItem()

@end

@implementation JJMenuItem

+ (id)itemWithTitle:(NSString *)title image:(UIImage *)image
{
    return [[self alloc] initWithTitle:title image:image];
}


+ (id)initWithTitle:(NSString *)title image:(UIImage *)image badgeValue:(NSString *)badgeValue
{
    return [[self alloc] initWithTitle:title image:image badgeValue:badgeValue];
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image
{
    if ((self = [self initWithTitle:title image:image badgeValue:EmptyString])) {

    }
    return self;
}

-(UIFont *)itemFont
{
    if (!_itemFont) {
        _itemFont =[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f];
    }
    return _itemFont;
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image badgeValue:(NSString *)badgeValue
{
    if(self = [super init]){
        _title = title;
        _button = [JJMenuButton buttonWithType:UIButtonTypeCustom];
        
        [_button.titleLabel setFont:self.itemFont];
        
        //Setting colors
        [_button setTitleColor:self.itemTextColor forState:UIControlStateNormal];
        
        
        [_button setTitleColor:self.selectedItemTextColor forState:UIControlStateSelected];
        [_button setTitleColor:self.selectedItemTextColor forState:UIControlStateHighlighted];
        [_button setSelectedItemColor:self.selectedItemTextColor];
        
        [_button setSelectedItemColor:self.selectedItemColor];
        
        _button.menuPosition = self.menuPosition;
        
        float imageWidth = 0.f;
        if (image) {
            
            [_button setImage:image forState:UIControlStateNormal];
            [_button setImage:image forState:UIControlStateSelected];
            [_button setImage:image forState:UIControlStateHighlighted];
            
            imageWidth = image.size.width;
            
            _button.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 30);
        }
        
        
        
        [_button setTitle:title forState:UIControlStateNormal];
        
        _button.titleEdgeInsets = UIEdgeInsetsMake(0, LEFT_PADDING, 0, RIGHT_PADDING);
        
        CGSize titleSize = [title sizeWithAttributes:@{ NSFontAttributeName: self.itemFont }];
        _button.frame = CGRectMake(_button.frame.origin.x, _button.frame.origin.y, titleSize.width + LEFT_PADDING + RIGHT_PADDING + imageWidth, _button    .frame.size.height);
        
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
    }
    return self;
}

#pragma mark - Setters

-(void)setItemTextColor:(UIColor *)itemTextColor
{
    _itemTextColor = itemTextColor;
    [_button setTitleColor:self.itemTextColor forState:UIControlStateNormal];
}

-(void)setSelectedItemColor:(UIColor *)selectedItemColor
{
    _selectedItemColor = selectedItemColor;
    [_button setSelectedItemColor:self.selectedItemColor];
}

-(void)setSelectedItemTextColor:(UIColor *)selectedItemTextColor
{
    _selectedItemTextColor = selectedItemTextColor;
    [_button setTitleColor:self.selectedItemTextColor forState:UIControlStateSelected];
    [_button setTitleColor:self.selectedItemTextColor forState:UIControlStateHighlighted];
}

-(void)setMenuPosition:(JJMenuPosition)menuPosition
{
    _menuPosition = menuPosition;
    [_button setMenuPosition:menuPosition];
}

@end
