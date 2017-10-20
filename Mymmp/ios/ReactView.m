//
//  ReactView.m
//  Mymmp
//
//  Created by 曹江涛 on 2017/9/20.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "ReactView.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@implementation ReactView

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
//    NSString * strUrl = @"http://localhost:8081/index.ios.bundle?platform=ios&dev=true";
//    NSURL * jsCodeLocation = [NSURL URLWithString:strUrl];
//    // 这里的moduleName一定要和下面的index.ios.js里面的注册一样
//    RCTRootView * rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
//                                                         moduleName:@"ReactiOS"
//                                                  initialProperties:nil
//                                                      launchOptions:nil];
    NSURL *jsCodeLocation;
    
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"Mymmp"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    
    [self addSubview:rootView];
    
    rootView.frame = self.bounds;
  }
  return self;
}

@end

