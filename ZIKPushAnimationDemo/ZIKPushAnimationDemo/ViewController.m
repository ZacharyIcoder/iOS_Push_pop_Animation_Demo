//
//  ViewController.m
//  ZIKPushAnimationDemo
//
//  Created by 孔德志 on 17/10/21.
//  Copyright © 2017年 ZIKong. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "VideoCustomAnimateTransitionPush.h"
@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationController.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (IBAction)buttonClick:(id)sender {
    SecondViewController *secondVC  = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        VideoCustomAnimateTransitionPush *animateTransitionPush = [VideoCustomAnimateTransitionPush new];
        return animateTransitionPush;
    }     
    else {
        return nil;
    }
            
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}












































@end
