//
//  UINavigationController+OneAdd.h
//  OneLucky
//
//  Created by mt on 16/3/28.
//  Copyright © 2016年 imakejoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (OneAdd)

/**
 *  为了解决 连续push的bug
 *  NSInvalidArgumentException Can't add self as subview
 */
//@property (nonatomic ,assign) BOOL one_shouldIgnorePushingViewControllers;

@end
