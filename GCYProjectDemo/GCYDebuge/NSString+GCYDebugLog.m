//
//  NSString+GCYDebugLog.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "NSString+GCYDebugLog.h"

@implementation NSString (GCYDebugLog)

+ (NSString*)debugLogFilePath {
    static NSString *basicDataPath = nil;
    if (!basicDataPath) {
        basicDataPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        basicDataPath = [NSString stringWithFormat:@"%@/debug", basicDataPath];
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        [fileManager createDirectoryAtPath:basicDataPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return basicDataPath;
}

@end
