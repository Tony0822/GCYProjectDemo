//
//  GCYNetworkingBase.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYNetworkingBase.h"

@interface GCYNetworkingBase ()

@end

@implementation GCYNetworkingBase

- (id)requestNetworkingConfigure:(GCYNetworkingConfigure *)configure
                         succsee:(SuccessBlock)success
                          notice:(NoticeBlock)notice
                         failure:(FailureBlock)failure {
    
    return [self request:configure succsee:success notice:notice failure:failure];
    
}

- (id)request:(GCYNetworkingConfigure *)configure
      succsee:(SuccessBlock)success
       notice:(NoticeBlock)notice
      failure:(FailureBlock)failure {
    switch (configure.requestHttpMethod) {
        case GCYAPIRequestGET:
        {
            return [self GET:configure.URLString parameters:configure.parameters success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestPOST:
        {
            return [self POST:configure.URLString parameters:configure.parameters success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestDELETE:
        {
            return [self DELETE:configure.URLString parameters:configure.parameters success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestPUT:
        {
            return [self PUT:configure.URLString parameters:configure.parameters success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestPOSTFILE:
        {
            return [self POST:configure.URLString parameters:configure.parameters fileDict:configure.fileDict success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestOtherGET:
        {
            return [self OTHERGET:configure.URLString paramaters:configure.parameters requestType:configure.requestType success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestOtherPOST:
        {
            return [self OTHERPOST:configure.URLString parameters:configure.parameters requestType:configure.requestType success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestNoJsonGET:
        {
            return [self NOJSONGET:configure.URLString parameters:configure.parameters success:success notice:notice failure:failure];
        }
            break;
        case GCYAPIRequestNoJsonPOST:
        {
            return [self NOJSONPOST:configure.URLString parameters:configure.parameters success:success notice:notice failure:failure];
        }
            break;
        default:
            break;
    }
    return nil;
}
    
- (void)cancelAllRequest {
    [self.requestManager.operationQueue cancelAllOperations];
    [self.otherRequestManager.operationQueue cancelAllOperations];
}

#pragma mark -- private
    
- (id)GET:(NSString *)URLString
parameters:(NSDictionary *)parameters
  success:(SuccessBlock)success
   notice:(NoticeBlock)notice
  failure:(FailureBlock)failure {
    
    return [self.requestManager GET:URLString
                         parameters:[self __finalParametersWithParams:parameters]
                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self processSuccessTask:task
                  responseObject:responseObject
                         success:success
                          notice:notice
                         failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self processFailureTask:task
                           error:error
                          notice:notice
                         failure:failure];
    }];
}
- (id)OTHERGET:(NSString *)URLString
    paramaters:(NSDictionary *)paramaters
   requestType:(GCYAFNetworkingRequestType)requestType
       success:(SuccessBlock)success
        notice:(NoticeBlock)notice
       failure:(FailureBlock)failure {
    
    switch (requestType) {
        case GCYAFNetworkingRequestTypeHttp:
        {
            self.otherRequestManager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
        }
            break;
            case GCYAFNetworkingRequestTypeJson:
        {
            self.otherRequestManager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
        }
            break;
            case GCYAFNetworkingRequestTypeImage:
        {
            self.otherRequestManager.responseSerializer = [[AFImageResponseSerializer alloc] init];
        }
            break;
        default:
            break;
    }
    
    return [self.otherRequestManager GET:URLString
                              parameters:paramaters
                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                     if (requestType == GCYAFNetworkingRequestTypeImage) {
                                         success(task, responseObject);
                                     } else {
                                         [self processSuccessTask:task
                                                   responseObject:responseObject
                                                          success:success
                                                           notice:notice
                                                          failure:failure];
                                     }
                                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     if (requestType == GCYAFNetworkingRequestTypeImage) {
                                         failure(task, nil);
                                     } else {
                                         [self processFailureTask:task
                                                            error:error
                                                           notice:notice
                                                          failure:failure];
                                     }
                                 }];
}

- (id)POST:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(NoticeBlock)notice
   failure:(FailureBlock)failure {
    return [self.requestManager POST:URLString
                          parameters:[self __finalParametersWithParams:parameters]
                             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                 [self processSuccessTask:task
                                           responseObject:responseObject
                                                  success:success
                                                   notice:notice
                                                  failure:failure];
                             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                 [self processFailureTask:task
                                                    error:error
                                                   notice:notice
                                                  failure:failure];
                             }];
    
}

- (id)OTHERPOST:(NSString *)URLString
parameters:(NSDictionary *)parameters
     requestType:(GCYAFNetworkingRequestType)requestType
   success:(SuccessBlock)success
    notice:(NoticeBlock)notice
   failure:(FailureBlock)failure {
    
    switch (requestType) {
        case GCYAFNetworkingRequestTypeHttp:
        {
            self.otherRequestManager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
        }
            break;
        case GCYAFNetworkingRequestTypeJson:
        {
            self.otherRequestManager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
        }
            break;
        case GCYAFNetworkingRequestTypeImage:
        {
            self.otherRequestManager.responseSerializer = [[AFImageResponseSerializer alloc] init];
        }
            break;
        default:
            break;
    }
    
    return [self.otherRequestManager POST:URLString
                               parameters:parameters
                                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                      [self processSuccessTask:task
                                                responseObject:responseObject
                                                       success:success
                                                        notice:notice
                                                       failure:failure];
                                  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                      [self processFailureTask:task
                                                         error:error
                                                        notice:notice
                                                       failure:failure];
                                  }];
    
}

- (id)NOJSONPOST:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(NoticeBlock)notice
   failure:(FailureBlock)failure {
    
    return [self.noJsonRequestManager POST:URLString
                                parameters:[self __finalParametersWithParams:parameters]
                                   success:success
                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                       [self processFailureTask:task
                                                          error:error
                                                         notice:notice
                                                        failure:failure];
                                   }];
    
}

- (id)NOJSONGET:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(NoticeBlock)notice
   failure:(FailureBlock)failure {
    
   return [self.noJsonRequestManager GET:URLString
                              parameters:[self __finalParametersWithParams:parameters]
                                 success:success
                                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     [self processFailureTask:task
                                                        error:error
                                                       notice:notice
                                                      failure:failure];
                                 }];
    
}

- (id)PUT:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(NoticeBlock)notice
   failure:(FailureBlock)failure {
    
    return [self.requestManager PUT:URLString
                         parameters:[self __finalParametersWithParams:parameters]
                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                [self processSuccessTask:task
                                          responseObject:responseObject
                                                 success:success
                                                  notice:notice
                                                 failure:failure];
                            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                [self processFailureTask:task
                                                   error:error
                                                  notice:notice
                                                 failure:failure];
                            }];
}

- (id)DELETE:(NSString *)URLString
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
    notice:(NoticeBlock)notice
   failure:(FailureBlock)failure {
    
    return [self.requestManager DELETE:URLString
                            parameters:[self __finalParametersWithParams:parameters]
                               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                   [self processSuccessTask:task
                                             responseObject:responseObject
                                                    success:success
                                                     notice:notice
                                                    failure:failure];
                               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                   [self processFailureTask:task
                                                      error:error
                                                     notice:notice
                                                    failure:failure];
                               }];
}

- (id)POST:(NSString *)URLString
parameters:(NSDictionary *)parameters
  fileDict:(NSDictionary *)fileDict
   success:(SuccessBlock)success
    notice:(NoticeBlock)notice
   failure:(FailureBlock)failure {
    
    return [self.requestManager POST:URLString
                          parameters:[self __finalParametersWithParams:parameters]
           constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
               [formData appendPartWithFileData:fileDict[@"data"]
                                           name:fileDict[@"name"]
                                       fileName:fileDict[@"fileName"]
                                       mimeType:fileDict[@"mimeType"]];
           } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
               [self processSuccessTask:task
                         responseObject:responseObject
                                success:success
                                 notice:notice
                                failure:failure];
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               [self processFailureTask:task
                                  error:error
                                 notice:notice
                                failure:failure];
           }];
}

// 根据业务逻辑处理成功返回的数据
- (void)processSuccessTask:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                   success:(SuccessBlock)success
                    notice:(NoticeBlock)notice
                   failure:(FailureBlock)failure {
    
    
}
// 根据业务逻辑处理请求失败返回的数据
- (void)processFailureTask:(NSURLSessionDataTask *)task
                      error:(NSError *)error
                     notice:(NoticeBlock)notice
                    failure:(FailureBlock)failure {
    if (failure) {
        failure(task, error);
    }
}

- (NSDictionary *)__finalParametersWithParams:(NSDictionary *)params {
    return nil;
}

#pragma mark -- public

+ (NSString *)jsonStringWithObject:(NSObject *)object {
    return object ? [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding] : nil;
}

+ (NSString *)signStringWithParams:(NSDictionary *)params signKey:(NSString *)signKey {
    NSArray *arrSort = [params allKeys];
    NSArray *resultArrSort = [arrSort sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    NSString *str = @"";
    NSString *strResult = @"";
    for (id key in resultArrSort) {
        if ([key isEqualToString:@"test"]) {
            NSString *keyValue = [params objectForKey:key];
            if (![keyValue isKindOfClass:[NSString class]]) {
                continue;
            }
        }
        str = [NSString stringWithFormat:@"%@=%@", key, [params objectForKey:key]];
        strResult = [NSString stringWithFormat:@"%@&%@", strResult, str];
    }
    strResult = [NSString stringWithFormat:@"%@%@", signKey, [strResult substringFromIndex:1]];
    return @"";
}
@end
