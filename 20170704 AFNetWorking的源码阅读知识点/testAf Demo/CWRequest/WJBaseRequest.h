//
//  WJBaseRequest.h
//  UncleMarc
//
//  Created by wangjiangjiao on 15/1/14.
//  Copyright (c) 2015年 elong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
//#import "AFDownloadRequestOperation.h"

typedef NS_ENUM(NSInteger , WJRequestMethod) {
    WJRequestMethodGet = 0,
    WJRequestMethodPost,
    WJRequestMethodHead,
    WJRequestMethodPut,
    WJRequestMethodDelete,
    WJRequestMethodPatch
};

typedef NS_ENUM(NSInteger , WJRequestSerializerType) {
    WJRequestSerializerTypeHTTP = 0,
    WJRequestSerializerTypeJSON,
};

typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);
//typedef void (^AFDownloadProgressBlock)(AFDownloadRequestOperation *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile);

@interface WJBaseRequest : NSObject
{
    NSInteger WJmethod;
}

// Tag
@property (nonatomic) NSInteger tag;

/// User info
@property (nonatomic, strong) NSDictionary *userInfo;

@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;



@property (nonatomic, strong, readonly) NSDictionary *responseHeaders;

@property (nonatomic, strong, readonly) NSString *responseString;

@property (nonatomic, strong, readonly) id responseJSONObject; //得到未进行处理的返回结果


@property (nonatomic, strong) id responseObject; //得到已经进行处理的返回结果


@property (nonatomic, readonly) NSInteger responseStatusCode;

@property (nonatomic, copy) void (^successCompletionBlock)(WJBaseRequest *request,id responseJSONObject);

@property (nonatomic, copy) void (^failureCompletionBlock)(WJBaseRequest *);

@property (nonatomic, strong) NSMutableArray *requestAccessories;

@property (nonatomic, strong) NSError * error;


@property (nonatomic, assign) BOOL isSuccess; //返回的是否成功
@property (nonatomic, copy) NSString * errorMessage; //返回的错误信息


/// append self to request queue
- (void)start;

/// remove self from request queue
- (void)stop;

- (BOOL)isExecuting;

/// block回调
- (void)startWithMethod:(WJRequestMethod)method CompletionBlockWithSuccess:(void (^)(WJBaseRequest *request,id responseObject))success
                failure:(void (^)(WJBaseRequest *request))failure;

- (void)startWithCompletionBlockWithSuccess:(void (^)(WJBaseRequest *request, id responseObject))success
                                    failure:(void (^)(WJBaseRequest *request))failure;

- (void)setCompletionBlockWithSuccess:(void (^)(WJBaseRequest *request, id responseObject))success
                              failure:(void (^)(WJBaseRequest *request))failure;

/// 把block置nil来打破循环引用
- (void)clearCompletionBlock;

/// Request Accessory，可以hook Request的start和stop
//- (void)addAccessory:(id<YTKRequestAccessory>)accessory;

/// 以下方法由子类继承来覆盖默认值

/// 请求成功的回调
- (void)requestCompleteFilter;

/// 请求失败的回调
- (void)requestFailedFilter;

/// 请求的URL
- (NSString *)requestUrl;

/// 请求的CdnURL
- (NSString *)cdnUrl;

/// 请求的BaseURL
- (NSString *)baseUrl;

/// 请求的连接超时时间，默认为60秒
- (NSTimeInterval)requestTimeoutInterval;

/// 请求的参数列表
- (id)requestArgument;

/// 用于在cache结果，计算cache文件名时，忽略掉一些指定的参数
- (id)cacheFileNameFilterForRequestArgument:(id)argument;

/// Http请求的方法
- (WJRequestMethod)requestMethod;

/// 请求的SerializerType
- (WJRequestSerializerType)requestSerializerType;

/// 请求的Server用户名和密码
- (NSArray *)requestAuthorizationHeaderFieldArray;

/// 在HTTP报头添加的自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary;

/// 构建自定义的UrlRequest，
/// 若这个方法返回非nil对象，会忽略requestUrl, requestArgument, requestMethod, requestSerializerType
- (NSURLRequest *)buildCustomUrlRequest;

/// 是否使用CDN的host地址
- (BOOL)useCDN;

/// 用于检查JSON是否合法的对象
- (id)jsonValidator;

/// 用于检查Status Code是否正常的方法
- (BOOL)statusCodeValidator;

/// 当POST的内容带有文件等富文本时使用
- (AFConstructingBlock)constructingBodyBlock;

/// 当需要断点续传时，指定续传的地址
- (NSString *)resumableDownloadPath;

- (void)handleRequestResult;

- (NSMutableDictionary *)requestParamDictionary;
/*
 *  @param value 值
 *  @param key   键
 */
- (void)addValue:(id)value forKey:(NSString *)key;
@end
