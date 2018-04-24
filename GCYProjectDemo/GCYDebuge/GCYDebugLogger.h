//
//  GCYDebugLogger.h
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import <Foundation/Foundation.h>


#define File_Log(frmt, ...) [GWDebugLogger writeLogWithFormat:(frmt), ## __VA_ARGS__]

@interface GCYDebugLogger : NSObject

+ (NSString*)logStrFromPath:(NSString*)path;

+ (void)writeLogWithFormat:(NSString *)format, ...;

@end
