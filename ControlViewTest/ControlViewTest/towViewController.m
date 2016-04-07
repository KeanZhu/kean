//
//  towViewController.m
//  ControlViewTest
//
//  Created by pinglu on 16/3/7.
//  Copyright © 2016年 pinglu. All rights reserved.
//

#import "towViewController.h"
#import "threeViewController.h"

@interface towViewController ()

@end

@implementation towViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 80, 100, 40);
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    // Do any additional setup after loading the view.
}
-(void)btnAction
{
    
//    CATransition *animation = [CATransition animation];
//    
//    animation.duration = 1.0;
//    
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    
//    animation.type = @"pageUnCurl";
//    
//    animation.type = kCATransitionPush;
//    
//    animation.subtype = kCATransitionFromRight;
//    
//    [self.view.window.layer addAnimation:animation forKey:nil];
    
    threeViewController* threeVC = [[threeViewController alloc] init];
    [self.navigationController pushViewController:threeVC animated:YES];
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
