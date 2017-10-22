//
//  VideoCustomAnimateTransitionPush.m
//  ZIKPushAnimationDemo
//
//  Created by 孔德志 on 17/10/21.
//  Copyright © 2017年 ZIKong. All rights reserved.
//

#import "VideoCustomAnimateTransitionPush.h"

@implementation VideoCustomAnimateTransitionPush
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    /*
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    // For a Push:
    //      fromView = The current top view controller.
    //      toView   = The incoming view controller.
    // For a Pop:
    //      fromView = The outgoing view controller.
    //      toView   = The new top view controller.
    UIView *fromView;
    UIView *toView;
    
    // In iOS 8, the viewForKey: method was introduced to get views that the
    // animator manipulates.  This method should be preferred over accessing
    // the view of the fromViewController/toViewController directly.
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }

    // If a push is being animated, the incoming view controller will have a
    // higher index on the navigation stack than the current top view
    // controller.
    BOOL isPush = ([toViewController.navigationController.viewControllers indexOfObject:toViewController] > [fromViewController.navigationController.viewControllers indexOfObject:fromViewController]);
    
    // Our animation will be operating on snapshots of the fromView and toView,
    // so the final frame of toView can be configured now.
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    //toView.frame = CGRectMake(0, 568, 375, 568);
    
    // We are responsible for adding the incoming view to the containerView
    // for the transition.
    [containerView addSubview:toView];
    [containerView addSubview:fromView];

    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];

    [UIView  animateWithDuration:transitionDuration delay:0.01 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        toView.frame = CGRectMake(0, 0, 375, 568);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
     */
    // 1. Get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for toVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    //toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    toVC.view.frame = CGRectMake(0, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    /*
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.0//0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionTransitionNone//UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         // 5. Tell context that we completed.
                         [transitionContext completeTransition:YES];
                     }];
     */
    [UIView animateWithDuration:duration animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];

    
}

@end






























