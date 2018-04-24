//
//  GCYDebugLogger.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYDebugLogger.h"
#import "NSString+GCYDebugLog.h"

@implementation GCYDebugLogger
+ (NSString *)logStrFromPath:(NSString *)path {
    NSError* error = nil;
    NSString* formatString = [NSString stringWithContentsOfFile:path
                                                       encoding:NSUTF8StringEncoding
                                                          error:&error];
    
    return formatString;
}

+ (void)writeLogWithFormat:(NSString *)format, ... {
    
}

@end
