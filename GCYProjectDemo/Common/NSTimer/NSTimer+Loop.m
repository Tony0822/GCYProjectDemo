//
//  NSTimer+Loop.m
//  GCYDemo
//
//  Created by gewara on 17/7/3.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "NSTimer+Loop.h"

@implementation NSTimer (Loop)

-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]]; // 停止
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

- (void)stopTimer
{
    if ([self isValid]) {
        [self invalidate];
    }
}

@end
