//
//  JJMenuButton.h
//
//
//  Created by Jhon Lopez on 2/4/14.
//  Copyright (c) 2014 jaiversin. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    JJMenuPositionTop = 1,
    JJMenuPositionBottom = 2
}JJMenuPosition;

@interface JJMenuButton : UIButton

@property (nonatomic, strong) UIColor *selectedItemColor;

@property (nonatomic) JJMenuPosition menuPosition;

@end
