//
//  JJMenuButton.m
//
//
//  Created by Jhon Lopez on 2/4/14.
//  Copyright (c) 2014 jaiversin. All rights reserved.
//

#import "JJMenuButton.h"

@implementation JJMenuButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(UIColor *)selectedItemColor
{
    if (!_selectedItemColor) {
        _selectedItemColor = [UIColor blueColor];
    }
    return _selectedItemColor;
}

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *bezierPath;
    
    // Draw top line
    bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0.0, 0.0)];
    [bezierPath addLineToPoint:CGPointMake(CGRectGetWidth(rect), 0.0)];
    [[UIColor colorWithWhite:197.0/255.0 alpha:0.75] setStroke];
    [bezierPath setLineWidth:1.0];
    [bezierPath stroke];
    
    // Draw bottom line
    bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0.0, CGRectGetHeight(rect))];
    [bezierPath addLineToPoint:CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect))];
    [[UIColor colorWithWhite:197.0/255.0 alpha:0.75] setStroke];
    [bezierPath setLineWidth:1.0];
    [bezierPath stroke];
    
    // Draw an indicator line if tab is selected
    if (self.selected) {
        
        bezierPath = [UIBezierPath bezierPath];
        
        // Draw the indicator
        
        switch (self.menuPosition) {
            case JJMenuPositionBottom:
                [bezierPath moveToPoint:CGPointMake(0.0, CGRectGetHeight(rect) - 1.0)];
                [bezierPath addLineToPoint:CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) - 1.0)];
                break;
            case JJMenuPositionTop:
                [bezierPath moveToPoint:CGPointMake(0.0, 0.0)];
            [bezierPath addLineToPoint:CGPointMake(CGRectGetWidth(rect), 0.0)];
                break;
            default:
                [bezierPath moveToPoint:CGPointMake(0.0, CGRectGetHeight(rect) - 1.0)];
                [bezierPath addLineToPoint:CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) - 1.0)];
                break;
        }
        
        [bezierPath setLineWidth:10.0];
        [self.selectedItemColor setStroke];
        [bezierPath stroke];
    }
}


-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsDisplay];
}

@end
