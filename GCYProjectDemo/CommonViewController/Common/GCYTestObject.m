//
//  GCYTestObject.m
//  GCYDemo
//
//  Created by gewara on 17/7/3.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "GCYTestObject.h"

@implementation GCYTestObject
- (instancetype)init {
    self = [super init];
    if (self) {
        D_Log(@"instance %@ has been created!", self);
    }
    return self;
}

- (void)dealloc {
    D_Log(@"instance %@ has been dealloced!", self);
    //[super dealloc];
}
- (void)timerAction:(NSTimer *)timer {
    D_Log(@"hi, timer action for instace %@", self);
}
@end
