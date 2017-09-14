//
//  NSTimer+Loop.h
//  GCYDemo
//
//  Created by gewara on 17/7/3.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Loop)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
