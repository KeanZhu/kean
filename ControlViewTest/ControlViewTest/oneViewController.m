//
//  oneViewController.m
//  ControlViewTest
//
//  Created by pinglu on 16/3/7.
//  Copyright © 2016年 pinglu. All rights reserved.
//

#import "oneViewController.h"
#import "towViewController.h"

@interface oneViewController ()

@end

@implementation oneViewController


-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    UIView* backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-50, self.view.frame.size.height)];
    backView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:backView];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 80, 100, 40);
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [backView addSubview:btn];
    
    
    // Do any additional setup after loading the view.
}

-(void)btnAction
{
//    
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
    
    towViewController* towVC = [[towViewController alloc] init];
    [self.navigationController pushViewController:towVC animated:YES];
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
