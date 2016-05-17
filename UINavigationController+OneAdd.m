//
//  UINavigationController+OneAdd.m
//  OneLucky
//
//  Created by mt on 16/3/28.
//  Copyright © 2016年 imakejoy. All rights reserved.
//

#import "UINavigationController+OneAdd.h"

//NSString *limitControllers[] = {
//    
//};

@interface UINavigationController () 

@end

static NSArray *limitControllers;

//static char one_shouldIgnorePushingViewControllers;

@implementation UINavigationController (OneAdd)

+(void)load{
    limitControllers = @[@"MessageController"];
    
    [self exchangeMethordOld:@selector(pushViewController:animated:) New:@selector(pushLimit_pushViewController:animated:)];
    
    
}

-(void)pushLimit_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    __block BOOL contain = NO;
    [limitControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:NSStringFromClass([viewController class])]) {
            *stop = YES;
            contain = YES;
        }
    }];
    
    if ([[OneDataManager sharedInstance] getRoleInfo] != OneUserRoleTypeCustomer && contain) {
        
        [OneTransitionCenter commonProcess:@"inner://login"];
        
        return ;
    }
    
    [self pushLimit_pushViewController:viewController animated:animated];
    
    
    
}



//associcate

//-(void)setOne_shouldIgnorePushingViewControllers:(BOOL)one_shouldIgnorePushingViewControllers{
//    objc_setAssociatedObject(self, &one_shouldIgnorePushingViewControllers, @(one_shouldIgnorePushingViewControllers), OBJC_ASSOCIATION_ASSIGN);
//}
//
//-(BOOL)one_shouldIgnorePushingViewControllers{
//    return objc_getAssociatedObject(self, &one_shouldIgnorePushingViewControllers);
//}



@end
