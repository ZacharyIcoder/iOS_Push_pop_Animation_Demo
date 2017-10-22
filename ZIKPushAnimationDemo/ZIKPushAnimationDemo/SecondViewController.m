//
//  SecondViewController.m
//  ZIKPushAnimationDemo
//
//  Created by 孔德志 on 17/10/21.
//  Copyright © 2017年 ZIKong. All rights reserved.
//

#import "SecondViewController.h"
#import "VideoCustomAnimateTransitionPop.h"
#import "VideoSwipeDownInteractiveTransition.h"
@interface SecondViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) VideoSwipeDownInteractiveTransition *transitionController;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [button setTitle:@"pop" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _transitionController = [VideoSwipeDownInteractiveTransition new];
    [self.transitionController wireToViewController:self];


}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (void)buttonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return self.transitionController.interacting ? self.transitionController : nil;
}


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        VideoCustomAnimateTransitionPop *animateTransitionPop = [VideoCustomAnimateTransitionPop new];
        return animateTransitionPop;
    }
    else {
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
