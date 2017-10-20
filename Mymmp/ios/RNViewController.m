//
//  RNViewController.m
//  Mymmp
//
//  Created by 曹江涛 on 2017/9/20.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RNViewController.h"
#import "ReactView.h"
#import "ViewController.h"
#import "AppDelegate.h"



@interface RNViewController ()

@end

@implementation RNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   ReactView * reactView = [[ReactView alloc] initWithFrame:CGRectMake(0,64,CGRectGetWidth(self.view.bounds), 100)];
  [self.view addSubview:reactView];
  
//  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doNotification:) name:@"RNOpenVC" object:nil];
  
}
//-(void)doNotification:(NSNotification *)notification
//{
//  NSLog(@"成功收到===>通知");
//  //将通知里面的userInfo取出来，使用
////  ViewController *ocVc = [[ViewController alloc]init];
//  BFViewController *ocVc = [[BFViewController alloc]init];
////  UIViewController * rootViewConll = [self getCurrentVC];
//  AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//  [app.nav pushViewController:ocVc animated:YES];
////  [rootViewConll presentViewController:ocVc animated:YES completion:^{
////    
////  }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
