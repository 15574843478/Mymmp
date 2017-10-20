//
//  RNBridgeModule.m
//  Mymmp
//
//  Created by 曹江涛 on 2017/9/20.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RNBridgeModule.h"
#import <React/RCTBridge.h>
#import "ViewController.h"
#import "AppDelegate.h"

@implementation RNBridgeModule

//@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(RNBridgeModule)
//RN跳转原生界面
RCT_EXPORT_METHOD(RNOpenVC:(NSString *)mgs){
  //主要这里必须使用主线程发送,不然失效
  dispatch_async(dispatch_get_main_queue(), ^{
    ViewController*ocVc = [[ViewController alloc]init];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.nav pushViewController:ocVc animated:YES];
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"RNOpenVC" object:nil];
  });
  
}


@end
