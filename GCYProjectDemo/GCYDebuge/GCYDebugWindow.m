//
//  GCYDebugWindow.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYDebugWindow.h"

@implementation GCYDebugWindow

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    for (UIView *subview in self.subviews)
    {
        if ([subview hitTest:[self convertPoint:point toView:subview] withEvent:event] != nil)
        {
            return YES;
        }
    }
    return NO;
}

- (void)dealloc {
    NSLog(@"GCYDebugWindow dealloc");
}

@end
