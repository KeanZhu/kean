//
//  ViewController.m
//  ControlViewTest
//
//  Created by pinglu on 16/3/7.
//  Copyright © 2016年 pinglu. All rights reserved.
//

#import "ViewController.h"
#import "oneViewController.h"
#import "TableVIew1.h"
#import "AppDelegate.h"
#import "LocationViewController.h"

@interface ViewController ()

@property (strong ,nonatomic) UIWindow* window;
@property (nonatomic ,strong) UIView* upView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view2];
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 80, 100, 40);
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer* tapgest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tapgest];
    

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tapAction
{
    [self.window resignKeyWindow];
    self.window = nil;
}

-(void)btnAction
{
    
    LocationViewController* locationVC =  [[LocationViewController alloc] init];
    [self.navigationController pushViewController:locationVC animated:YES];
    
//    UIWindow* normalWindow = [[UIWindow alloc] initWithFrame:CGRectMake(50, 0, [UIScreen mainScreen].bounds.size.width-50, [UIScreen mainScreen].bounds.size.height)];
//    normalWindow.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];;
//    normalWindow.windowLevel= UIWindowLevelNormal;
//    normalWindow.hidden = NO;
//    [normalWindow makeKeyAndVisible];
//    
//    oneViewController* oneVC = [[oneViewController alloc] init];
//    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:oneVC];
//    oneVC.view.frame = normalWindow.bounds;
//    normalWindow.rootViewController = nav;
//    self.window = normalWindow; 
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
