//
//  WJBaseRequest.m
//  UncleMarc
//
//  Created by wangjiangjiao on 15/1/14.
//  Copyright (c) 2015年 elong. All rights reserved.
//

#import "WJBaseRequest.h"
#import "AFHttpClient.h"
#import "objc/runtime.h"
static char getParamDic;
@implementation WJBaseRequest




/// for subclasses to overwrite
- (void)requestCompleteFilter {
}

- (void)requestFailedFilter {
}

- (NSString *)requestUrl {
    return @"";
}

- (NSString *)cdnUrl {
    return @"";
}

- (NSString *)baseUrl {
    return @"";
}

- (NSTimeInterval)requestTimeoutInterval {
    return 10;
}

- (id)requestArgument {
    return nil;
}

- (id)cacheFileNameFilterForRequestArgument:(id)argument {
    return argument;
}

- (WJRequestMethod)requestMethod {
    return WJmethod;
}

- (WJRequestSerializerType)requestSerializerType {
    return WJRequestSerializerTypeHTTP;
}

- (NSArray *)requestAuthorizationHeaderFieldArray {
    return nil;
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    
    NSMutableDictionary *header = [NSMutableDictionary dictionary];
    NSArray *languageArray = [NSLocale preferredLanguages];
    if(languageArray.count > 0)
    {
        NSString *language = [languageArray objectAtIndex:0];
        // [request_ addRequestHeader:@"Accept-Language" value:language];
        [header setValue:language forKey:@"Accept-Language"];
    }
    
    return header;
    

}

- (NSURLRequest *)buildCustomUrlRequest {
    return nil;
}

- (BOOL)useCDN {
    return NO;
}

- (id)jsonValidator {
    return nil;
}

- (BOOL)statusCodeValidator {
    NSInteger statusCode = [self responseStatusCode];
    if (statusCode >= 200 && statusCode <=299) {
        return YES;
    } else {
        return NO;
    }
}

- (AFConstructingBlock)constructingBodyBlock {
    return nil;
}

- (NSString *)resumableDownloadPath {
    return nil;
}



/// append self to request queue
- (void)start {
    [[AFHttpClient sharedInstance] addRequest:self];
}

/// remove self from request queue
- (void)stop {
    [[AFHttpClient sharedInstance] cancelRequest:self];
}

- (BOOL)isExecuting {
    return self.requestOperation.isExecuting;
}
- (void)startWithMethod:(WJRequestMethod)method CompletionBlockWithSuccess:(void (^)(WJBaseRequest *request,id responseObject))success
                                    failure:(void (^)(WJBaseRequest *request))failure {
    WJmethod=method;
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

- (void)startWithCompletionBlockWithSuccess:(void (^)(WJBaseRequest *request,id responseObject))success
                                    failure:(void (^)(WJBaseRequest *request))failure {
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

- (void)setCompletionBlockWithSuccess:(void (^)(WJBaseRequest *request,id responseObject))success
                              failure:(void (^)(WJBaseRequest *request))failure {
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

- (void)clearCompletionBlock {
    // nil out to break the retain cycle.
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

- (id)responseJSONObject {
    return self.requestOperation.responseObject;
}

- (NSString *)responseString {
    return self.requestOperation.responseString;
}

- (NSInteger)responseStatusCode {
    return self.requestOperation.response.statusCode;
}

- (NSDictionary *)responseHeaders {
    return self.requestOperation.response.allHeaderFields;
}

//对得到的结果进行处理
- (void)handleRequestResult
{
     
}

- (NSMutableDictionary *)requestParamDictionary{
    NSMutableDictionary *paramDictionary = objc_getAssociatedObject(self, &getParamDic);
    if (paramDictionary) {
        return paramDictionary;
    }
    paramDictionary = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, &getParamDic, paramDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return paramDictionary;
}


- (void)addValue:(id)value forKey:(NSString *)key{
    if (value) {
        NSMutableDictionary *requestDic = [self requestParamDictionary];
//        DLog(@"%@",requestDic.class);
        [requestDic setObject:value forKey:key];
        
//        id requestDic = [self requestParamDictionary];
//        if ([requestDic isKindOfClass:[NSMutableDictionary class]]) {
//            [requestDic setObject:value forKey:key];
//        }else{
////            NSMutableArray
//        }
    }
}
//#pragma mark - Request Accessoies
//
//- (void)addAccessory:(id<YTKRequestAccessory>)accessory {
//    if (!self.requestAccessories) {
//        self.requestAccessories = [NSMutableArray array];
//    }
//    [self.requestAccessories addObject:accessory];
//}

@end
