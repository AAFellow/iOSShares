//
//  AFHttpClient.h
//  UncleMarc
//
//  Created by wangjiangjiao on 15/1/13.
//  Copyright (c) 2015年 elong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WJBaseRequest.h"

@interface AFHttpClient : NSObject

+ (AFHttpClient *)sharedInstance;

- (void)addRequest:(WJBaseRequest *)request;

- (void)cancelRequest:(WJBaseRequest *)request;

- (void)cancelAllRequests;

/// 根据request和networkConfig构建url
- (NSString *)buildRequestUrl:(WJBaseRequest *)request;

@end
