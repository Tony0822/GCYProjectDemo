//
//  GCYNetworkingBase.h
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "GCYNetworkingConfigure.h"


#define REQUEST_DOMAIN_APPKEY @"80"
#define kAPITimeOut 60

typedef void (^FileSuccessBlock)(NSString *filePath);
typedef void (^FileFailureBlock)(NSError *error);

typedef void (^SuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^FailureBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void (^NoticeBlock)(NSURLSessionDataTask *task, id responseObject);

@interface GCYNetworkingBase : NSObject
@property (nonatomic, strong) GCYNetworkingConfigure *apiConfigure;
@property (nonatomic, strong) AFHTTPSessionManager *requestManager;
@property (nonatomic, strong) AFHTTPSessionManager *otherRequestManager;
@property (nonatomic, strong) AFHTTPSessionManager *noJsonRequestManager;

- (id)requestNetworkingConfigure:(GCYNetworkingConfigure *)configure
                         succsee:(SuccessBlock)success
                          notice:(NoticeBlock)notice
                         failure:(FailureBlock)failure;

- (void)cancelAllRequest;

+ (NSString *)jsonStringWithObject:(NSObject *)object;

+ (NSString *)signStringWithParams:(NSDictionary *)params
                           signKey:(NSString *)signKey;


@end
