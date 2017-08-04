//
//  AFHttpClient.m
//  UncleMarc
//
//  Created by wangjiangjiao on 15/1/13.
//  Copyright (c) 2015年 elong. All rights reserved.
//

#import "AFHttpClient.h"

@interface AFHttpClient ()
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableDictionary *_requestsRecord;
}

@end

@implementation AFHttpClient


+ (AFHttpClient *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
        _requestsRecord = [NSMutableDictionary dictionary];
        _manager.operationQueue.maxConcurrentOperationCount = 10;
    }
    return self;
}



- (NSString *)buildRequestUrl:(WJBaseRequest *)request {
    NSString *detailUrl = [request requestUrl];
    if ([detailUrl hasPrefix:@"http"]) {
        return detailUrl;
    }
    // filter url
      
    NSString *baseUrl;
    if ([request useCDN]) {
        if ([request cdnUrl].length > 0) {
            baseUrl = [request cdnUrl];
        }
    } else {
        if ([request baseUrl].length > 0) {
            baseUrl = [request baseUrl];
        }
    }
    return [NSString stringWithFormat:@"%@%@", baseUrl, detailUrl];
}

- (void)addRequest:(WJBaseRequest *)request {
    WJRequestMethod method = [request requestMethod];
    NSString *url = [self buildRequestUrl:request];
    id param = request.requestArgument;
//    NSLog(@"请求：%@",url);
//    NSLog(@"请求参数:%@",param);
    
//    NSMutableSet *contentTypes = [[NSMutableSet alloc] initWithSet:_manager.responseSerializer.acceptableContentTypes];
    
//    [contentTypes addObject:@"text/html"];//添加类型
    
//    _manager.responseSerializer.acceptableContentTypes = contentTypes;
    
    AFConstructingBlock constructingBlock = [request constructingBodyBlock];
    AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.validatesDomainName = YES;
    _manager.securityPolicy = securityPolicy;

    if (request.requestSerializerType == WJRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    } else if (request.requestSerializerType == WJRequestSerializerTypeJSON) {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    
    // if api need server username and password
    NSArray *authorizationHeaderFieldArray = [request requestAuthorizationHeaderFieldArray];
    if (authorizationHeaderFieldArray != nil) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:(NSString *)authorizationHeaderFieldArray.firstObject
                                                                   password:(NSString *)authorizationHeaderFieldArray.lastObject];
    }
    
    // if api need add custom value to HTTPHeaderField
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            } else {
//                NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    // if api build custom url request
    NSURLRequest *customUrlRequest= [request buildCustomUrlRequest];
    if (customUrlRequest) {
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:customUrlRequest];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self handleRequestResult:operation success:YES];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            request.error = error;
            [self handleRequestResult:operation success:NO];
        }];
        request.requestOperation = operation;
        [_manager.operationQueue addOperation:operation];
    } else {
        if (method == WJRequestMethodGet) {
            request.requestOperation = [_manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"%@",responseObject);
                [self handleRequestResult:operation success:YES];
            }                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                request.error = error;
               //  NSLog(@"%@",error);
                [self handleRequestResult:operation success:NO];
            }];
        } else if (method == WJRequestMethodPost) {
            if (constructingBlock != nil) {
                request.requestOperation = [_manager POST:url parameters:param constructingBodyWithBlock:constructingBlock
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      NSLog(@"xxxx");
                                                      [self handleRequestResult:operation success:YES];
                                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      request.error = error;
                                                      [self handleRequestResult:operation success:NO];
                                                  }];
            } else {
                request.requestOperation = [_manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    [self handleRequestResult:operation success:YES];
                }                                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    request.error = error;
                    [self handleRequestResult:operation success:NO];
                }];
            }
        } else if (method == WJRequestMethodHead) {
            request.requestOperation = [_manager HEAD:url parameters:param success:^(AFHTTPRequestOperation *operation) {
                [self handleRequestResult:operation success:YES];
            }                                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleRequestResult:operation success:NO];
            }];
        } else if (method == WJRequestMethodPut) {
            request.requestOperation = [_manager PUT:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestResult:operation success:YES];
            }                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleRequestResult:operation success:NO];
            }];
        } else if (method == WJRequestMethodDelete) {
            request.requestOperation = [_manager DELETE:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestResult:operation success:YES];
            }                                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleRequestResult:operation success:NO];
            }];
        } else if (method == WJRequestMethodPatch) {
            request.requestOperation = [_manager PATCH:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestResult:operation success:YES];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleRequestResult:operation success:NO];
            }];
        } else {
            NSLog(@"Error, unsupport method type");
            return;
        }
    }
    
    NSLog(@"Add request: %@", NSStringFromClass([request class]));

    [self addOperation:request];
}

- (void)cancelRequest:(WJBaseRequest *)request {
    [request.requestOperation cancel];
   
    [self removeOperation:request.requestOperation];
    [request clearCompletionBlock];
}

- (void)cancelAllRequests {
    NSDictionary *copyRecord = [_requestsRecord copy];
    for (NSString *key in copyRecord) {
        WJBaseRequest *request = copyRecord[key];
        [request stop];
    }
}


- (void)handleRequestResult:(AFHTTPRequestOperation *)operation success:(BOOL)success {
    NSString *key = [self requestHashKey:operation];
    WJBaseRequest *request = _requestsRecord[key];
    
    NSLog(@"Finished Request: %@", NSStringFromClass([request class]));
    if (request) {
    
        if (success) {
            if (request.successCompletionBlock) {
                [request handleRequestResult];
                request.successCompletionBlock(request,request.responseObject);
            }
        } else {
            if (request.failureCompletionBlock) {
                request.failureCompletionBlock(request);
            }
        }
    }
    [self removeOperation:operation];
    [request clearCompletionBlock];
}

- (NSString *)requestHashKey:(AFHTTPRequestOperation *)operation {
    NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)[operation hash]];
    return key;
}

- (void)addOperation:(WJBaseRequest *)request {
    if (request.requestOperation != nil) {
        NSString *key = [self requestHashKey:request.requestOperation];
        _requestsRecord[key] = request;
    }
}

- (void)removeOperation:(AFHTTPRequestOperation *)operation {
      NSString *key = [self requestHashKey:operation];
    if ([_requestsRecord objectForKey:key]) {
          [_requestsRecord removeObjectForKey:key];
    }
  
    NSLog(@"Request queue size = %lu", (unsigned long)[_requestsRecord count]);
}




@end
