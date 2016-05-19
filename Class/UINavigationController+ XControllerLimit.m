//
//  UINavigationController+XControllerLimit.m
//  OneLucky
//
//  Created by mt on 16/3/28.
//  Copyright © 2016年 X. All rights reserved.
//

#import "UINavigationController+ XControllerLimit.h"

#import <objc/runtime.h>

@interface UINavigationController () 

@end

static NSArray *limitControllers;

@implementation UINavigationController (XControllerLimit)

+(void)load{
    
    /**
     *  游客模式 限制进入(需要登录)的 Controller
     */
    limitControllers = @[@"MessageController"];
    
    /**
     *  methord swizzling
     */
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(pushViewController:animated:)), class_getInstanceMethod([self class], @selector(pushLimit_pushViewController:animated:)));
    
}

-(void)pushLimit_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    /**
     *  在这里加逻辑判断是不是可以进
     */
    __block BOOL allow = YES;
    [limitControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:NSStringFromClass([viewController class])]) {
            
            allow = NO;
            *stop = YES;
        }
    }];
    if (allow) {
        /**
         *  调用 这个自定义的方法 最终会调用系统的 push 方法
         */
        [self pushLimit_pushViewController:viewController animated:animated];
    }
}

@end
