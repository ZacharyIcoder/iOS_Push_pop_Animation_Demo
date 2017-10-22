//
//  NormalDismissAnimation.m
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "NormalDismissAnimation.h"

@implementation NormalDismissAnimation
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.2f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1. Get controllers from transition context
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for fromVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
//    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);

    
    // 3. Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];

    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
//        fromVC.view.frame = finalFrame;
        fromVC.view.frame = CGRectMake(initFrame.origin.x+20, finalFrame.origin.y, finalFrame.size.width-40, finalFrame.size.height);

    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if(![transitionContext transitionWasCancelled]){
            [transitionContext completeTransition:YES];
        }
        else {
            [UIView animateWithDuration:duration/2 animations:^{
                fromVC.view.frame = initFrame;
            }];
            [transitionContext completeTransition:NO];
        }
    }];

//    if(![transitionContext transitionWasCancelled]){
//        [UIView animateWithDuration:duration animations:^{
//                //        fromVC.view.frame = finalFrame;
//            fromVC.view.frame = CGRectMake(initFrame.origin.x+20, finalFrame.origin.y, finalFrame.size.width-40, finalFrame.size.height);
//
//        } completion:^(BOOL finished) {
//            [transitionContext completeTransition:YES];
//        }];
//    }
//    else {
//        [transitionContext completeTransition:NO];
//    }
}

@end
