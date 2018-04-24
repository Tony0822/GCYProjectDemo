//
//  GCYNetworkingConfigure.h
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GCYAPIRequestHttpMethod)
{
    GCYAPIRequestGET = 0,
    GCYAPIRequestPOST = 1 << 0,
    GCYAPIRequestDELETE = 1 << 1,
    GCYAPIRequestPUT = 1 << 2,
    
    GCYAPIRequestPOSTFILE = 1 << 3,
    GCYAPIRequestOtherGET = 1 << 4,
    GCYAPIRequestOtherPOST = 1 <<5,
    GCYAPIRequestNoJsonGET = 1 << 6,
    GCYAPIRequestNoJsonPOST = 1 << 7,
};

typedef NS_ENUM(NSUInteger, GCYAFNetworkingRequestType) {
    GCYAFNetworkingRequestTypeJson = 0,
    GCYAFNetworkingRequestTypeHttp = 1,
    GCYAFNetworkingRequestTypeImage = 2,
};

@interface GCYNetworkingConfigure : NSObject

@property (nonatomic, strong) NSString *URLString;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSDictionary *fileDict;
@property (nonatomic, assign) GCYAPIRequestHttpMethod requestHttpMethod;
@property (nonatomic, assign) GCYAFNetworkingRequestType requestType;
/**
 返回一个配置实例.
 */
+ (instancetype)configurer;
@end
