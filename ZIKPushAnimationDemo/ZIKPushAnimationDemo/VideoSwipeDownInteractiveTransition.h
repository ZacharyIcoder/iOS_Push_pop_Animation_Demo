//
//  VideoSwipeDownInteractiveTransition.h
//  ZIKPushAnimationDemo
//
//  Created by 孔德志 on 17/10/21.
//  Copyright © 2017年 ZIKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoSwipeDownInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
- (void)wireToViewController:(UIViewController*)viewController;

@end
