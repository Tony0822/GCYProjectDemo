//
//  GCYDevice.h
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/1/26.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCYDevice : NSObject
+ (NSString *)getCarrier;
+ (NSString *)getSSID;
+ (NSString *)getbSSID;
@end
